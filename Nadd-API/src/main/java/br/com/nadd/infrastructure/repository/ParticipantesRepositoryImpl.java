package br.com.nadd.infrastructure.repository;

import br.com.nadd.domain.model.Participantes;
import br.com.nadd.repository.ParticipantesRepository;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Component
public class ParticipantesRepositoryImpl implements ParticipantesRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<Participantes> listar() {
        return manager.createQuery("from Participantes", Participantes.class).getResultList();
    }

    @Override
    public Participantes buscar(Long id) {
        return manager.find(Participantes.class, id);
    }

    @Transactional
    @Override
    public Participantes salvar(Participantes participante) {
        return manager.merge(participante);
    }

    @Transactional
    @Override
    public void remover(Long id) {
        Participantes participantes = buscar(id);

        if(participantes == null) {
            throw new EmptyResultDataAccessException(1);
        }

        manager.remove(participantes);
    }
}

