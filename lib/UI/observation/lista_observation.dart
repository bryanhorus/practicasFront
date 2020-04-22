import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/observation_bloc.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/observation_model.dart';
import 'package:tenic_api/resource/constants.dart';

class ListaObservation extends StatefulWidget{
  
  const ListaObservation({Key key}) : super(key: key);

  @override
  ListaObservationState createState() => ListaObservationState();
  }

class ListaObservationState extends State<ListaObservation>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  ObservationBloc observationBloc;
  ApiResponse apiResponse;
  Observation observation;

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  List<Observation> listObservation = List();

    _handleSubmitted() {
    observationBloc.listarObservation().then((apiResponse) {
      setState(() {
        listObservation = apiResponse.listObservation;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    observationBloc = ObservationBloc(context);
    _handleSubmitted();
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.tittleListaObs),
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            // tamaño de la lista
            itemCount: listObservation.length,
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
                        title: Text(listObservation[indice].fecha,
                            //le damos estilo a cada texto
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                                onTap: (){ print(listObservation[indice].fecha);
                    observation = listObservation[indice];},
                      ),
                      // ignore: deprecated_member_use
                      /*ButtonTheme.bar(
                        child: ButtonBar(
                          children: <Widget>[
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              color: Colors.yellow[300],
                              child: const Text(Constants.btnModificar,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.black87)),
                              onPressed: () {
                                print(listObservation[indice].fecha);
                                observation = listObservation[indice];
                                /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            ActualizarUsuario(
                                                usuario: usuario)));*/
                              },
                            ),
                            FlatButton(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0)),
                              ),
                              color: Colors.red[300],
                              child: const Text(Constants.btnEliminar,
                                  style: TextStyle(
                                      fontSize: 15, color: Colors.white)),
                              onPressed: () {
                                print(listObservation[indice].fecha);
                                observation = listObservation[indice];
                                //_delete(usuario);
                              },
                            ),
                          ],
                        ),
                      ),*/
                    ],
                  ));
            },
          ),
        ),
      ]),
    );
  }
}