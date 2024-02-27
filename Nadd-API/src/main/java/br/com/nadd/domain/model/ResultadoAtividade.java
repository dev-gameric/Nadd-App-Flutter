package br.com.nadd.domain.model;

import br.com.nadd.domain.model.enums.NotaResultadoEnum;
import com.fasterxml.jackson.annotation.JsonRootName;
import lombok.Data;
import lombok.EqualsAndHashCode;

import javax.persistence.*;
@JsonRootName("resultadoAtividade")
@Data
@Entity
@Table(name = "na11resultadoatividade")
public class ResultadoAtividade {

    @EqualsAndHashCode.Include
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "na11idresultado")
    private Long idResultado;

    @ManyToOne
    @JoinColumn(name = "fk1108idatividadesprojeto", nullable = false)
    private AtividadesProjeto atividadesProjeto;

    @Column(name = "na11nota", nullable = false)
    @Enumerated(value = EnumType.STRING)
    private NotaResultadoEnum notaResultadoEnum;
}
