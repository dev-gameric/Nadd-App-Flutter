package br.com.nadd.repository;

import br.com.nadd.domain.model.Projeto;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ProjetoRepository {

    List<Projeto> findByNome (String nome);
    List<Projeto> listar();
    Projeto buscar(Long id);
    Projeto salvar(Projeto projeto);
    void remover(Long id);

}
