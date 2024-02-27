import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../../ui/cores/cores.dart';
import '../../ui/texto/textos.dart';

class Validar {
  static String? any(String valor, String chave) {
    switch (chave) {
      case 'email':
        return email(valor.trim());
      case 'senha':
        return senha(valor);
      case 'cpf':
        return cpf(valor.trim());
      case 'dataNasc':
        return dataNasc(valor.trim());
      case 'nome':
        return nome(valor.trim());
      case 'numero':
        return numero(valor.trim());
      case 'cargo':
        return cargo(valor.trim());
      case 'data':
        return validarData(valor.trim());
      case 'repentinoGradual':
        return repentinoGradual(valor.trim());
      case 'statusProjeto':
        return statusProjeto(valor.trim());
      default:
        return null;
    }
  }

  static String? cargo(String cargo) {
    String discente = 'discente';
    String docente = 'docente';
    String coordenador = 'coordenador';
    RegExp regexDiscente = RegExp(discente);
    RegExp regexDocente = RegExp(docente);
    RegExp regexCoordenador = RegExp(coordenador);
    RegExp regexNumero = RegExp(r'\d');

    if (regexNumero.hasMatch(cargo)) {
      return 'O campo não deve conter números';
    }
    if (regexDiscente.hasMatch(cargo)) {
      return null;
    } else if (regexDocente.hasMatch(cargo)) {
      return null;
    } else if (regexCoordenador.hasMatch(cargo)) {
      return null;
    }

    return 'O cargo deve ser "discente", "docente" ou "coordenador"';
  }

  static String? repentinoGradual(String repentinoGradual) {
    String repentino = 'repentino';
    String gradual = 'gradual';
    RegExp regexRepentino = RegExp(repentino);
    RegExp regexGradual = RegExp(gradual);
    RegExp regexNumero = RegExp(r'\d');

    if (regexNumero.hasMatch(repentinoGradual)) {
      return 'O campo não deve conter números';
    }
    if (regexRepentino.hasMatch(repentinoGradual)) {
      return null;
    } else if (regexGradual.hasMatch(repentinoGradual)) {
      return null;
    }

    return 'O campo deve ser "repentino" ou "gradual"';
  }

  static String? statusProjeto(String statusProjeto) {
    String planejado = 'planejado';
    String encerrado = 'encerrado';
    String andamento = 'andamento';
    RegExp regexPlanejado = RegExp(planejado);
    RegExp regexEncerrado = RegExp(encerrado);
    RegExp regexAndamento = RegExp(andamento);
    RegExp regexNumero = RegExp(r'\d');

    if (regexNumero.hasMatch(statusProjeto)) {
      return 'O campo não deve conter números';
    }
    if (regexPlanejado.hasMatch(statusProjeto)) {
      return null;
    } else if (regexEncerrado.hasMatch(statusProjeto)) {
      return null;
    } else if (regexAndamento.hasMatch(statusProjeto)) {
      return null;
    }

    return 'O cargo deve ser "planejado", "encerrado" ou "andamento"';
  }

  static String? numero(String numero) {
    RegExp regexTamanho = RegExp(r'^.{6,7}$');
    RegExp regexLetra = RegExp(r'[a-zA-Z]');
    if (!regexTamanho.hasMatch(numero)) {
      return 'O campo deve ter 6 caracteres numéricos';
    }
    if (regexLetra.hasMatch(numero)) {
      return 'O campo não deve ter letras';
    }
    return null;
  }

  static String? email(String email) {
    email = email.replaceAll(
        RegExp(r' '), ''); // Remove todos os os espaços em branco
    final emailRegex = RegExp(
        r'''^[a-zA-Z0-9.!#$%&\'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$''');
    if (!emailRegex.hasMatch(email)) {
      return 'Por favor, insira um email válido';
    }
    return null;
  }

