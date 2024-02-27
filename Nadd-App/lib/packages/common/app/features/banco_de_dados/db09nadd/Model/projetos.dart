import 'package:intl/intl.dart';

class DadosDoProjeto {
  final String nome;
  final String proponente;
  final String dataInicio;
  final String dataFim;
  final String statusProjetoEnum;

  DadosDoProjeto({
    required this.nome,
    required this.proponente,
    required this.dataInicio,
    required this.dataFim,
    required this.statusProjetoEnum,
  });

  factory DadosDoProjeto.fromJson(Map<String, dynamic> json) {
    return DadosDoProjeto(
      nome: json['nome'] ?? '',
      proponente: json['proponente'] ?? '',
      dataInicio: json['dataInicio'] ?? '',
      dataFim: json['dataFim'] ?? '',
      statusProjetoEnum: json['statusProjetoEnum'] ?? '',
    );
  }
}

String formatarData(String data) {
  final formatoEntrada = DateFormat('dd/MM/yyyy');
  final formatoSaida = DateFormat('yyyy-MM-dd');
  final dataFormatada = formatoSaida.format(formatoEntrada.parse(data));
  return dataFormatada;
}
