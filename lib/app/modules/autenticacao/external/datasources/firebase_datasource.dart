import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/errors/failures.dart';
import '../../infra/datasources/i_autenticacao_datasource.dart';
import '../../infra/models/usuario_model.dart';

part 'firebase_datasource.g.dart';

@Injectable(singleton: false)
class FirebaseDatasourceImpl implements IAutenticacaoDataSource {
  final FirebaseAuth auth;

  FirebaseDatasourceImpl(this.auth);

  @override
  Future<UsuarioModel> autenticarEmailSenha(
      {String email, String senha}) async {
    final result =
        await auth.signInWithEmailAndPassword(email: email, password: senha);
    final user = result.user;
    return UsuarioModel(uid: user.uid, email: user.email);
  }

  @override
  Future<UsuarioModel> usuarioAtual() async{
    final user = auth.currentUser;
    if (user == null) throw ErrorGetLoggedUser();
    return UsuarioModel(
      uid: user.uid,
      email: user.email,
    );
  }
}
