package br.com.nadd.api.controller;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.TipoProjeto;
import br.com.nadd.domain.service.CadastroTipoProjetoService;
import br.com.nadd.repository.TipoProjetoRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RestController
@RequestMapping(value = "/tipos-projeto")
public class TipoProjetoController {

    @Autowired
    private TipoProjetoRepository tipoProjetoRepository;

    @Autowired
    private CadastroTipoProjetoService cadastroTipoProjeto;

    @GetMapping
    public List<TipoProjeto> listar(){
        return tipoProjetoRepository.listar();
    }

    @GetMapping("/{tipoProjetoId}")
    public ResponseEntity<TipoProjeto> buscar(@PathVariable Long tipoProjetoId){
        TipoProjeto tipoProjeto = tipoProjetoRepository.buscar(tipoProjetoId);

        if (tipoProjeto != null) {
            return ResponseEntity.ok(tipoProjeto);
        }

        return ResponseEntity.notFound().build();
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public TipoProjeto adicionar (@RequestBody TipoProjeto tipoProjeto){
        return cadastroTipoProjeto.salvar(tipoProjeto);
    }

    @PutMapping("/{tipoProjetoId}")
    public ResponseEntity<TipoProjeto> atualizar(@PathVariable Long tipoProjetoId,
                                                 @RequestBody TipoProjeto tipoProjeto){
        TipoProjeto tipoProjetoAtual = tipoProjetoRepository.buscar(tipoProjetoId);

        if(tipoProjetoAtual != null) {
            BeanUtils.copyProperties(tipoProjeto, tipoProjetoAtual, "id");

            tipoProjetoAtual = cadastroTipoProjeto.salvar(tipoProjetoAtual);
            return ResponseEntity.ok(tipoProjetoAtual);
        }

        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{tipoProjetoId}")
    public ResponseEntity<TipoProjeto> remover(@PathVariable Long tipoProjetoId){
        TipoProjeto tipoProjeto = tipoProjetoRepository.buscar(tipoProjetoId);

        try {
            cadastroTipoProjeto.excluir(tipoProjetoId);
            return ResponseEntity.noContent().build();
        } catch (EntidadeNaoEncontradaException e){
            return ResponseEntity.notFound().build();
        } catch (EntidadeEmUsoException e){
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }
}
