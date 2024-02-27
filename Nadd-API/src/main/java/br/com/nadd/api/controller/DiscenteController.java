package br.com.nadd.api.controller;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.Discente;
import br.com.nadd.domain.service.CadastroDiscenteService;
import br.com.nadd.repository.DiscenteRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RestController
@RequestMapping(value = "/discentes")
public class DiscenteController {

    @Autowired
    private DiscenteRepository discenteRepository;

    @Autowired
    private CadastroDiscenteService cadastroDiscente;

    @GetMapping
    public List<Discente> listar() {
        return discenteRepository.listar();
    }

    @GetMapping("/{discenteId}")
    public ResponseEntity<Discente> buscar(@PathVariable Long discenteId) {
        Discente discente = discenteRepository.buscar(discenteId);

        if (discente != null) {
            return ResponseEntity.ok(discente);
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Discente adicionar(@RequestBody Discente discente) {
        return cadastroDiscente.salvar(discente);
    }

    @PutMapping("/{discenteId}")
    public ResponseEntity<Discente> atualizar(@PathVariable Long discenteId,
                                              @RequestBody Discente discente) {
        Discente discenteAtual = discenteRepository.buscar(discenteId);

        if (discenteAtual != null) {
            BeanUtils.copyProperties(discente, discenteAtual, "id");

            discenteAtual = cadastroDiscente.salvar(discenteAtual);
            return ResponseEntity.ok(discenteAtual);
        }

        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{discenteId}")
    public ResponseEntity<Discente> remover(@PathVariable Long discenteId) {
        Discente discente = discenteRepository.buscar(discenteId);

        try {
            cadastroDiscente.excluir(discenteId);

            return ResponseEntity.noContent().build();

        } catch (EntidadeNaoEncontradaException e) {
            return ResponseEntity.notFound().build();

        } catch (EntidadeEmUsoException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }
}
