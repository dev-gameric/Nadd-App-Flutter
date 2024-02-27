package br.com.nadd.domain.model;

import com.fasterxml.jackson.annotation.JsonRootName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
@JsonRootName("atividadeParticipantes")
@Data
@Entity
@Table(name = "na10atividadeparticipante")
public class AtividadeParticipantes {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "na10idatividadeparticipante")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "fk1008idatividadeprojeto", nullable = false)
    private AtividadesProjeto atividadesProjeto;

    @ManyToOne
    @JoinColumn(name = "fk1001idpessoa", nullable = false)
    private Pessoa pessoa;
}