  static Rx<Widget> senhaConfirm(
      {required Rx<String> senha,
      required Rx<String> senhaConfirm,
      required String mensagemFalse,
      String? mensagemTrue}) {
    if (senhaConfirm.value != '') {
      if (senhaConfirm.value != senha.value) {
        return Texto.simples(
          mensagemFalse,
          peso: 4,
          corTexto: vermelho,
        ).obs;
      } else if (mensagemTrue != null) {
        return Texto.simples(
          mensagemTrue,
          peso: 4,
          corTexto: vermelho,
        ).obs;
      } else {
        return const SizedBox().obs;
      }
    }
    return const SizedBox().obs;
  }

  static Widget senhaCreate({required Rx<String> senhaCreate}) {
    String senha = senhaCreate.value;
    RegExp regexTamanho = RegExp(r'^.{6,32}$');
    RegExp regexNumero = RegExp(r'\d');
    RegExp regexLetra = RegExp(r'[a-zA-Z]');
    Color corConfirm = azul.withBlue(255).withGreen(180);
    List<Widget> messages = [
      Texto.simples(
        'Deve ter entre 6 e 32 caracteres',
        corTexto: !regexTamanho.hasMatch(senha) ? vermelho : corConfirm,
      ),
      Texto.simples(
        'Deve ter pelo menos um número',
        corTexto: !regexNumero.hasMatch(senha) ? vermelho : corConfirm,
      ),
      Texto.simples(
        'Deve ter pelo menos uma letra',
        corTexto: !regexLetra.hasMatch(senha) ? vermelho : corConfirm,
      ),
    ];
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: messages,
      ),
    );
  }

  static String? senha(String senha) {
    RegExp regexTamanho = RegExp(r'^.{6,32}$');
    RegExp regexNumero = RegExp(r'\d');
    RegExp regexLetra = RegExp(r'[a-zA-Z]');
    if (!regexTamanho.hasMatch(senha)) {
      return 'A senha deve ter entre 6 e 32 caracteres';
    } else if (!regexNumero.hasMatch(senha)) {
      return 'A senha deve conter pelo menos um número';
    } else if (!regexLetra.hasMatch(senha)) {
      return 'A senha deve conter pelo menos uma letra';
    }
    return null;
  }

  static String? cpf(String cpf) {
    cpf = cpf.replaceAll(RegExp(r'[^\d]'),
        ''); // Remove todos os caracteres não numéricos do CPF

    // Verifica se o CPF possui 11 dígitos
    if (cpf.length != 11) {
      return 'CPF inválido';
    }

    // Verifica o primeiro dígito verificador
    int soma = 0;
    for (int i = 0; i < 9; i++) {
      soma += int.parse(cpf[i]) * (10 - i);
    }
    int digitoVerificador1 = 11 - (soma % 11);
    if (digitoVerificador1 >= 10) {
      digitoVerificador1 = 0;
    }
    if (int.parse(cpf[9]) != digitoVerificador1) {
      return 'CPF inválido';
    }

    // Verifica o segundo dígito verificador
    soma = 0;
    for (int i = 0; i < 10; i++) {
      soma += int.parse(cpf[i]) * (11 - i);
    }
    int digitoVerificador2 = 11 - (soma % 11);
    if (digitoVerificador2 >= 10) {
      digitoVerificador2 = 0;
    }
    if (int.parse(cpf[10]) != digitoVerificador2) {
      return 'CPF inválido';
    }

    // CPF válido
    return null;
  }

  static String? validarData(String validarData) {
    bool dia = true;
    bool mes = true;

    // ignore: no_leading_underscores_for_local_identifiers
    String? _dataValida(int day, int month, int year) {
      // Verifica se o mês é válido
      if (month < 1 || month > 12) {
        mes = false;
      }

      // Verifica se o dia é válido de acordo com o mês
      int daysInMonth;
      if (month == 2) {
        // Verifica se o ano é bissexto
        if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
          daysInMonth = 29;
        } else {
          daysInMonth = 28;
        }
      } else if ([4, 6, 9, 11].contains(month)) {
        daysInMonth = 30;
      } else {
        daysInMonth = 31;
      }

      if (day < 1 || day > daysInMonth) {
        dia = false;
      }
      String? message;
      if (!dia && !mes) {
        message = 'Data Inválida';
      } else if (!dia && !mes) {
        message = 'Dia e Mês inválidos';
      } else if (!dia) {
        message = 'Dia inválido';
      } else if (!mes) {
        message = 'Mês inválido';
      }

      // Se passou pelas verificações anteriores, então a data é válida
      return message;
    }

    // ignore: unused_local_variable, non_constant_identifier_names
    DateTime? DataTime;

    //'11.22.3333'
    //'0123456789
    // Remove todos as barras
    try {
      List<String> split = validarData.split('');
      int dia = int.parse(split[0] + split[1]);
      int mes = int.parse(split[3] + split[4]);
      int ano = int.parse(split[6] + split[7] + split[8] + split[9]);
      String? dataValida = _dataValida(dia, mes, ano);
      if (dataValida == null) {
        DataTime = DateTime(ano, mes, dia);
      } else {
        return dataValida;
      }
    } catch (e) {
      return "Data inválida";
    }

    return null;
  }

  static String? dataNasc(String dataNasc) {
    bool dia = true;
    bool mes = true;
    bool ano = true;
    // ignore: no_leading_underscores_for_local_identifiers
    String? _dataValida(int day, int month, int year) {
      if (year < 1900 || year > 9999) {
        ano = false;
      }
      // Verifica se o mês é válido
      if (month < 1 || month > 12) {
        mes = false;
      }

      // Verifica se o dia é válido de acordo com o mês e o ano
      int daysInMonth;
      if (month == 2) {
        // Verifica se o ano é bissexto
        if (year % 4 == 0 && (year % 100 != 0 || year % 400 == 0)) {
          daysInMonth = 29;
        } else {
          daysInMonth = 28;
        }
      } else if ([4, 6, 9, 11].contains(month)) {
        daysInMonth = 30;
      } else {
        daysInMonth = 31;
      }

      if (day < 1 || day > daysInMonth) {
        dia = false;
      }
      String? message;
      if (!dia && !mes && !ano) {
        message = 'Data Inválida';
      } else if (!dia && !mes) {
        message = 'Dia e Mês inválidos';
      } else if (!dia && !ano) {
        message = 'Dia e Ano inválidos';
      } else if (!mes && !ano) {
        message = 'Mês e Ano inválidos';
      } else if (!dia) {
        message = 'Dia inválido';
      } else if (!mes) {
        message = 'Mês inválido';
      } else if (!ano) {
        message = 'Ano inválido';
      }

      // Se passou pelas verificações anteriores, então a data é válida
      return message;
    }

    DateTime hoje = DateTime.now();
    DateTime? dataNascDateTime;

    //'11.22.3333'
    //'0123456789
    // Remove todos as barras
    try {
      List<String> split = dataNasc.split('');
      int dia = int.parse(split[0] + split[1]);
      int mes = int.parse(split[3] + split[4]);
      int ano = int.parse(split[6] + split[7] + split[8] + split[9]);
      String? dataValida = _dataValida(dia, mes, ano);
      if (dataValida == null) {
        dataNascDateTime = DateTime(ano, mes, dia);
      } else {
        return dataValida;
      }
    } catch (e) {
      return "Data de nascimento inválida";
    }

    int idade = hoje.difference(dataNascDateTime).inDays ~/ 365;
    if (idade < 18) {
      return "É necessário ter pelo menos 18 anos";
    } else {
      return null;
    }
  }

  static String? nome(String nome) {
    if (nome.length < 2) {
      return 'O nome deve conter pelo menos 2 caracteres.';
    } else if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(nome)) {
      return 'O nome deve conter apenas letras ou espaços em branco.';
    }
    return null;
  }
}
