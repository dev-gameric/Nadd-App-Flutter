package br.com.nadd.domain.service;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.Participantes;
import br.com.nadd.repository.ParticipantesRepository;
import br.com.nadd.repository.PessoaRepository;
import br.com.nadd.repository.ProjetoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CadastroParticipantesService {

    @Autowired
    private ParticipantesRepository participantesRepository;

    @Autowired
    private PessoaRepository pessoaRepository;

    @Autowired
    private ProjetoRepository projetoRepository;

    public Participantes salvar(Participantes participante) {
        Long pessoaId = participante.getPessoa().getId();
        if (pessoaRepository.buscar(pessoaId) == null) {
            throw new EntidadeNaoEncontradaException(
                    String.format("Não existe um cadastro de pessoa com código %d", pessoaId)
            );
        }

        Long projetoId = participante.getProjeto().getId();
        if (projetoRepository.buscar(projetoId) == null) {
            throw new EntidadeNaoEncontradaException(
                    String.format("Não existe um cadastro de projeto com código %d", projetoId)
            );
        }

        return participantesRepository.salvar(participante);
    }

    public void excluir(Long participanteId) {
        try {
            participantesRepository.remover(participanteId);
        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(String.format(
                    "Não existe um cadastro de participante com código %d", participanteId)
            );
        } catch (DataIntegrityViolationException e) {
            throw new EntidadeEmUsoException(String.format(
                    "Participante de código %d não pode ser removido, pois está em uso", participanteId)
            );
        }
    }
}
