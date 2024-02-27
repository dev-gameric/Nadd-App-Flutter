package br.com.nadd.repository;

import br.com.nadd.domain.model.Pessoa;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface PessoaRepository extends JpaRepository<Pessoa, Long> {
    Pessoa findByUsername(String email);
    List<Pessoa> listar();
    Pessoa buscar(Long id);
    Pessoa salvar(Pessoa pessoa);
    void  remover(Long id);
}
