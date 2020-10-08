import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home_controller.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image(
              alignment: Alignment.topLeft,
              fit: BoxFit.cover,
              image: AssetImage('assets/img/home_background_img.jpg'),
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes
                        : null,
                  ),
                );
              },
            ),
          ),
          FlareActor(
            'assets/flare/flare_home_background2.flr',
            alignment: Alignment.topCenter,
            fit: BoxFit.fitWidth,
            animation: "Flow",
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: FractionallySizedBox(
              widthFactor: .2,
              heightFactor: .5,
              child: Container(
                child: Column(
                  children: [
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: FlatButton(
                        color: Colors.pink,
                        onPressed: () {
                          Modular.link.pushNamed('/registrar');
                        },
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            'CADASTRAR',
                            style: GoogleFonts.raleway(
                                fontSize: 20, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 1,
                      fit: FlexFit.tight,
                      child: FlatButton(
                        color: Colors.white,
                        onPressed: () {
                          Modular.link.pushNamed('/entrar');
                        },
                        child: RotatedBox(
                          quarterTurns: 1,
                          child: Text(
                            'ENTRAR',
                            style: GoogleFonts.raleway(
                                fontSize: 20, color: Colors.pink),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(
                left: 10,
                bottom: 50,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image(
                    height: 75,
                    fit: BoxFit.cover,
                    image: AssetImage('assets/img/logo.png'),
                  ),
                  Text(
                    'BEM-VINDA(O) AO APLICATIVO \nPARA REALIZAÇÃO DE SERVIÇOS',
                    style: GoogleFonts.raleway(
                        fontSize: 14, color: Colors.white, letterSpacing: 1),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
