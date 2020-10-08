import 'package:string_validator/string_validator.dart' as validator;
import 'package:meta/meta.dart';

class DadosAutenticacao {
  final String email;
  final String senha;

  const DadosAutenticacao({
    @required this.email,
    @required this.senha,
  });

  bool get isValidEmail => validator.isEmail(email ?? "");
  bool get isValidSenha =>
      senha != null && senha.isNotEmpty && senha.length >= 4;
}
