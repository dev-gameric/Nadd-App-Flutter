package br.com.nadd.infrastructure.repository;

import br.com.nadd.domain.model.AtividadesProjeto;
import br.com.nadd.repository.AtividadesProjetoRepository;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Component
public class AtividadesProjetoRepositoryImpl implements AtividadesProjetoRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<AtividadesProjeto> listar() {
        return manager.createQuery("from AtividadesProjeto", AtividadesProjeto.class).getResultList();
    }

    @Override
    public AtividadesProjeto buscar(Long id) {
        return manager.find(AtividadesProjeto.class, id);
    }

    @Transactional
    @Override
    public AtividadesProjeto salvar(AtividadesProjeto atividadesProjeto) {
        return manager.merge(atividadesProjeto);
    }

    @Transactional
    @Override
    public void remover(Long id) {
        AtividadesProjeto atividadesProjeto = buscar(id);

        if(atividadesProjeto == null) {
            throw new EmptyResultDataAccessException(1);
        }

        manager.remove(atividadesProjeto);
    }
}