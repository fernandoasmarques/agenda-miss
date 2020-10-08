import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'configuracao_controller.g.dart';

@Injectable()
class ConfiguracaoController = _ConfiguracaoControllerBase
    with _$ConfiguracaoController;

abstract class _ConfiguracaoControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
