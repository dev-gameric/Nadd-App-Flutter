package br.com.nadd.infrastructure.repository;

import br.com.nadd.domain.model.TipoAtendimento;
import br.com.nadd.repository.TipoAtendimentoRepository;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Component
public class TipoAtendimentoRepositoryImpl implements TipoAtendimentoRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<TipoAtendimento> listar() {
        return manager.createQuery("from TipoAtendimento", TipoAtendimento.class).getResultList();
    }

    @Override
    public TipoAtendimento buscar(Long id) {
        return manager.find(TipoAtendimento.class, id);
    }

    @Transactional
    @Override
    public TipoAtendimento salvar(TipoAtendimento tipoAtendimento) {
        return manager.merge(tipoAtendimento);
    }

    @Transactional
    @Override
    public void remover(Long id) {
        TipoAtendimento tipoAtendimento = buscar(id);

        if (tipoAtendimento == null) {
            throw new EmptyResultDataAccessException(1);
        }

        manager.remove(tipoAtendimento);
    }

}
