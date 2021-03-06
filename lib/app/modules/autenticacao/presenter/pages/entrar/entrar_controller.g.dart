// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'entrar_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $EntrarController = BindInject(
  (i) => EntrarController(i<IAutenticarEmailSenha>(), i<LoadingDialog>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$EntrarController on _EntrarControllerBase, Store {
  Computed<DadosAutenticacao> _$credentialComputed;

  @override
  DadosAutenticacao get credential => (_$credentialComputed ??=
          Computed<DadosAutenticacao>(() => super.credential,
              name: '_EntrarControllerBase.credential'))
      .value;
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid => (_$isValidComputed ??= Computed<bool>(() => super.isValid,
          name: '_EntrarControllerBase.isValid'))
      .value;

  final _$emailAtom = Atom(name: '_EntrarControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$senhaAtom = Atom(name: '_EntrarControllerBase.senha');

  @override
  String get senha {
    _$senhaAtom.reportRead();
    return super.senha;
  }

  @override
  set senha(String value) {
    _$senhaAtom.reportWrite(value, super.senha, () {
      super.senha = value;
    });
  }

  final _$_EntrarControllerBaseActionController =
      ActionController(name: '_EntrarControllerBase');

  @override
  String setEmail(String value) {
    final _$actionInfo = _$_EntrarControllerBaseActionController.startAction(
        name: '_EntrarControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$_EntrarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String setSenha(String value) {
    final _$actionInfo = _$_EntrarControllerBaseActionController.startAction(
        name: '_EntrarControllerBase.setSenha');
    try {
      return super.setSenha(value);
    } finally {
      _$_EntrarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
email: ${email},
senha: ${senha},
credential: ${credential},
isValid: ${isValid}
    ''';
  }
}
