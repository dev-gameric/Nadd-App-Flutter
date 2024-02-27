import 'package:flutter/material.dart';

import '../repository/size_repository.dart';

void iniciarConfiguracoes() {
  SizeRepository().setSizes(
      // ignore: deprecated_member_use
      MediaQueryData.fromView(WidgetsBinding.instance.window).size.height,
      // ignore: deprecated_member_use
      MediaQueryData.fromView(WidgetsBinding.instance.window).size.width);
}
