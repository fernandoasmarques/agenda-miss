import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'registrar_controller.dart';

class RegistrarPage extends StatefulWidget {
  final String title;
  const RegistrarPage({Key key, this.title = "Registrar"}) : super(key: key);

  @override
  _RegistrarPageState createState() => _RegistrarPageState();
}

class _RegistrarPageState
    extends ModularState<RegistrarPage, RegistrarController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
