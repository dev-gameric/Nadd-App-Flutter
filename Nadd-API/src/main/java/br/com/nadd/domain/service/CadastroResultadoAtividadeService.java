package br.com.nadd.domain.service;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.AtividadesProjeto;
import br.com.nadd.domain.model.ResultadoAtividade;
import br.com.nadd.repository.AtividadesProjetoRepository;
import br.com.nadd.repository.ResultadoAtividadeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CadastroResultadoAtividadeService {

    @Autowired
    private ResultadoAtividadeRepository resultadoAtividadeRepository;

    @Autowired
    private AtividadesProjetoRepository atividadesProjetoRepository;

    public ResultadoAtividade salvar(ResultadoAtividade resultadoAtividade){
        Long atividadeProjetoId = resultadoAtividade.getAtividadesProjeto().getId();
        AtividadesProjeto atividadesProjeto = atividadesProjetoRepository.buscar(atividadeProjetoId);

        if(atividadesProjeto == null) {
            throw new EntidadeNaoEncontradaException(
                    String.format("Não existe cadastro de Atividade Projeto com o código %d", atividadeProjetoId));
        }

        resultadoAtividade.setAtividadesProjeto(atividadesProjeto);
        return resultadoAtividadeRepository.salvar(resultadoAtividade);
    }

    public void excluir(Long resultadoAtividadeId){
        try {
            resultadoAtividadeRepository.remover(resultadoAtividadeId);
        } catch (EmptyResultDataAccessException e){
            throw new EntidadeNaoEncontradaException(String.format(
                    "Não existe um cadastro de resultado de atividade com código %d", resultadoAtividadeId));
        } catch (DataIntegrityViolationException e){
            throw new EntidadeEmUsoException(String.format(
                    "Resultado de atividade de código %d não pode ser removido, pois está em uso", resultadoAtividadeId));
        }
    }
}
