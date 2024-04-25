package br.com.nadd.api.controller;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.TipoAtendimento;
import br.com.nadd.domain.service.CadastroTipoAtendimentoService;
import br.com.nadd.repository.TipoAtendimentoRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RestController
@RequestMapping(value = "/tipo-atendimento")
public class TipoAtendimentoController {

    @Autowired
    private TipoAtendimentoRepository tipoAtendimentoRepository;

    @Autowired
    private CadastroTipoAtendimentoService cadastroTipoAtendimento;

    @GetMapping("/t")
    public List<TipoAtendimento> listar(){
        return tipoAtendimentoRepository.listar();
    }

    @GetMapping("/{tipoAtendimentoId}")
    public ResponseEntity<TipoAtendimento> buscar(@PathVariable Long tipoAtendimentoId){
        TipoAtendimento tipoAtendimento = tipoAtendimentoRepository.buscar(tipoAtendimentoId);

        if (tipoAtendimento != null) {
            return ResponseEntity.ok(tipoAtendimento);
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public TipoAtendimento adicionar (@RequestBody TipoAtendimento tipoAtendimento){
        return cadastroTipoAtendimento.salvar(tipoAtendimento);
    }

    @PutMapping("/{tipoAtendimentoId}")
    public ResponseEntity<TipoAtendimento> atualizar(@PathVariable Long tipoAtendimentoId,
                                                     @RequestBody TipoAtendimento tipoAtendimento){
        TipoAtendimento tipoAtendimentoAtual = tipoAtendimentoRepository.buscar(tipoAtendimentoId);

        if(tipoAtendimentoAtual != null) {
            BeanUtils.copyProperties(tipoAtendimento, tipoAtendimentoAtual, "id");

            tipoAtendimentoAtual = cadastroTipoAtendimento.salvar(tipoAtendimentoAtual);
            return ResponseEntity.ok(tipoAtendimentoAtual);
        }

        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{tipoAtendimentoId}")
    public ResponseEntity<TipoAtendimento> remover(@PathVariable Long tipoAtendimentoId){
        TipoAtendimento tipoAtendimento = tipoAtendimentoRepository.buscar(tipoAtendimentoId);

        try {
            cadastroTipoAtendimento.excluir(tipoAtendimentoId);

            return ResponseEntity.noContent().build();
        } catch (EntidadeNaoEncontradaException e){
            return ResponseEntity.notFound().build();
        } catch (EntidadeEmUsoException e){
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }
}
