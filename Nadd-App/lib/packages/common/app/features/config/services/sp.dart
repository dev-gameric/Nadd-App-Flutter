import 'package:shared_preferences/shared_preferences.dart';

class Sp {
  final Future<SharedPreferences> _sp = SharedPreferences.getInstance();
  Future<SharedPreferences> get sp => _sp;
  static final Sp instance = Sp._();
  Sp._();
  factory Sp() => Sp.instance;
}
