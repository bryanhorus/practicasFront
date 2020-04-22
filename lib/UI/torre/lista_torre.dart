

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/UI/torre/actualizar_torre.dart';
import 'package:tenic_api/bloc/torre_bloc.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/torre_model.dart';
import 'package:tenic_api/resource/constants.dart';

import '../../navigator.dart';

class ListaTorre extends StatefulWidget {
  final Torre torre;
  const ListaTorre({Key key, this.torre}) : super(key: key);

  @override
  _ListaTorreState createState() => _ListaTorreState();
}

class _ListaTorreState extends State<ListaTorre>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Torre torre;
  final TorreBloc torreBloc = TorreBloc();
  ApiResponse apiResponse;

  //Torre torre;

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  final List<String> ciudad = [];
  List<Torre> listTorre = List();

  _handleSubmitted() {
    torreBloc.listarTorre().then((apiResponse) {
      setState(() {
        listTorre = apiResponse.listTorre;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    TorreBloc();
    _handleSubmitted();
  }
/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.tittleListaTorre),
        actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {TecniNavigator.goToRegistrarTorre(context);},
            ),
          ],
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(15.0),
            itemCount: listTorre.length,
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                color: Colors.blue[indice],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(
                        listTorre[indice].nombre,
                          style: TextStyle(fontSize: 20, color: Colors.black87,fontWeight: FontWeight.bold)
                          ),
                      subtitle: Text(listTorre[indice].identificacion),
                      leading: Icon(Icons.place),
                      onTap: () {
                        print(listTorre[indice].nombre);
                        torre = listTorre[indice];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ActualizarTorre(
                                      torre: torre,
                                    )));
                      },
                    ),
                  ],
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
                          _delete(torre);
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
