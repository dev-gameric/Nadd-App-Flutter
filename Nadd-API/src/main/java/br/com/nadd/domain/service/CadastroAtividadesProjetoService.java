package br.com.nadd.domain.service;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.AtividadesProjeto;
import br.com.nadd.domain.model.Projeto;
import br.com.nadd.repository.AtividadesProjetoRepository;
import br.com.nadd.repository.ProjetoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CadastroAtividadesProjetoService {

    @Autowired
    private AtividadesProjetoRepository atividadesProjetoRepository;

    @Autowired
    private ProjetoRepository projetoRepository;

    public AtividadesProjeto salvar(AtividadesProjeto atividadesProjeto) {
        Long projetoId = atividadesProjeto.getProjeto().getId();
        Projeto projeto = projetoRepository.buscar(projetoId);

        if (projeto == null) {
            throw new EntidadeNaoEncontradaException(
                    String.format("Não existe cadastro de Projeto com o código %d", projetoId));
        }

        atividadesProjeto.setProjeto(projeto);
        return atividadesProjetoRepository.salvar(atividadesProjeto);
    }

    public void excluir(Long atividadesProjetoId) {
        try {
            atividadesProjetoRepository.remover(atividadesProjetoId);
        } catch (EmptyResultDataAccessException e) {
            throw new EntidadeNaoEncontradaException(String.format(
                    "Não existe um cadastro de atividades do projeto com código %d", atividadesProjetoId));
        } catch (DataIntegrityViolationException e) {
            throw new EntidadeEmUsoException(String.format(
                    "Atividades do projeto de código %d não podem ser removidas, pois estão em uso", atividadesProjetoId));
        }
    }
}
