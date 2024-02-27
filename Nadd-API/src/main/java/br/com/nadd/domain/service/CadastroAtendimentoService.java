package br.com.nadd.domain.service;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.Atendentes;
import br.com.nadd.domain.model.Atendimento;
import br.com.nadd.domain.model.Pessoa;
import br.com.nadd.domain.model.TipoAtendimento;
import br.com.nadd.repository.AtendimentoRepository;
import br.com.nadd.repository.PessoaRepository;
import br.com.nadd.repository.TipoAtendimentoRepository;
import br.com.nadd.repository.AtendenteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CadastroAtendimentoService {

    @Autowired
    private AtendimentoRepository atendimentoRepository;

    @Autowired
    private PessoaRepository pessoaRepository;

    @Autowired
    private TipoAtendimentoRepository tipoAtendimentoRepository;

    @Autowired
    private AtendenteRepository atendenteRepository;

    public Atendimento salvar(Atendimento atendimento) {
        Long pessoaId = atendimento.getPessoa().getId();
        Pessoa pessoa = pessoaRepository.buscar(pessoaId);

        if (pessoa == null) {
            throw new EntidadeNaoEncontradaException(
                    String.format("Não existe cadastro de Pessoa com o código %d", pessoaId));
        }

        atendimento.setPessoa(pessoa);

        Long tipoAtendimentoId = atendimento.getTipoAtendimento().getId();
        TipoAtendimento tipoAtendimento = tipoAtendimentoRepository.buscar(tipoAtendimentoId);

        if (tipoAtendimento == null) {
            throw new EntidadeNaoEncontradaException(
                    String.format("Não existe cadastro de Tipo de Atendimento com o código %d", tipoAtendimentoId));
        }

        atendimento.setTipoAtendimento(tipoAtendimento);

        Long atendenteId = atendimento.getAtendentes().getId();
        Atendentes atendentes = atendenteRepository.buscar(atendenteId);

        if (atendentes == null) {
            throw new EntidadeNaoEncontradaException(
                    String.format("Não existe cadastro de Atendente com o código %d", atendenteId));
        }

        atendimento.setAtendentes(atendentes);

        return atendimentoRepository.salvar(atendimento);
    }

    public void excluir(Long atendimentoId) {
        try {
            atendimentoRepository.remover(atendimentoId);
        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(String.format(
                    "Não existe um cadastro de atendimento com código %d", atendimentoId));
        } catch (DataIntegrityViolationException e) {
            throw new EntidadeEmUsoException(String.format(
                    "Atendimento de código %d não pode ser removido, pois está em uso", atendimentoId));
        }
    }
}
