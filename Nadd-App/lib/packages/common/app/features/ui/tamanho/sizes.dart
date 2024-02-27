import 'package:flutter/widgets.dart';
import 'package:nadd/packages/common/app/features/config/repository/size_repository.dart';

double altura = SizeRepository().altura;
double largura = SizeRepository().largura;

void atualizarAlturaLargura(BuildContext context) async {
  await SizeRepository().init(context);
  altura = SizeRepository().altura;
  largura = SizeRepository().largura;
}
