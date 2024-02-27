package br.com.nadd.api.controller;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.CoorDocente;
import br.com.nadd.domain.service.CadastroCoorDocenteService;
import br.com.nadd.repository.CoorDocenteRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RestController
@RequestMapping(value = "/coor-docentes")
public class CoorDocenteController {

    @Autowired
    private CoorDocenteRepository coorDocenteRepository;

    @Autowired
    private CadastroCoorDocenteService cadastroCoorDocente;

    @GetMapping
    public List<CoorDocente> listar(){
        return coorDocenteRepository.listar();
    }

    @GetMapping("/{coorDocenteId}")
    public ResponseEntity<CoorDocente> buscar(@PathVariable Long coorDocenteId){
        CoorDocente coorDocente = coorDocenteRepository.buscar(coorDocenteId);

        if (coorDocente != null) {
            return ResponseEntity.ok(coorDocente);
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public CoorDocente adicionar (@RequestBody CoorDocente coorDocente){
        return cadastroCoorDocente.salvar(coorDocente);
    }

    @PutMapping("/{coorDocenteId}")
    public ResponseEntity<CoorDocente> atualizar(@PathVariable Long coorDocenteId,
                                                 @RequestBody CoorDocente coorDocente){
        CoorDocente coorDocenteAtual = coorDocenteRepository.buscar(coorDocenteId);

        if(coorDocenteAtual != null) {
            BeanUtils.copyProperties(coorDocente, coorDocenteAtual, "id");

            coorDocenteAtual = cadastroCoorDocente.salvar(coorDocenteAtual);
            return ResponseEntity.ok(coorDocenteAtual);
        }

        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{coorDocenteId}")
    public ResponseEntity<CoorDocente> remover(@PathVariable Long coorDocenteId){
        CoorDocente coorDocente = coorDocenteRepository.buscar(coorDocenteId);

        try {
            cadastroCoorDocente.excluir(coorDocenteId);

            return ResponseEntity.noContent().build();

        } catch (EntidadeNaoEncontradaException e){
            return ResponseEntity.notFound().build();

        } catch (EntidadeEmUsoException e){
            return ResponseEntity.status(HttpStatus.CONFLICT).build();

        }
    }
}
