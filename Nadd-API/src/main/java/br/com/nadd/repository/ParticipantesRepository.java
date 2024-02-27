package br.com.nadd.repository;

import br.com.nadd.domain.model.Participantes;

import java.util.List;

public interface ParticipantesRepository {

    List<Participantes> listar();
    Participantes buscar(Long id);
    Participantes salvar(Participantes participantes);
    void remover(Long id);

}
