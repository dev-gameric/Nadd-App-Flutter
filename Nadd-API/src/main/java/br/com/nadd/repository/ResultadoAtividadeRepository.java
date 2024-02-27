package br.com.nadd.repository;

import br.com.nadd.domain.model.ResultadoAtividade;

import java.util.List;

public interface ResultadoAtividadeRepository {

    List<ResultadoAtividade> listar();
    ResultadoAtividade buscar(Long id);
    ResultadoAtividade salvar(ResultadoAtividade resultadoAtividade);
    void remover(Long id);

}
