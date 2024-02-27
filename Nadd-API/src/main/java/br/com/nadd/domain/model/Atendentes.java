package br.com.nadd.domain.model;

import com.fasterxml.jackson.annotation.JsonRootName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;

@JsonRootName("atendentes")
@Data
@Entity
@Table(name = "na05atendentes")
public class Atendentes {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "na05idatendente")
    private Long id;

    @Column(name = "na05nome", nullable = false, length = 30)
    private String nome;

}
