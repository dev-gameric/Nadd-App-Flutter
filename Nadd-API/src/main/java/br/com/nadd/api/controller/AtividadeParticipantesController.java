package br.com.nadd.api.controller;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.AtividadeParticipantes; // Importe a classe AtividadeParticipantes
import br.com.nadd.domain.service.CadastroAtividadeParticipantesService; // Importe o serviço de AtividadeParticipantes
import br.com.nadd.repository.AtividadeParticipantesRepository; // Importe o repositório de AtividadeParticipantes
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RestController
@RequestMapping(value = "/atividade-participantes") // Mude o caminho para "/atividade-participantes"
public class AtividadeParticipantesController {

    @Autowired
    private AtividadeParticipantesRepository atividadeParticipantesRepository; // Use o repositório de AtividadeParticipantes

    @Autowired
    private CadastroAtividadeParticipantesService cadastroAtividadeParticipantes; // Use o serviço de AtividadeParticipantes

    @GetMapping
    public List<AtividadeParticipantes> listar() { // Altere o tipo de retorno para AtividadeParticipantes
        return atividadeParticipantesRepository.listar();
    }

    @GetMapping("/{atividadeParticipantesId}")
    public ResponseEntity<AtividadeParticipantes> buscar(@PathVariable Long atividadeParticipantesId) {
        AtividadeParticipantes atividadeParticipantes = atividadeParticipantesRepository.buscar(atividadeParticipantesId);

        if (atividadeParticipantes != null) {
            return ResponseEntity.ok(atividadeParticipantes);
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public AtividadeParticipantes adicionar(@RequestBody AtividadeParticipantes atividadeParticipantes) { // Altere o tipo de retorno para AtividadeParticipantes
        return cadastroAtividadeParticipantes.salvar(atividadeParticipantes);
    }

    @PutMapping("/{atividadeParticipantesId}")
    public ResponseEntity<AtividadeParticipantes> atualizar(@PathVariable Long atividadeParticipantesId, @RequestBody AtividadeParticipantes atividadeParticipantes) {
        AtividadeParticipantes atividadeParticipantesAtual = atividadeParticipantesRepository.buscar(atividadeParticipantesId);

        if (atividadeParticipantesAtual != null) {
            BeanUtils.copyProperties(atividadeParticipantes, atividadeParticipantesAtual, "id");

            atividadeParticipantesAtual = cadastroAtividadeParticipantes.salvar(atividadeParticipantesAtual);
            return ResponseEntity.ok(atividadeParticipantesAtual);
        }

        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{atividadeParticipantesId}")
    public ResponseEntity<AtividadeParticipantes> remover(@PathVariable Long atividadeParticipantesId) {
        AtividadeParticipantes atividadeParticipantes = atividadeParticipantesRepository.buscar(atividadeParticipantesId);

        try {
            cadastroAtividadeParticipantes.excluir(atividadeParticipantesId);

            return ResponseEntity.noContent().build();

        } catch (EntidadeNaoEncontradaException e) {
            return ResponseEntity.notFound().build();

        } catch (EntidadeEmUsoException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }
}
