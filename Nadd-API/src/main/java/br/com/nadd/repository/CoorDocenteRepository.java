package br.com.nadd.repository;

import br.com.nadd.domain.model.CoorDocente;

import java.util.List;

public interface CoorDocenteRepository {

    List<CoorDocente> listar();
    CoorDocente buscar(Long id);
    CoorDocente salvar(CoorDocente coorDocente);
    void remover(Long id);

}
