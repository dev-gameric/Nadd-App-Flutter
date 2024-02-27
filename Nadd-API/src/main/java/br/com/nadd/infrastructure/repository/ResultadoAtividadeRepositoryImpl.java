package br.com.nadd.infrastructure.repository;

import br.com.nadd.domain.model.ResultadoAtividade;
import br.com.nadd.repository.ResultadoAtividadeRepository;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Component;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import java.util.List;

@Component
public class ResultadoAtividadeRepositoryImpl implements ResultadoAtividadeRepository {

    @PersistenceContext
    private EntityManager manager;

    @Override
    public List<ResultadoAtividade> listar() {
        return manager.createQuery("from ResultadoAtividade", ResultadoAtividade.class).getResultList();
    }

    @Override
    public ResultadoAtividade buscar(Long id) {
        return manager.find(ResultadoAtividade.class, id);
    }

    @Transactional
    @Override
    public ResultadoAtividade salvar(ResultadoAtividade resultadoAtividade) {
        return manager.merge(resultadoAtividade);
    }

    @Transactional
    @Override
    public void remover(Long id) {
        ResultadoAtividade resultadoAtividade = buscar(id);

        if (resultadoAtividade == null) {
            throw new EmptyResultDataAccessException(1);
        }

        manager.remove(resultadoAtividade);
    }
}
