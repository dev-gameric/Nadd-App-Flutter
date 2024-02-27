package br.com.nadd.domain.model;

import br.com.nadd.domain.model.enums.*;
import com.fasterxml.jackson.annotation.JsonRootName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
@JsonRootName("tipoAtendimento")
@Data
@Entity
@Table(name = "na04tipoatendimento")
public class TipoAtendimento {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "na04idtipoatendimento")
    private Long id;

    @Column(name = "na04nome", nullable = false, length = 40)
    private String nome;

    @Column(name = "na04tipo", nullable = false, length = 30)
    @Enumerated(value = EnumType.STRING)
    private NormalEmergencialEnum normalEmergencialEnum;

    @Column(name = "na04atendimento", nullable = false, length = 30)
    @Enumerated(value = EnumType.STRING)
    private IndividualColetivoEnum individualColetivoEnum;
}
