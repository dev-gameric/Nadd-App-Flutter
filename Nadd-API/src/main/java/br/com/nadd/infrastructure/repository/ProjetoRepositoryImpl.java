package br.com.nadd.infrastructure.repository;

import br.com.nadd.domain.model.Projeto;
import br.com.nadd.repository.ProjetoRepository;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import javax.persistence.TypedQuery;
import java.util.List;

@Component
public class ProjetoRepositoryImpl implements ProjetoRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<Projeto> listar() {
        return manager.createQuery("from Projeto", Projeto.class).getResultList();
    }

    @Override
    public Projeto buscar(Long id) {
        return manager.find(Projeto.class, id);
    }

    @Transactional
    @Override
    public Projeto salvar(Projeto projeto) {
        return manager.merge(projeto);
    }

    @Transactional
    @Override
    public void remover(Long id) {
        Projeto projeto = buscar(id);

        if (projeto == null) {
            throw new EmptyResultDataAccessException(1);
        }

        manager.remove(projeto);
    }

    @Override
    public List<Projeto> findByNome(String nome) {
        String jpql = "select p from Projeto p where p.nome like :nome";
        TypedQuery<Projeto> query = manager.createQuery(jpql, Projeto.class);
        query.setParameter("nome", "%" + nome + "%");

        return query.getResultList();
    }
}
