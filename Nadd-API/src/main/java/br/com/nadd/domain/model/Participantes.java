package br.com.nadd.domain.model;

import com.fasterxml.jackson.annotation.JsonRootName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
@JsonRootName("participantes")
@Data
@Entity
@Table(name = "na09participantes")
public class Participantes {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "na09idparticipantes")
    private Long id;

    @ManyToOne
    @JoinColumn(name = "fk0901idpessoa", nullable = false)
    private Pessoa pessoa;

    @ManyToOne
    @JoinColumn(name = "fk0907idprojeto", nullable = false)
    private Projeto projeto;
}
