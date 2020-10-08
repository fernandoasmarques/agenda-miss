import 'package:dartz/dartz.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/usuario.dart';
import '../../domain/errors/failures.dart';
import '../../domain/repositories/i_autenticacao_repository.dart';
import '../datasources/i_autenticacao_datasource.dart';

part 'autenticacao_repository_impl.g.dart';

@Injectable(singleton: false)
class AutenticacaoRepository implements IAutenticacaoRepository {
  final IAutenticacaoDataSource dataSource;

  AutenticacaoRepository(this.dataSource);

  @override
  Future<Either<Failure, Usuario>> autenticarEmailSenha(
      {String email, String senha}) async {
    try {
      final usuario =
          await dataSource.autenticarEmailSenha(email: email, senha: senha);
      return Right(usuario);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'wrong-password':
          return Left(ErroAutenticacao('A senha está incorreta'));
          break;
        case 'user-disabled':
          return Left(ErroAutenticacao('Esta conta está desativada'));
          break;
        case 'user-not-found':
          return Left(ErroAutenticacao(
              'Não existe uma conta com este endereço de e-mail'));
          break;
        case 'too-many-requests':
          return Left(
              ErroAutenticacao('Por favor, tente novamente em alguns minutos'));
          break;
        case 'network-request-failed':
          return Left(ErroAutenticacao('Sem conexão com a internet'));
          break;
        default:
          return Left(ErroAutenticacao(e.code));
      }
    }
  }

  @override
  Future<Either<Failure, Usuario>> usuarioLogado() async{
    try {
      var user = await dataSource.usuarioAtual();
      return Right(user);
    } on ErrorGetLoggedUser {
      return Left(ErrorGetLoggedUser());
    }
  }
}
