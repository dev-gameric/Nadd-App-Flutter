package br.com.nadd.infrastructure.repository;

import br.com.nadd.domain.model.TipoProjeto;
import br.com.nadd.repository.TipoProjetoRepository;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Component
public class TipoProjetoRepositoryImpl implements TipoProjetoRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<TipoProjeto> listar() {
        return manager.createQuery("from TipoProjeto", TipoProjeto.class).getResultList();
    }

    @Override
    public TipoProjeto buscar(Long id) {
        return manager.find(TipoProjeto.class, id);
    }

    @Transactional
    @Override
    public TipoProjeto salvar(TipoProjeto tipoProjeto) {
        return manager.merge(tipoProjeto);
    }

    @Transactional
    @Override
    public void remover(Long id) {
        TipoProjeto tipoProjeto = buscar(id);

        if (tipoProjeto == null) {
            throw new EmptyResultDataAccessException(1);
        }

        manager.remove(tipoProjeto);
    }

}
