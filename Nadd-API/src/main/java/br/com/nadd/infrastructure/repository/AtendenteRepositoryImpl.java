package br.com.nadd.infrastructure.repository;

import br.com.nadd.domain.model.Atendentes;
import br.com.nadd.repository.AtendenteRepository;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Component
public class AtendenteRepositoryImpl implements AtendenteRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<Atendentes> listar() {
        return manager.createQuery("from Atendentes", Atendentes.class).getResultList();
    }

    @Override
    public Atendentes buscar(Long id) {
        return manager.find(Atendentes.class, id);
    }

    @Transactional
    @Override
    public Atendentes salvar(Atendentes atendente) {
        return manager.merge(atendente);
    }

    @Transactional
    @Override
    public void remover(Long id) {
        Atendentes atendente = buscar(id);

        if (atendente == null) {
            throw new EmptyResultDataAccessException(1);
        }

        manager.remove(atendente);
    }
}
