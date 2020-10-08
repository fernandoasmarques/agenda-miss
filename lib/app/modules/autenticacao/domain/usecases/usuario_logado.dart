import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../entities/usuario.dart';
import '../errors/failures.dart';
import '../repositories/i_autenticacao_repository.dart';

part 'usuario_logado.g.dart';

abstract class IUsuarioLogado {
  Future<Either<Failure, Usuario>> call();
}

@Injectable(singleton: false)
class UsuarioLogadoImpl implements IUsuarioLogado {
  final IAutenticacaoRepository repository;

  UsuarioLogadoImpl(this.repository);

  @override
  Future<Either<Failure, Usuario>> call() {
    return repository.usuarioLogado();
  }
}
