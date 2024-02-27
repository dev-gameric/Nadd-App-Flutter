package br.com.nadd.domain.service;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.TipoProjeto;
import br.com.nadd.repository.TipoProjetoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CadastroTipoProjetoService {

    @Autowired
    private TipoProjetoRepository tipoProjetoRepository;

    public TipoProjeto salvar(TipoProjeto tipoProjeto){
        return tipoProjetoRepository.salvar(tipoProjeto);
    }

    public void excluir(Long tipoProjetoId){
        try {
            tipoProjetoRepository.remover(tipoProjetoId);
        } catch (EmptyResultDataAccessException e){
            throw new EntidadeNaoEncontradaException(String.format(
                    "Não existe um cadastro de tipo de projeto com código %d", tipoProjetoId));
        } catch (DataIntegrityViolationException e){
            throw new EntidadeEmUsoException(String.format(
                    "Tipo de projeto de código %d não pode ser removido, pois está em uso", tipoProjetoId));
        }
    }
}
