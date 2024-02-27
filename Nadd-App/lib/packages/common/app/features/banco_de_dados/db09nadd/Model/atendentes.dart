class DadosDeAtendentes {
  final int id;
  final String nome;

  DadosDeAtendentes({
    required this.id,
    required this.nome,
  });

  // Método para criar uma instância do Projeto a partir de um mapa (JSON).
  factory DadosDeAtendentes.fromJson(Map<String, dynamic> json) {
    return DadosDeAtendentes(
      id: json['id'] ?? '',
      nome: json['nome'] ?? '',
    );
  }
}
