package br.com.nadd.infrastructure.repository;

import br.com.nadd.domain.model.Discente;
import br.com.nadd.repository.DiscenteRepository;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Component
public class DiscenteRepositoryImpl implements DiscenteRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<Discente> listar() {
        return manager.createQuery("from Discente", Discente.class).getResultList();
    }

    @Override
    public Discente buscar(Long id) {
        return manager.find(Discente.class, id);
    }

    @Transactional
    @Override
    public Discente salvar(Discente discente) {
        return manager.merge(discente);
    }

    @Transactional
    @Override
    public void remover(Long id) {
        Discente discente = buscar(id);

        if (discente == null) {
            throw new EmptyResultDataAccessException(1);
        }

        manager.remove(discente);
    }
}
