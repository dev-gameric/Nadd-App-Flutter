package br.com.nadd.repository;

import br.com.nadd.domain.model.AtividadesProjeto;

import java.util.List;

public interface AtividadesProjetoRepository {

    List<AtividadesProjeto> listar();
    AtividadesProjeto buscar(Long id);
    AtividadesProjeto salvar(AtividadesProjeto atividadesProjeto);
    void remover(Long id);

}
