import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Model/atendentes.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Model/pessoa.dart';
import 'package:nadd/packages/common/app/features/banco_de_dados/db09nadd/Model/tipo_atendimento.dart';

class DadosDeAtendimento {
  final int id;
  final DadosDePessoa pessoa;
  final DadosDeTipoAtendimento tipoAtendimento;
  final DadosDeAtendentes atendentes;
  final String dataHora;
  final String queixaPrincipal;
  final String repentinoGradualEnum;
  final String comoComecou;
  final String ocorrencia;
  final String sintomas;
  final String observacao;

  DadosDeAtendimento({
    required this.id,
    required this.pessoa,
    required this.tipoAtendimento,
    required this.atendentes,
    required this.dataHora,
    required this.queixaPrincipal,
    required this.repentinoGradualEnum,
    required this.comoComecou,
    required this.ocorrencia,
    required this.sintomas,
    required this.observacao,
  });

  factory DadosDeAtendimento.fromJson(Map<String, dynamic> json) {
    return DadosDeAtendimento(
      id: json['id'],
      pessoa: DadosDePessoa.fromJson(json['pessoa'] ?? {}),
      tipoAtendimento:
          DadosDeTipoAtendimento.fromJson(json['tipoAtendimento'] ?? {}),
      atendentes: DadosDeAtendentes.fromJson(json['atendentes'] ?? {}),
      queixaPrincipal: json['queixaPrincipal'] ?? '',
      repentinoGradualEnum: json['repentinoGradualEnum'] ?? '',
      comoComecou: json['comoComecou'] ?? '',
      ocorrencia: json['ocorrencia'] ?? '',
      sintomas: json['sintomas'] ?? '',
      observacao: json['observacao'] ?? '',
      dataHora: json['dataHora'] ?? '',
    );
  }
}
