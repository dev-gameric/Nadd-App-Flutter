package br.com.nadd.api.controller;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.AtividadesProjeto;
import br.com.nadd.domain.service.CadastroAtividadesProjetoService;
import br.com.nadd.repository.AtividadesProjetoRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RestController
@RequestMapping(value = "/atividades-projeto")
public class AtividadesProjetoController {

    @Autowired
    private AtividadesProjetoRepository atividadesProjetoRepository;

    @Autowired
    private CadastroAtividadesProjetoService cadastroAtividadesProjeto;

    @GetMapping
    public List<AtividadesProjeto> listar(){
        return atividadesProjetoRepository.listar();
    }

    @GetMapping("/{atividadeId}")
    public ResponseEntity<AtividadesProjeto> buscar(@PathVariable Long atividadeId){
        AtividadesProjeto atividade = atividadesProjetoRepository.buscar(atividadeId);

        if (atividade != null) {
            return ResponseEntity.ok(atividade);
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public AtividadesProjeto adicionar(@RequestBody AtividadesProjeto atividade){
        return cadastroAtividadesProjeto.salvar(atividade);
    }

    @PutMapping("/{atividadeId}")
    public ResponseEntity<AtividadesProjeto> atualizar(@PathVariable Long atividadeId,
                                                       @RequestBody AtividadesProjeto atividade){
        AtividadesProjeto atividadeAtual = atividadesProjetoRepository.buscar(atividadeId);

        if(atividadeAtual != null) {
            BeanUtils.copyProperties(atividade, atividadeAtual, "id");

            atividadeAtual = cadastroAtividadesProjeto.salvar(atividadeAtual);
            return ResponseEntity.ok(atividadeAtual);
        }

        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{atividadeId}")
    public ResponseEntity<AtividadesProjeto> remover(@PathVariable Long atividadeId){
        AtividadesProjeto atividade = atividadesProjetoRepository.buscar(atividadeId);

        try {
            cadastroAtividadesProjeto.excluir(atividadeId);
            return ResponseEntity.noContent().build();
        } catch (EntidadeNaoEncontradaException e){
            return ResponseEntity.notFound().build();
        } catch (EntidadeEmUsoException e){
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }
}
