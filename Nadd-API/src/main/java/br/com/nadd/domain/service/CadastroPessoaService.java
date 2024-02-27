package br.com.nadd.domain.service;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.Pessoa;
import br.com.nadd.repository.PessoaRepository;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CadastroPessoaService {

    private final PessoaRepository pessoaRepository;

    public CadastroPessoaService(PessoaRepository pessoaRepository) {
        this.pessoaRepository = pessoaRepository;
    }

    public Pessoa salvar(Pessoa pessoa){
        return pessoaRepository.salvar(pessoa);
    }

    public void excluir(Long pessoaId){
        try {
            pessoaRepository.remover(pessoaId);
        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(String.format(
                    "Não existe um cadastro de pessoa com código %d",pessoaId));
        } catch (DataIntegrityViolationException e){
            throw new EntidadeEmUsoException(String.format(
                    "Pessoa de código %d não pode ser removido, pois está em uso", pessoaId            ));
        }
    }
}
