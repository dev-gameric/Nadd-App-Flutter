package br.com.nadd.infrastructure.repository;

import br.com.nadd.domain.model.CoorDocente;
import br.com.nadd.repository.CoorDocenteRepository;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Component
public class CoorDocenteRepositoryImpl implements CoorDocenteRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<CoorDocente> listar() {
        return manager.createQuery("from CoorDocente", CoorDocente.class).getResultList();
    }

    @Override
    public CoorDocente buscar(Long id) {
        return manager.find(CoorDocente.class, id);
    }

    @Transactional
    @Override
    public CoorDocente salvar(CoorDocente coorDocente) {
        return manager.merge(coorDocente);
    }

    @Transactional
    @Override
    public void remover(Long id) {
        CoorDocente coorDocente = buscar(id);

        if (coorDocente == null) {
            throw new EmptyResultDataAccessException(1);
        }

        manager.remove(coorDocente);
    }
}
