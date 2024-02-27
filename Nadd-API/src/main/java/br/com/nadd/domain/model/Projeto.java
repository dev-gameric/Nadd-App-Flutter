package br.com.nadd.domain.model;

import br.com.nadd.domain.model.enums.StatusProjetoEnum;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonRootName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.util.Date;
@JsonRootName("projeto")
@Data
@Entity
@Table(name = "na07projeto")
public class Projeto {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "na07idprojeto")
    private Long id;

    @Column(name = "na07nome", nullable = false, length = 60)
    private String nome;

    @Column(name = "na07proponente", nullable = false, length = 60)
    private String proponente;

    @Column(name = "na07status", nullable = false)
    @Enumerated(value = EnumType.STRING)
    private StatusProjetoEnum statusProjetoEnum;

    @Column(name = "na07datainicio", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date dataInicio;

    @Column(name = "na07datafim")
    @Temporal(TemporalType.DATE)
    private Date dataFim;
}
