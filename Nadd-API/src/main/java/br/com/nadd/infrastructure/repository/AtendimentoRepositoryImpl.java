package br.com.nadd.infrastructure.repository;

import br.com.nadd.domain.model.Atendimento;
import br.com.nadd.domain.model.Pessoa;
import br.com.nadd.repository.AtendimentoRepository;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;
import javax.transaction.Transactional;
import java.util.List;

@Component
public class AtendimentoRepositoryImpl implements AtendimentoRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<Atendimento> listar() {
        return manager.createQuery("from Atendimento", Atendimento.class).getResultList();
    }

    @Override
    public Atendimento buscar(Long id) {
        return manager.find(Atendimento.class, id);
    }

    @Transactional
    @Override
    public Atendimento salvar(Atendimento atendimento) {
        return manager.merge(atendimento);
    }

    @Transactional
    @Override
    public void remover(Long id) {
        Atendimento atendimento = buscar(id);

        if(atendimento == null) {
            throw new EmptyResultDataAccessException(1);
        }

        manager.remove(atendimento);
    }

    @Override
    public List<Atendimento> findByNome(String nome) {
        String jpql = "select a from Atendimento a JOIN a.pessoa p where p.nome like :nome";
        TypedQuery<Atendimento> query = manager.createQuery(jpql, Atendimento.class);
        query.setParameter("nome", "%" + nome + "%");

        return query.getResultList();
    }
}
