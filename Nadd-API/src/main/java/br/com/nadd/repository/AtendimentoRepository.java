package br.com.nadd.repository;

import br.com.nadd.domain.model.Atendimento;
import br.com.nadd.domain.model.Projeto;

import java.util.List;

public interface AtendimentoRepository {

    List<Atendimento> findByNome (String nome);
    List<Atendimento> listar();
    Atendimento buscar(Long id);
    Atendimento salvar(Atendimento atendimento);
    void remover(Long id);
}