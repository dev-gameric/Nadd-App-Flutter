class DadosDeTipoAtendimento {
  final String nome;
  final String normalEmergencialEnum;
  final String individualColetivoEnum;

  DadosDeTipoAtendimento({
    required this.nome,
    required this.normalEmergencialEnum,
    required this.individualColetivoEnum,
  });

  factory DadosDeTipoAtendimento.fromJson(Map<String, dynamic> json) {
    return DadosDeTipoAtendimento(
      nome: json['nome'],
      normalEmergencialEnum: json['normalEmergencialEnum'],
      individualColetivoEnum: json['individualColetivoEnum'],
    );
  }
}
