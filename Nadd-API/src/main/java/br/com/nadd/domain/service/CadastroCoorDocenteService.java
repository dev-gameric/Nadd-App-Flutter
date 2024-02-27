package br.com.nadd.domain.service;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.CoorDocente;
import br.com.nadd.domain.model.Pessoa; // Importe a classe Pessoa
import br.com.nadd.repository.CoorDocenteRepository;
import br.com.nadd.repository.PessoaRepository; // Importe a classe PessoaRepository
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CadastroCoorDocenteService {

    @Autowired
    private CoorDocenteRepository coorDocenteRepository;

    @Autowired
    private PessoaRepository pessoaRepository;

    public CoorDocente salvar(CoorDocente coorDocente) {

        Long pessoaId = coorDocente.getPessoa().getId();
        Pessoa pessoa = pessoaRepository.buscar(pessoaId);

        if (pessoa == null) {
            throw new EntidadeNaoEncontradaException(
                    String.format("Não existe cadastro de Pessoa com o código %d no banco de dados", pessoaId));
        }

        coorDocente.setPessoa(pessoa);

        return coorDocenteRepository.salvar(coorDocente);
    }

    public void excluir(Long coorDocenteId) {
        try {
            coorDocenteRepository.remover(coorDocenteId);
        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(String.format(
                    "Não existe um cadastro de coordenador docente com código %d", coorDocenteId));
        } catch (DataIntegrityViolationException e) {
            throw new EntidadeEmUsoException(String.format(
                    "Coordenador docente de código %d não pode ser removido, pois está em uso", coorDocenteId));
        }
    }
}
