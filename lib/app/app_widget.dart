import 'package:asuka/asuka.dart' as asuka;
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';


class AppWidget extends StatelessWidget {
  final _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
      future: _initialization,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            builder: asuka.builder,
            navigatorKey: Modular.navigatorKey,
            title: 'Agenda Miss',
            theme: ThemeData(
              primarySwatch: Colors.pink,
            ),
            initialRoute: '/',
            debugShowCheckedModeBanner: false,
            onGenerateRoute: Modular.generateRoute,
          );
        } else {
          return Material(
            child: Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.pink),
              ),
            ),
          );
        }
      },
    );
  }
}