package br.com.nadd.api.controller;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.Projeto;
import br.com.nadd.domain.service.CadastroProjetoService;
import br.com.nadd.repository.ProjetoRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@CrossOrigin
@RestController
@RequestMapping(value = "/projetos")
public class ProjetoController {

    @Autowired
    private ProjetoRepository projetoRepository;

    @Autowired
    private CadastroProjetoService cadastroProjeto;

    @GetMapping
    public List<Projeto> listar(){
        return projetoRepository.listar();
    }

    @GetMapping("/{projetoId}")
    public ResponseEntity<Projeto> buscar(@PathVariable Long projetoId){
        Projeto projeto = projetoRepository.buscar(projetoId);

        if (projeto != null) {
            return ResponseEntity.ok(projeto);
        }

        return ResponseEntity.notFound().build();
    }
    @GetMapping("/BuscarPeloNome/{nome}")
    public ResponseEntity<List<Projeto>> buscarProjetosPorNome(@PathVariable String nome) {
        List<Projeto> projetos = projetoRepository.findByNome(nome);

        if (projetos.isEmpty()) {
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.ok(projetos);
        }
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Projeto adicionar (@RequestBody Projeto projeto){
        return cadastroProjeto.salvar(projeto);
    }

    @PutMapping("/{projetoId}")
    public ResponseEntity<Projeto> atualizar(@PathVariable Long projetoId,
                                             @RequestBody Projeto projeto){
        Projeto projetoAtual = projetoRepository.buscar(projetoId);

        if(projetoAtual != null) {
            BeanUtils.copyProperties(projeto, projetoAtual, "id");

            projetoAtual = cadastroProjeto.salvar(projetoAtual);
            return ResponseEntity.ok(projetoAtual);
        }

        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{projetoId}")
    public ResponseEntity<Projeto> remover(@PathVariable Long projetoId){
        Projeto projeto = projetoRepository.buscar(projetoId);

        try {
            cadastroProjeto.excluir(projetoId);

            return ResponseEntity.noContent().build();

        } catch (EntidadeNaoEncontradaException e){
            return ResponseEntity.notFound().build();

        } catch (EntidadeEmUsoException e){
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }
}
