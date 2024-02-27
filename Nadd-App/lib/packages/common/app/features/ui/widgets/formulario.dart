// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable

import 'package:flutter/material.dart';

import '../../formatador/service/formatar_input/formatar_input.dart';
import '../../validador/service/validar.dart';
import '../cores/cores.dart';
import '../texto/tamanho_texto.dart';

class Formulario extends StatelessWidget {
  String tipo;
  TextEditingController editingController;
  String? hint;
  String? textoAjuda;
  IconData? icone;
  Widget? iconeSufixo;
  Color? corPrincipal;
  bool obscuro; //padrao FALSE
  int maxLines; //padrao 1
  int minLines; //padrao 1
  TextInputType keyboard; //padrao NAME
  bool obrigatorio; //padrao true
  String artigo; //padrao "o"
  String chave;
  void Function(String)? onChanged;
  void Function()? onTap;
  Formulario(
      {Key? key,
      required this.tipo,
      required this.editingController,
      this.hint,
      this.textoAjuda,
      this.icone,
      this.corPrincipal,
      this.obscuro = false,
      this.maxLines = 1,
      this.minLines = 1,
      this.keyboard = TextInputType.name,
      this.obrigatorio = true,
      this.artigo = 'o',
      this.chave = '',
      this.onTap,
      this.iconeSufixo,
      this.onChanged})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 10),
        child: TextFormField(
          cursorColor: corPrincipal,
          controller: editingController,
          style:
              TextStyle(fontSize: muitoPequeno, color: corPrincipal ?? preto),
          decoration: InputDecoration(
            fillColor: corPrincipal,
            focusColor: corPrincipal,
            hoverColor: corPrincipal,
            labelText: tipo,
            labelStyle:
                corPrincipal == null ? null : TextStyle(color: corPrincipal),
            hintText: hint ?? 'Entre com $artigo $tipo...',
           
            hintStyle: corPrincipal == null
                ? null
                : TextStyle(
                    fontWeight: FontWeight.w400,
                    color: corPrincipal!.withOpacity(0.7)),
            helperText: textoAjuda,
            helperStyle:
                corPrincipal == null ? null : TextStyle(color: corPrincipal),
            prefixIcon: icone == null ? null : Icon(icone),
            prefixIconColor: corPrincipal,
            suffixIcon: iconeSufixo,
            suffixIconColor: corPrincipal,
            focusedBorder: corPrincipal == null
                ? null
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(
                      color: corPrincipal!,
                      width: 1.0,
                    ),
                  ),
            enabledBorder: corPrincipal == null
                ? null
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(
                      color: corPrincipal!.withOpacity(0.8),
                      width: 0.5,
                    ),
                  ),
            errorBorder: corPrincipal == null
                ? null
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(
                      color: vermelho,
                      width: 1.0,
                    ),
                  ),
            focusedErrorBorder: corPrincipal == null
                ? null
                : OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18.0),
                    borderSide: BorderSide(
                      color: vermelho,
                      width: 1.0,
                    ),
                  ),
            // fillColor: Theme.of(context).colorScheme.secondary,
            //focusColor: Theme.of(context).colorScheme.secondary,
            // hoverColor: Theme.of(context).colorScheme.secondary,
          ),
          keyboardType: keyboard,
          inputFormatters: FormatarInput.automatico(chave),
          textInputAction: TextInputAction.next,
          onTap: onTap,
          onEditingComplete: () {},
          validator: (value) {
            if (value == null || value.isEmpty) {
              if (obrigatorio) {
                return 'Informe $artigo $tipo';
              }
              return null;
            }
            return Validar.any(value, chave);
          },
          onChanged: onChanged,
          obscureText: obscuro,
        ));
  }
}
