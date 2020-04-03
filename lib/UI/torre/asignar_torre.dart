import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/resource/constants.dart';

class AsignarTorre extends StatefulWidget {
  const AsignarTorre({Key key}) : super(key: key);

  @override
  AsignarTorreState createState() => AsignarTorreState();
}

class AsignarTorreState extends State<AsignarTorre>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> nombres = [
    "Torre 1",
    "Torre 2",
    "Torre 3",
    "Torre 4",
    "Torre 5"
  ];
  final List<String> ciudad = [
    "Ciudad 1",
    "Ciudad 2",
    "Torre 3",
    "Torre 4",
    "Torre 5",
    "Torre 6",
    "Torre 7"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.appBarTorre)),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        ListView.builder(
          // tamaño de la lista
          itemCount: nombres.length,
          // Constructor de widget para cada elemento de la lista
          itemBuilder: (BuildContext context, int indice) {
            return Card(
              //le damos un color de la lista de primarios
              color: Colors.primaries[indice],
              //agregamos un contenedor de 100 de alto
              child: Container(
                height: 50,
                child: Center(
                  //Agregamos el nombre con un Widget Text
                  child: Text(
                    nombres[indice],
                    //le damos estilo a cada texto
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ),
              ),
            );
          },
        ),
      ]),
    );
  }
}
