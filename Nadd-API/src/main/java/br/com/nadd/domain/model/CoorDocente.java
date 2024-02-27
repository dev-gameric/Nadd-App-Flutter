package br.com.nadd.domain.model;

import br.com.nadd.domain.model.enums.*;
import com.fasterxml.jackson.annotation.JsonRootName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
@JsonRootName("CoorDocente")
@Data
@Entity
@Table(name = "na02coordocente")
public class CoorDocente {

    @EqualsAndHashCode.Include
    @Id
    @Column(name = "na02idmatricula", nullable = false)
    private Long id;

    @Column(name = "na02tipo", nullable = false, length =30)
    @Enumerated(value = EnumType.STRING)
    private CoorDocenteEnum coorDocenteEnum;

    @ManyToOne
    @JoinColumn(name = "fk0201idpessoa", nullable = false)
    private Pessoa pessoa;
}
