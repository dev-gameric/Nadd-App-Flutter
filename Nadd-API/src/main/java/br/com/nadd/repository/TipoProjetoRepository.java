package br.com.nadd.repository;

import br.com.nadd.domain.model.TipoProjeto;

import java.util.List;

public interface TipoProjetoRepository {

    List<TipoProjeto> listar();
    TipoProjeto buscar(Long id);
    TipoProjeto salvar(TipoProjeto tipoProjeto);
    void remover(Long id);

}
