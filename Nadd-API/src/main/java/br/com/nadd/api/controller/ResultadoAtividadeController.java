package br.com.nadd.api.controller;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.ResultadoAtividade;
import br.com.nadd.domain.service.CadastroResultadoAtividadeService;
import br.com.nadd.repository.ResultadoAtividadeRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RestController
@RequestMapping(value = "/resultados-atividade")
public class ResultadoAtividadeController {

    @Autowired
    private ResultadoAtividadeRepository resultadoAtividadeRepository;

    @Autowired
    private CadastroResultadoAtividadeService cadastroResultadoAtividade;

    @GetMapping
    public List<ResultadoAtividade> listar() {
        return resultadoAtividadeRepository.listar();
    }

    @GetMapping("/{resultadoAtividadeId}")
    public ResponseEntity<ResultadoAtividade> buscar(@PathVariable Long resultadoAtividadeId) {
        ResultadoAtividade resultadoAtividade = resultadoAtividadeRepository.buscar(resultadoAtividadeId);

        if (resultadoAtividade != null) {
            return ResponseEntity.ok(resultadoAtividade);
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public ResultadoAtividade adicionar(@RequestBody ResultadoAtividade resultadoAtividade) {
        return cadastroResultadoAtividade.salvar(resultadoAtividade);
    }

    @PutMapping("/{resultadoAtividadeId}")
    public ResponseEntity<ResultadoAtividade> atualizar(@PathVariable Long resultadoAtividadeId,
                                                        @RequestBody ResultadoAtividade resultadoAtividade) {
        ResultadoAtividade resultadoAtividadeAtual = resultadoAtividadeRepository.buscar(resultadoAtividadeId);

        if (resultadoAtividadeAtual != null) {
            BeanUtils.copyProperties(resultadoAtividade, resultadoAtividadeAtual, "id");

            resultadoAtividadeAtual = cadastroResultadoAtividade.salvar(resultadoAtividadeAtual);
            return ResponseEntity.ok(resultadoAtividadeAtual);
        }

        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{resultadoAtividadeId}")
    public ResponseEntity<ResultadoAtividade> remover(@PathVariable Long resultadoAtividadeId) {
        ResultadoAtividade resultadoAtividade = resultadoAtividadeRepository.buscar(resultadoAtividadeId);

        try {
            cadastroResultadoAtividade.excluir(resultadoAtividadeId);

            return ResponseEntity.noContent().build();
        } catch (EntidadeNaoEncontradaException e) {
            return ResponseEntity.notFound().build();
        } catch (EntidadeEmUsoException e) {
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }
}
