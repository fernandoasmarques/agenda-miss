import 'package:meta/meta.dart';

import '../../domain/entities/usuario.dart';

class UsuarioModel extends Usuario {
  UsuarioModel({String uid, @required String email})
      : super(uid: uid, email: email);

  Usuario toUsuario() => this;
}
