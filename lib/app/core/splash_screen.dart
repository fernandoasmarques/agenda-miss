import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'auth_store.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();

  final _authStore = Modular.get<AuthStore>();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() {
    widget._authStore.checkLogin().then(
      (user) {
        if (user == null) {
          _irParaPath('/aut');
        } else {
          _irParaPath('/home');
        }
      },
    );
  }

  void _irParaPath(String path) =>
      Modular.to.pushNamedAndRemoveUntil('$path', (_) => false);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(color: Colors.white),
    );
  }
}
