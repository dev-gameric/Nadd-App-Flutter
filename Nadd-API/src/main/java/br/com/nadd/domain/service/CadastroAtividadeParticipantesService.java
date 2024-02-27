package br.com.nadd.domain.service;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.AtividadeParticipantes;
import br.com.nadd.domain.model.AtividadesProjeto;
import br.com.nadd.domain.model.Pessoa;
import br.com.nadd.repository.AtividadeParticipantesRepository;
import br.com.nadd.repository.AtividadesProjetoRepository;
import br.com.nadd.repository.PessoaRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CadastroAtividadeParticipantesService {

    @Autowired
    private AtividadeParticipantesRepository atividadeParticipantesRepository;

    @Autowired
    private AtividadesProjetoRepository atividadesProjetoRepository;

    @Autowired
    private PessoaRepository pessoaRepository;

    public AtividadeParticipantes salvar(AtividadeParticipantes atividadeParticipantes){
        Long atividadeProjetoId = atividadeParticipantes.getAtividadesProjeto().getId();
        AtividadesProjeto atividadesProjeto = atividadesProjetoRepository.buscar(atividadeProjetoId);

        if(atividadesProjeto == null) {
            throw new EntidadeNaoEncontradaException(
                    String.format("Não existe cadastro de Atividade Projeto com o código %d", atividadeProjetoId));
        }

        atividadeParticipantes.setAtividadesProjeto(atividadesProjeto);

        Long pessoaId = atividadeParticipantes.getPessoa().getId();
        Pessoa pessoa = pessoaRepository.buscar(pessoaId);

        if(pessoa == null) {
            throw new EntidadeNaoEncontradaException(
                    String.format("Não existe cadastro de Pessoa com este código %d", pessoaId));
        }

        atividadeParticipantes.setPessoa(pessoa);

        return atividadeParticipantesRepository.salvar(atividadeParticipantes);
    }

    public void excluir(Long atividadeParticipantesId){
        try {
            atividadeParticipantesRepository.remover(atividadeParticipantesId);
        } catch (EmptyResultDataAccessException e){
            throw new EntidadeNaoEncontradaException(String.format(
                    "Não existe um cadastro de atividade de participantes com código %d", atividadeParticipantesId));
        } catch (DataIntegrityViolationException e){
            throw new EntidadeEmUsoException(String.format(
                    "Atividade de participantes de código %d não pode ser removida, pois está em uso", atividadeParticipantesId));
        }
    }
}
