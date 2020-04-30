import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/UI/antena/actualizar_antena.dart';
import 'package:tenic_api/bloc/antena_bloc.dart';
import 'package:tenic_api/modelo/antena_model.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';

class ListaAntenas extends StatefulWidget {
  final Antena antena;
  const ListaAntenas({Key key, this.antena}) : super(key: key);

  @override
  ListaAntenasState createState() => ListaAntenasState();
}

class ListaAntenasState extends State<ListaAntenas>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AntenaBloc  antenaBloc = AntenaBloc();
  List<Antena> listAntena = List();
  ApiResponse apiResponse;
  Antena antena;

  showDeleteDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (buildcontext) {
          return AlertDialog(
            title:
                Row(children: [Icon(Icons.info), Text(Constants.tittleDialog)]),
            content: Text(Constants.eliminado),
            actions: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                ),
                child: Text(
                  Constants.btnCerrar,
                  style: TextStyle(color: Colors.black),
                ),
                color: Color(0xFF42a5f5),
                padding: EdgeInsets.fromLTRB(12, 12, 12, 12),
                onPressed: () {
                  TecniNavigator.goToListaAntena(context);
                },
              )
            ],
          );
        });
  }

  _handleSubmitted() {
    antenaBloc.listarAntena().then((apiResponse) {
      setState(() {
        listAntena = apiResponse.listAntena;
      });
    });
  }

  void _delete(Antena antena) {
    antenaBloc.deleteAntena(antena);
    showDeleteDialog(context);
  }

  @override
  void initState() {
    super.initState();
    AntenaBloc();
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
              TecniNavigator.goToRegistrarAntenaUi(context);
            },
          ),
        ],
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            itemCount: listAntena.length,
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                  color: Colors.blueAccent[indice],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(listAntena[indice].nombre,
                            style:
                                TextStyle(fontSize: 20, color: Colors.black87,fontWeight: FontWeight.bold)),
                        subtitle: Text(listAntena[indice].referencia),
                        leading: Icon(Icons.flag),
                        onTap: () {
                          print(listAntena[indice].nombre);
                          antena = listAntena[indice];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ActualizarAntena(
                                        antena: antena,
                                      )));
                        },
                      ),
                      // ignore: deprecated_member_use
                      ButtonTheme.bar(
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
                    ],
                  ));
            },
          ),
        ),
      ]),
    );
  }
}