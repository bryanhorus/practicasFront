import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:tenic_api/bloc/observacion_bloc.dart';
import 'package:tenic_api/modelo/observacion_model.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';

class ListaObservaciones extends StatefulWidget {
  final Observacion observacion;
  const ListaObservaciones({Key key, this.observacion}) : super(key: key);

  @override
  ListaObservacionesState createState() => ListaObservacionesState();
}

class ListaObservacionesState extends State<ListaObservaciones>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final ObservacionBloc  observacionBloc = ObservacionBloc();
  ApiResponse apiResponse;
  Observacion observacion;

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  List<Observacion> listObservacion = List();

  _handleSubmitted() {
    observacionBloc.listarObservacion().then((apiResponse) {
      setState(() {
        listObservacion = apiResponse.listObservacion;
      });
    });
  }

  void _delete(Observacion observacion) {
    observacionBloc.deleteObservacion(observacion);
    TecniNavigator.goToHomeCoordinador(context);
  }

  @override
  void initState() {
    super.initState();
    ObservacionBloc();
    _handleSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.tittleListaAntenas),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add_circle),
            onPressed: () {
             // TecniNavigator.goToRegistrarObservacionUi(context);
            },
          ),
        ],
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            // tamaño de la lista
            itemCount: listObservacion.length,
            // Constructor de widget para cada elemento de la lista
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                //le damos un color de la lista de primarios
                  color: Colors.blueAccent[indice],
                  //agregamos un contenedor de 100 de alto
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        subtitle: Text(listObservacion[indice].idObservacion.toString()),
                        title: Text(listObservacion[indice].antena.nombre,
                            //le damos estilo a cada texto
                            style:
                            TextStyle(fontSize: 20, color: Colors.black87,fontWeight: FontWeight.bold)),
                        leading: Icon(Icons.flag),
                        onTap: () {
                          print(listObservacion[indice].antena.nombre);
                          observacion = listObservacion[indice];
                          /* Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ActualizarAntena(
                                        antena: antena,
                                      )));
                                      */

                        },
                      ),
                      // ignore: deprecated_member_use
                     /* ButtonTheme.bar(
                        child: ButtonBar(
                          children: <Widget>[
                            IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                antena = listAntena[indice];
                                _delete(antena);
                              },
                            ),
                          ],
                        ),
                      ),
                      */
                    ],
                  ));
            },
          ),
        ),
      ]),
    );
  }
}