package br.com.nadd.repository;

import br.com.nadd.domain.model.Atendentes;

import java.util.List;

public interface AtendenteRepository {

    List<Atendentes> listar();
    Atendentes buscar(Long id);
    Atendentes salvar(Atendentes atendentes);
    void remover(Long id);
}