package br.com.nadd.domain.model;

import br.com.nadd.domain.model.enums.RepentinoGradualEnum;
import com.fasterxml.jackson.annotation.JsonRootName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.util.Date;

@JsonRootName("atendimento")
@Data
@Entity
@Table(name = "na12atendimento")
public class Atendimento {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "na12idatendimento")
    private Long id;
    @ManyToOne
    @JoinColumn(name = "fk1201idpessoa", nullable = false)
    private Pessoa pessoa;

    @ManyToOne
    @JoinColumn(name = "fk1204idtipoatendimento", nullable = false)
    private TipoAtendimento tipoAtendimento;

    @ManyToOne
    @JoinColumn(name = "fk1205idatendente", nullable = false)
    private Atendentes atendentes;

    @Column(name = "na12datahora", nullable = false)
    @Temporal(TemporalType.TIMESTAMP)
    private Date dataHora;

    @Column(name = "na12queixaprincipal", nullable = false, length = 800)
    private String queixaPrincipal;

    @Column(name = "na12repentinogradual", nullable = false, length = 30)
    @Enumerated(value = EnumType.STRING)
    private RepentinoGradualEnum repentinoGradualEnum;

    @Column(name = "na12comocomecou", nullable = false, length = 800)
    private String comoComecou;

    @Column(name = "na12ocorrencia", nullable = false, length = 800)
    private String ocorrencia;

    @Column(name = "na12sintomas", nullable = false, length = 800)
    private String sintomas;

    @Column(name = "na12observacao", length = 800)
    private String observacao;
}
