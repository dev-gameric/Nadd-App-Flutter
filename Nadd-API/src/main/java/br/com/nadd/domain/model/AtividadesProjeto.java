package br.com.nadd.domain.model;

import br.com.nadd.domain.model.enums.StatusProjetoEnum;
import com.fasterxml.jackson.annotation.JsonRootName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
import java.util.Date;
@JsonRootName("atividadeProjeto")
@Data
@Entity
@Table(name = "na08atividadesprojeto")
public class AtividadesProjeto {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "na08idatividadesprojeto")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "fk0807idprojeto", nullable = false)
    private Projeto projeto;

    @Column(name = "na08nome", nullable = false, length = 60)
    private String nome;

    @Column(name = "na08datapresente", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date dataPresente;

    @Column(name = "na08datainicio", nullable = false)
    @Temporal(TemporalType.DATE)
    private Date dataInicio;

    @Column(name = "na08datafim")
    @Temporal(TemporalType.DATE)
    private Date dataFim;

    @Column(name = "na08status", nullable = false, length = 30)
    @Enumerated(value = EnumType.STRING)
    private StatusProjetoEnum statusProjetoEnum;

}
