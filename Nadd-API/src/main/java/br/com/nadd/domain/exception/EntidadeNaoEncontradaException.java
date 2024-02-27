package br.com.nadd.domain.exception;

import java.io.Serial;

public class EntidadeNaoEncontradaException extends RuntimeException{


    private static final long serialVersionUID = 1;

    public EntidadeNaoEncontradaException(String mensagem){super(mensagem);}

}
