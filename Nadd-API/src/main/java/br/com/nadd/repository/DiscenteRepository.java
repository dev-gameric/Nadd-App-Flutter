package br.com.nadd.repository;

import br.com.nadd.domain.model.Discente;

import java.util.List;

public interface DiscenteRepository {

    List<Discente> listar();
    Discente buscar(Long id);
    Discente salvar(Discente discente);
    void remover(Long id);

}
