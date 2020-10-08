import '../models/usuario_model.dart';

abstract class IAutenticacaoDataSource {
  Future<UsuarioModel> autenticarEmailSenha({String email, String senha});
  Future<UsuarioModel> usuarioAtual();
}
