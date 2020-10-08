import 'package:edge_alert/edge_alert.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';

import 'entrar_controller.dart';

class EntrarPage extends StatefulWidget {
  final String title;
  const EntrarPage({Key key, this.title = "Entrar"}) : super(key: key);

  @override
  _EntrarPageState createState() => _EntrarPageState();
}

class _EntrarPageState extends ModularState<EntrarPage, EntrarController> {
  final _formKey = GlobalKey<FormState>();
  final _emailFocus = FocusNode();
  final _senhaFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100],
      body: Builder(
        builder: (context) {
          return Stack(
            children: <Widget>[
              FlareActor(
                'assets/flare/wave_test2.flr',
                alignment: Alignment.topCenter,
                fit: BoxFit.cover,
                animation: "Flow",
              ),
              Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(
                    right: 20,
                    top: 60,
                  ),
                  child: Image(
                    height: 40,
                    fit: BoxFit.fitWidth,
                    color: Colors.white,
                    image: AssetImage('assets/img/logo_copy.png'),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    top: 40,
                  ),
                  child: IconButton(
                    onPressed: () => Modular.to.pop(),
                    icon: Icon(Icons.arrow_back_ios),
                    color: Colors.white,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: FractionallySizedBox(
                  heightFactor: .7,
                  widthFactor: 1,
                  child: ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(25),
                    ),
                    child: Container(
                      color: Colors.white,
                      child: SingleChildScrollView(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 35,
                            left: 20,
                            right: 20,
                            bottom: 20,
                          ),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  'Entrar',
                                  style: GoogleFonts.raleway(
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  'Digite seu e-mail e senha',
                                  style: GoogleFonts.raleway(fontSize: 14),
                                ),
                                SizedBox(
                                  height: 30,
                                ),
                                Material(
                                  elevation: 10.0,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: TextFormField(
                                    onChanged: controller.setEmail,
                                    focusNode: _emailFocus,
                                    textInputAction: TextInputAction.next,
                                    onFieldSubmitted: (term) {
                                      _emailFocus.unfocus();
                                      FocusScope.of(context)
                                          .requestFocus(_senhaFocus);
                                    },
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: "E-mail",
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                    validator: (value) {
                                      if (!controller.credential.isValidEmail) {
                                        return 'Digite um e-mail válido';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Material(
                                  elevation: 10.0,
                                  shadowColor: Colors.grey,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  child: TextFormField(
                                    onChanged: controller.setSenha,
                                    focusNode: _senhaFocus,
                                    obscureText: true,
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.all(10),
                                      border: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.white),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      labelText: "Senha",
                                      filled: true,
                                      fillColor: Colors.white,
                                    ),
                                    validator: (value) {
                                      if (!controller.credential.isValidSenha) {
                                        return '''Sua senha deve ter 4 dígitos ou mais''';
                                      }
                                      return null;
                                    },
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: GestureDetector(
                                      onTap: () {},
                                      child: Text(
                                        'ESQUECI MINHA SENHA',
                                        style: GoogleFonts.raleway(
                                            fontSize: 14,
                                            decoration:
                                                TextDecoration.underline,
                                            color: Colors.black,
                                            letterSpacing: 0.5,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 25),
                                Container(
                                  height: 150,
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        height: 60,
                                        width: double.infinity,
                                        child: RaisedButton(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          onPressed: () async {
                                            if (_formKey.currentState
                                                .validate()) {
                                              final text = await controller
                                                  .autenticarEmailSenha();
                                              _mostrarAlerta(text);
                                            }
                                          },
                                          child: Text(
                                            'ENTRAR ',
                                            style: GoogleFonts.raleway(
                                              fontSize: 16,
                                              color: Colors.white,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          color: Colors.pink,
                                        ),
                                      ),
                                      Row(
                                        children: <Widget>[
                                          Expanded(child: Divider()),
                                          Text(
                                            ' OU ',
                                            style: GoogleFonts.raleway(
                                              fontSize: 12,
                                              color: Colors.black,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          Expanded(child: Divider()),
                                        ],
                                      ),
                                      Container(
                                        height: 60,
                                        width: double.infinity,
                                        child: RaisedButton.icon(
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          onPressed: () {},
                                          icon: Icon(
                                            Entypo.facebook,
                                            color: Colors.white,
                                          ),
                                          label: Text(
                                            'ENTRAR COM O FACEBOOK',
                                            style: GoogleFonts.raleway(
                                              fontSize: 16,
                                              color: Colors.white,
                                              letterSpacing: 0.5,
                                            ),
                                          ),
                                          color: const Color(0xFF4267B2),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  void _mostrarAlerta(String text) {
    EdgeAlert.show(context,
        description: '$text',
        duration: 3,
        icon: Icons.error,
        gravity: EdgeAlert.TOP,
        backgroundColor: Colors.red);
  }
}
