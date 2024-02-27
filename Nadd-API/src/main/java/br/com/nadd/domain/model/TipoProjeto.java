package br.com.nadd.domain.model;

import br.com.nadd.domain.model.enums.IndividualColetivoEnum;
import com.fasterxml.jackson.annotation.JsonRootName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
@JsonRootName("tipoProjeto")
@Data
@Entity
@Table(name = "na06tipoprojeto")
public class TipoProjeto {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "na06idtipoprojeto")
    private Long id;

    @Column(name = "na06nome", nullable = false, length = 40)
    private String nome;

    @Column(name = "na06tipo", nullable = false, length = 30)
    @Enumerated(value = EnumType.STRING)
    private IndividualColetivoEnum individualColetivoEnum;

}
