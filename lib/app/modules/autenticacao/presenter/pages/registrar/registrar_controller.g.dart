// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registrar_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $RegistrarController = BindInject(
  (i) => RegistrarController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$RegistrarController on _RegistrarControllerBase, Store {
  final _$valueAtom = Atom(name: '_RegistrarControllerBase.value');

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  final _$_RegistrarControllerBaseActionController =
      ActionController(name: '_RegistrarControllerBase');

  @override
  void increment() {
    final _$actionInfo = _$_RegistrarControllerBaseActionController.startAction(
        name: '_RegistrarControllerBase.increment');
    try {
      return super.increment();
    } finally {
      _$_RegistrarControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value}
    ''';
  }
}
