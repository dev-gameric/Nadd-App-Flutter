package br.com.nadd.api.controller;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.Atendimento;
import br.com.nadd.domain.model.Projeto;
import br.com.nadd.domain.service.CadastroAtendimentoService;
import br.com.nadd.repository.AtendimentoRepository;
import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
@CrossOrigin
@RestController
@RequestMapping(value = "/atendimentos")
public class AtendimentoController {

    @Autowired
    private AtendimentoRepository atendimentoRepository;

    @Autowired
    private CadastroAtendimentoService cadastroAtendimento;

    @GetMapping
    public List<Atendimento> listar(){
        return atendimentoRepository.listar();
    }

    @GetMapping("/{atendimentoId}")
    public ResponseEntity<Atendimento> buscar(@PathVariable Long atendimentoId){
        Atendimento atendimento = atendimentoRepository.buscar(atendimentoId);

        if (atendimento != null) {
            return ResponseEntity.ok(atendimento);
        }

        return ResponseEntity.notFound().build();
    }

    @GetMapping("/BuscarPeloNome/{nome}")
    public ResponseEntity<List<Atendimento>> buscarAtendimentoPeloNome(@PathVariable String nome) {
        List<Atendimento> atendimentos = atendimentoRepository.findByNome(nome);

        if (atendimentos.isEmpty()) {
            return ResponseEntity.noContent().build();
        } else {
            return ResponseEntity.ok(atendimentos);
        }
    }

    @PostMapping
    @ResponseStatus(HttpStatus.CREATED)
    public Atendimento adicionar(@RequestBody Atendimento atendimento){
        return cadastroAtendimento.salvar(atendimento);
    }

    @PutMapping("/{atendimentoId}")
    public ResponseEntity<Atendimento> atualizar(@PathVariable Long atendimentoId,
                                                 @RequestBody Atendimento atendimento){
        Atendimento atendimentoAtual = atendimentoRepository.buscar(atendimentoId);

        if(atendimentoAtual != null) {
            BeanUtils.copyProperties(atendimento, atendimentoAtual, "id");

            atendimentoAtual = cadastroAtendimento.salvar(atendimentoAtual);
            return ResponseEntity.ok(atendimentoAtual);
        }

        return ResponseEntity.notFound().build();
    }

    @DeleteMapping("/{atendimentoId}")
    public ResponseEntity<Atendimento> remover(@PathVariable Long atendimentoId){
        Atendimento atendimento = atendimentoRepository.buscar(atendimentoId);

        try {
            cadastroAtendimento.excluir(atendimentoId);
            return ResponseEntity.noContent().build();
        } catch (EntidadeNaoEncontradaException e){
            return ResponseEntity.notFound().build();
        } catch (EntidadeEmUsoException e){
            return ResponseEntity.status(HttpStatus.CONFLICT).build();
        }
    }
}
