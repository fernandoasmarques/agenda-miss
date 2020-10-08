import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'app_controller.dart';
import 'app_widget.dart';
import 'core/auth_store.dart';
import 'core/splash_screen.dart';
import 'modules/autenticacao/autenticacao_module.dart';
import 'modules/autenticacao/domain/usecases/usuario_logado.dart';
import 'modules/autenticacao/external/datasources/firebase_datasource.dart';
import 'modules/autenticacao/infra/repositories/autenticacao_repository_impl.dart';
import 'modules/configuracao_inicial/configuracao_inicial_module.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [
        $AuthStore,
        $AppController,
        $UsuarioLogadoImpl,
        $FirebaseDatasourceImpl,
        $AutenticacaoRepository,
        Bind((i) => FirebaseAuth.instance),
      ];

  @override
  List<ModularRouter> get routers => [
        ModularRouter('/', child: (_, __) => SplashScreen()),
        ModularRouter("/aut", module: AutenticacaoModule()),
        ModularRouter("/home", module: ConfiguracaoInicialModule())
      ];

  @override
  Widget get bootstrap => AppWidget();

  static Inject get to => Inject<AppModule>.of();
}
