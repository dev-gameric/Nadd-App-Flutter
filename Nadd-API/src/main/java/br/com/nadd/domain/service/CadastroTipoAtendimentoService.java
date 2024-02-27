package br.com.nadd.domain.service;

import br.com.nadd.domain.exception.EntidadeEmUsoException;
import br.com.nadd.domain.exception.EntidadeNaoEncontradaException;
import br.com.nadd.domain.model.TipoAtendimento;
import br.com.nadd.repository.TipoAtendimentoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

@Service
public class CadastroTipoAtendimentoService {

    @Autowired
    private TipoAtendimentoRepository tipoAtendimentoRepository;

    public TipoAtendimento salvar(TipoAtendimento tipoAtendimento){
        return tipoAtendimentoRepository.salvar(tipoAtendimento);
    }

    public void excluir(Long tipoAtendimentoId){
        try {
            tipoAtendimentoRepository.remover(tipoAtendimentoId);
        } catch (EmptyResultDataAccessException e){
            throw new EntidadeNaoEncontradaException(String.format(
                    "Não existe um cadastro de tipo de atendimento com código %d", tipoAtendimentoId));
        } catch (DataIntegrityViolationException e){
            throw new EntidadeEmUsoException(String.format(
                    "Tipo de atendimento de código %d não pode ser removido, pois está em uso", tipoAtendimentoId));
        }
    }
}
