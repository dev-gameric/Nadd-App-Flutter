package br.com.nadd.domain.exception;

import java.io.Serial;

public class EntidadeEmUsoException extends RuntimeException {


    private static final long serialVersionUID = 1;

    public EntidadeEmUsoException(String mensagem){super(mensagem);}

}
