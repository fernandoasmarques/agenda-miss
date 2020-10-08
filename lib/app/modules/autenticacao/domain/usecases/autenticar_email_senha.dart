import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../entities/dados_autenticacao.dart';
import '../entities/usuario.dart';
import '../errors/failures.dart';
import '../repositories/i_autenticacao_repository.dart';

part 'autenticar_email_senha.g.dart';

abstract class IAutenticarEmailSenha {
  Future<Either<Failure, Usuario>> call(DadosAutenticacao dadosAutenticacao);
}

@Injectable(singleton: false)
class AutenticarEmailSenhaImpl implements IAutenticarEmailSenha {
  final IAutenticacaoRepository repository;

  AutenticarEmailSenhaImpl(this.repository);

  @override
  Future<Either<Failure, Usuario>> call(
      DadosAutenticacao dadosAutenticacao) async {
    return await repository.autenticarEmailSenha(
        email: dadosAutenticacao.email, senha: dadosAutenticacao.senha);
  }
}
