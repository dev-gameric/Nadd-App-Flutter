package br.com.nadd.repository;

import br.com.nadd.domain.model.TipoAtendimento;

import java.util.List;

public interface TipoAtendimentoRepository {

    List<TipoAtendimento> listar();
    TipoAtendimento buscar(Long id);
    TipoAtendimento salvar(TipoAtendimento tipoAtendimento);
    void remover(Long id);

}
