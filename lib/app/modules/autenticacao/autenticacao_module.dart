import 'package:flutter_modular/flutter_modular.dart';

import 'domain/usecases/autenticar_email_senha.dart';
import 'domain/usecases/usuario_logado.dart';
import 'external/datasources/firebase_datasource.dart';
import 'infra/repositories/autenticacao_repository_impl.dart';
import 'presenter/pages/entrar/entrar_controller.dart';
import 'presenter/pages/entrar/entrar_page.dart';
import 'presenter/pages/home/home_controller.dart';
import 'presenter/pages/home/home_page.dart';
import 'presenter/pages/registrar/registrar_controller.dart';
import 'presenter/pages/registrar/registrar_page.dart';
import 'presenter/widgets/loading_dialog.dart';

class AutenticacaoModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $RegistrarController,
        $EntrarController,
        $HomeController,
        $LoadingDialogImpl,
        $AutenticarEmailSenhaImpl,
        $AutenticacaoRepository,
        $FirebaseDatasourceImpl,
        $UsuarioLogadoImpl
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter("/", child: (context, args) => HomePage()),
        ModularRouter("/entrar", child: (context, args) => EntrarPage()),
        ModularRouter("/registrar", child: (context, args) => RegistrarPage()),
      ];

  static Inject get to => Inject<AutenticacaoModule>.of();
}
