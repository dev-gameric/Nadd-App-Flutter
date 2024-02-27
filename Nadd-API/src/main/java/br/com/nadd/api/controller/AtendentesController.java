package br.com.nadd.api.controller;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.Atendentes;
import br.com.nadd.domain.service.CadastroAtendentesService;
import br.com.nadd.repository.AtendenteRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RestController
@RequestMapping(value = "/atendentes")
public class AtendentesController {

    @Autowired
    private AtendenteRepository atendenteRepository;

    @Autowired
    private CadastroAtendentesService cadastroAtendentes;

    @GetMapping
    public List<Atendentes> listar() {
        return atendenteRepository.listar();
    }

    @GetMapping("/{atendentesId}")
    public ResponseEntity<Atendentes> buscar(@PathVariable Long atendentesId) {
        Atendentes atendentes = atendenteRepository.buscar(atendentesId);

        if (atendentes != null) {
            return ResponseEntity.ok(atendentes);
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Atendentes adicionar(@RequestBody Atendentes atendentes) {
        return cadastroAtendentes.salvar(atendentes);
    }

    @PutMapping("/{atendentesId}")
    public ResponseEntity<Atendentes> atualizar(@PathVariable Long atendentesId,
                                               @RequestBody Atendentes atendentes) {
        Atendentes atendenteAtual = atendenteRepository.buscar(atendentesId);

        if (atendenteAtual != null) {
            BeanUtils.copyProperties(atendentes, atendenteAtual, "id");

            atendenteAtual = cadastroAtendentes.salvar(atendenteAtual);
            return ResponseEntity.ok(atendenteAtual);
        }

        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{atendentesId}")
    public ResponseEntity<Atendentes> remover(@PathVariable Long atendentesId) {
        Atendentes atendentes = atendenteRepository.buscar(atendentesId);

        try {
            cadastroAtendentes.excluir(atendentesId);
            return ResponseEntity.noContent().build();
        } catch (EntidadeNaoEncontradaException e) {
            return ResponseEntity.notFound().build();
        } catch (EntidadeEmUsoException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }
}
