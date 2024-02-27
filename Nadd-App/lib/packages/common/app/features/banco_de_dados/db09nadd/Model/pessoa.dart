class DadosDePessoa {
  final String nome;
  final int celular;
  final String email;
  final String senha;

  DadosDePessoa(
      {required this.nome,
      required this.celular,
      required this.email,
      required this.senha});

  factory DadosDePessoa.fromJson(Map<String, dynamic> json) {
    return DadosDePessoa(
      nome: json['nome'] ?? '',
      celular: json['celular'] ?? '',
      email: json['email'] ?? '',
      senha: json['senha'] ?? '',
    );
  }
}
