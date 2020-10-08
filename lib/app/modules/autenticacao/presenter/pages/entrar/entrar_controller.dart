import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../domain/entities/dados_autenticacao.dart';
import '../../../domain/usecases/autenticar_email_senha.dart';
import '../../widgets/loading_dialog.dart';

part 'entrar_controller.g.dart';

@Injectable()
class EntrarController = _EntrarControllerBase with _$EntrarController;

abstract class _EntrarControllerBase with Store {
  final IAutenticarEmailSenha usecase;
  final LoadingDialog loading;

  _EntrarControllerBase(this.usecase, this.loading);

  @observable
  String email = "";

  @observable
  String senha = "";

  @action
  String setEmail(String value) => email = value;

  @action
  String setSenha(String value) => senha = value;

  @computed
  DadosAutenticacao get credential =>
      DadosAutenticacao(email: email, senha: senha);

  @computed
  bool get isValid => credential.isValidEmail && credential.isValidSenha;

  Future<String> autenticarEmailSenha() async {
    loading.show();
    await Future.delayed(Duration(seconds: 1));
    final result = await usecase(credential);
    await loading.hide();
    String text;
    result.fold(
      (failure) {
        text = failure.message;
      },
      (usuario) {
        text = 'logado';
      },
    );
    return text;
  }
}
