package br.com.nadd.infrastructure.repository;

import br.com.nadd.domain.model.AtividadeParticipantes;
import br.com.nadd.repository.AtividadeParticipantesRepository;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Component
public class AtividadeParticipantesRepositoryImpl implements AtividadeParticipantesRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<AtividadeParticipantes> listar() {
        return manager.createQuery("from AtividadeParticipantes", AtividadeParticipantes.class).getResultList();
    }

    @Override
    public AtividadeParticipantes buscar(Long id) {
        return manager.find(AtividadeParticipantes.class, id);
    }

    @Transactional
    @Override
    public AtividadeParticipantes salvar(AtividadeParticipantes atividadeParticipantes) {
        return manager.merge(atividadeParticipantes);
    }

    @Transactional
    @Override
    public void remover(Long id) {
        AtividadeParticipantes atividadeParticipantes = buscar(id);

        if (atividadeParticipantes == null) {
            throw new EmptyResultDataAccessException(1);
        }

        manager.remove(atividadeParticipantes);
    }
}