package br.com.nadd.domain.service;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.Discente;
import br.com.nadd.domain.model.Pessoa; // Importando a classe Pessoa
import br.com.nadd.repository.DiscenteRepository;
import br.com.nadd.repository.PessoaRepository; // Importando a interface PessoaRepository
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CadastroDiscenteService {

    @Autowired
    private DiscenteRepository discenteRepository;

    @Autowired
    private PessoaRepository pessoaRepository;

    public Discente salvar(Discente discente) {
        Long pessoaId = discente.getPessoa().getId();
        Pessoa pessoa = pessoaRepository.buscar(pessoaId);

        if (pessoa == null) {
            throw new EntidadeNaoEncontradaException(
                    String.format("Não existe cadastro de Pessoa com o código %d", pessoaId));
        }

        discente.setPessoa(pessoa); // Associando a pessoa ao discente
        return discenteRepository.salvar(discente);
    }

    public void excluir(Long discenteId) {
        try {
            discenteRepository.remover(discenteId);
        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(String.format(
                    "Não existe um cadastro de discente com código %d", discenteId));
        } catch (DataIntegrityViolationException e) {
            throw new EntidadeEmUsoException(String.format(
                    "Discente de código %d não pode ser removido, pois está em uso", discenteId));
        }
    }
}
