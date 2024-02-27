package br.com.nadd.domain.model;

import com.fasterxml.jackson.annotation.JsonRootName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
@JsonRootName("discente")
@Data
@Entity
@Table(name = "na03discente")
public class Discente {

    @Id
    @EqualsAndHashCode.Include
    @Column(name = "na03idra", nullable = false, length = 8)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "fk0301idpessoa", nullable = false)
    private Pessoa pessoa;

}
