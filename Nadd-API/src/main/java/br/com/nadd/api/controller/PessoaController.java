package br.com.nadd.api.controller;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.Pessoa;
import br.com.nadd.domain.service.CadastroPessoaService;
import br.com.nadd.repository.PessoaRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RestController
@RequestMapping(value = "/pessoa")
public class PessoaController {

    @Autowired
    private PessoaRepository pessoaRepository;

    @Autowired
    private CadastroPessoaService cadastroPessoa;

    @GetMapping
    public List<Pessoa> listar(){
        return pessoaRepository.listar();
    }

    @GetMapping("/{pessoaId}")

    public ResponseEntity<Pessoa> buscar(@PathVariable Long pessoaId){
        Pessoa pessoa = pessoaRepository.buscar(pessoaId);

        if (pessoa != null){
            return ResponseEntity.ok(pessoa);
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Pessoa adicionar (@RequestBody Pessoa pessoa){
        return cadastroPessoa.salvar(pessoa);
    }

    @PutMapping("/{pessoaId}")
    public ResponseEntity<Pessoa> atualizar(@PathVariable Long pessoaId, @RequestBody Pessoa pessoa){
        Pessoa pessoaAtual = pessoaRepository.buscar(pessoaId);

        if (pessoaAtual != null){
            BeanUtils.copyProperties(pessoa, pessoaAtual, "id");

            pessoaAtual = cadastroPessoa.salvar(pessoaAtual);
            return ResponseEntity.ok(pessoaAtual);
        }

        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{pessoaId}")
    public ResponseEntity<Pessoa> remover(@PathVariable Long pessoaId){
        Pessoa pessoa = pessoaRepository.buscar(pessoaId);

        try {
            cadastroPessoa.excluir(pessoaId);

            return ResponseEntity.noContent().build();

        } catch (EntidadeNaoEncontradaException e){
            return ResponseEntity.notFound().build();

        } catch (EntidadeEmUsoException e){
            return ResponseEntity.status(HttpStatus.CONFLICT).build();

        }
    }
}
