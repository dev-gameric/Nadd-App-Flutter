package br.com.nadd.repository;

import br.com.nadd.domain.model.AtividadeParticipantes;

import java.util.List;

public interface AtividadeParticipantesRepository {

    List<AtividadeParticipantes> listar();
    AtividadeParticipantes buscar(Long id);
    AtividadeParticipantes salvar(AtividadeParticipantes atividadeParticipantes);
    void remover(Long id);

}

