import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

import '../entities/usuario.dart';
import '../errors/failures.dart';

abstract class IAutenticacaoRepository {
  Future<Either<Failure, Usuario>> autenticarEmailSenha(
      {@required String email, @required String senha});

  Future<Either<Failure, Usuario>> usuarioLogado();
}
