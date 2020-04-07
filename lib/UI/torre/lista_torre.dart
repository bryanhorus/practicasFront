import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/UI/torre/actualizar_torre.dart';
import 'package:tenic_api/bloc/torre_bloc.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/resource/constants.dart';

class ListaTorre extends StatefulWidget {
  const ListaTorre({Key key}) : super(key: key);

  @override
  ListaTorreState createState() => ListaTorreState();
}

class ListaTorreState extends State<ListaTorre>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  TorreBLoC torreBLoC;

  ApiResponse apiResponse;

  Torre torre;

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  final List<String> nombres = [];
  final List<String> ciudad = [];
  List<Torre> listTorre = List();

  _handleSubmitted() {
    torreBLoC.listarTorre().then((apiResponse) {
      setState(() {
        listTorre = apiResponse.listTorre;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    torreBLoC = TorreBLoC(context);

    _handleSubmitted();
  }
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.appBarTorre),
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            // tamaño de la lista
            //itemCount: listMunicipio.length,
            // Constructor de widget para cada elemento de la lista
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                //le damos un color de la lista de primarios
                color: Colors.primaries[indice],
                //agregamos un contenedor de 100 de alto
                child: Container(
                  height: 50,
                  child: Center(
                    //child: Text(
                      //listMunicipio[indice].nombre,
                      //le damos estilo a cada texto
                      //style: TextStyle(fontSize: 20, color: Colors.white),
                    //),
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.tittleListaUsuarios),
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
      Container(
      child: ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(20.0),
        // tamaño de la lista
        itemCount: listTorre.length,
        // Constructor de widget para cada elemento de la lista
        itemBuilder: (BuildContext context, int indice) {
          return Card(
            //le damos un color de la lista de primarios
            color: Colors.accents[indice],
            //agregamos un contenedor de 100 de alto
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(
                    listTorre[indice].nombre,
                    //le damos estilo a cada texto
                    style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold)),
                  /*onTap: (){
                    print(listUsuario[indice].nombre);
                    usuario = listUsuario[indice];

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ActualizarUsuario( usuario:usuario)));
                  },*/
                ),
                // ignore: deprecated_member_use
                ButtonTheme.bar(
                  // make buttons use the appropriate styles for cards
                  child: ButtonBar(
                    children: <Widget>[
                      FlatButton(
                        child: const Text('Editar', style: TextStyle(fontSize: 15, color: Colors.white)),
                        onPressed: () {
                          print(listTorre[indice].nombre);
                          torre = listTorre[indice];

                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ActualizarTorre( torre:torre)));
                        },
                      ),
                      FlatButton(
                        child: const Text('Eliminar', style: TextStyle(fontSize: 15, color: Colors.white)),
                        onPressed: () {
                          print(listTorre[indice].nombre);
                          torre = listTorre[indice];
                          //_delete(torre);
                        },
                      ),
                    ],
                  ),
                ),
              ],
            )
          );
        },
      ),
    ),
      ]
        ),
    );
  }
}