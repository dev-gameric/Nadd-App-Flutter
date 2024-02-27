package br.com.nadd.domain.service;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.Projeto;
import br.com.nadd.repository.ProjetoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CadastroProjetoService {

    @Autowired
    private ProjetoRepository projetoRepository;

    public Projeto salvar(Projeto projeto){
        return projetoRepository.salvar(projeto);
    }

    public void excluir(Long projetoId){
        try {
            projetoRepository.remover(projetoId);
        } catch (EmptyResultDataAccessException e){
            throw new EntidadeNaoEncontradaException(String.format(
                    "Não existe um cadastro de projeto com código %d", projetoId));
        } catch (DataIntegrityViolationException e){
            throw new EntidadeEmUsoException(String.format(
                    "Projeto de código %d não pode ser removido, pois está em uso", projetoId));
        }
    }
}
