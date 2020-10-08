import 'package:flutter_modular/flutter_modular.dart';

import 'presenter/configuracao/configuracao_controller.dart';
import 'presenter/configuracao/configuracao_page.dart';

class ConfiguracaoInicialModule extends ChildModule {
  @override
  List<Bind> get binds => [
        $ConfiguracaoController,
      ];

  @override
  List<ModularRouter> get routers => [
    ModularRouter("/", child: (context, args) => ConfiguracaoPage()),
  ];

  static Inject get to => Inject<ConfiguracaoInicialModule>.of();
}
