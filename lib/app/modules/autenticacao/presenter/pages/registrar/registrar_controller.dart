import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'registrar_controller.g.dart';

@Injectable()
class RegistrarController = _RegistrarControllerBase with _$RegistrarController;

abstract class _RegistrarControllerBase with Store {
  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  }
}
