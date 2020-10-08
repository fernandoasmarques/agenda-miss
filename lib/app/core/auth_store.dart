
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../modules/autenticacao/domain/usecases/usuario_logado.dart';

part 'auth_store.g.dart';

@Injectable()
class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final IUsuarioLogado usuarioLogado;

  _AuthStoreBase(this.usuarioLogado);

  Future<bool> checkLogin() async {
    var result = await usuarioLogado();
    return result.fold(
      (l) => null,  
      (usuario) => true,
    );
  }
}
