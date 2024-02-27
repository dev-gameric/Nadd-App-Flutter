package br.com.nadd.api.controller;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.Participantes;
import br.com.nadd.domain.service.CadastroParticipantesService;
import br.com.nadd.repository.ParticipantesRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RestController
@RequestMapping(value = "/participantes")
public class ParticipantesController {

    @Autowired
    private ParticipantesRepository participantesRepository;

    @Autowired
    private CadastroParticipantesService cadastroParticipantes;

    @GetMapping
    public List<Participantes> listar(){
        return participantesRepository.listar();
    }

    @GetMapping("/{participanteId}")
    public ResponseEntity<Participantes> buscar(@PathVariable Long participanteId){
        Participantes participantes = participantesRepository.buscar(participanteId);

        if (participantes != null) {
            return ResponseEntity.ok(participantes);
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Participantes adicionar (@RequestBody Participantes participantes){
        return cadastroParticipantes.salvar(participantes);
    }

    @PutMapping("/{participanteId}")
    public ResponseEntity<Participantes> atualizar(@PathVariable Long participanteId,
                                                   @RequestBody Participantes participantes){
        Participantes participanteAtual = participantesRepository.buscar(participanteId);

        if(participanteAtual != null) {
            BeanUtils.copyProperties(participantes, participanteAtual, "id");

            participanteAtual = cadastroParticipantes.salvar(participanteAtual);
            return ResponseEntity.ok(participanteAtual);
        }

        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{participanteId}")
    public ResponseEntity<Participantes> remover(@PathVariable Long participanteId){
        Participantes participantes = participantesRepository.buscar(participanteId);

        try {
            cadastroParticipantes.excluir(participanteId);

            return ResponseEntity.noContent().build();
        } catch (EntidadeNaoEncontradaException e){
            return ResponseEntity.notFound().build();
        } catch (EntidadeEmUsoException e){
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }
}
