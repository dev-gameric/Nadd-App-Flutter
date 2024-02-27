package br.com.nadd.domain.service;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.Atendentes;
import br.com.nadd.repository.AtendenteRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CadastroAtendentesService {

    @Autowired
    private AtendenteRepository atendenteRepository;

    public Atendentes salvar(Atendentes atendente){
        return atendenteRepository.salvar(atendente);
    }

    public void excluir(Long atendenteId){
        try {
            atendenteRepository.remover(atendenteId);
        } catch (EmptyResultDataAccessException e){
            throw new EntidadeNaoEncontradaException(String.format(
                    "Não existe um cadastro de atendente com código %d", atendenteId));
        } catch (DataIntegrityViolationException e){
            throw new EntidadeEmUsoException(String.format(
                    "Atendente de código %d não pode ser removido, pois está em uso", atendenteId));
        }
    }
}
