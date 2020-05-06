import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/UI/antena/actualizar_asignar.dart';
import 'package:tenic_api/bloc/asignar_antena.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/asignar_antena.dart';
import 'package:tenic_api/resource/constants.dart';

class ListaAntenasAsignadas extends StatefulWidget {
  final AsignarAntena asignarantena;
  const ListaAntenasAsignadas({Key key, this.asignarantena}) : super(key: key);

  @override
  ListaAntenasAsignadasState createState() => ListaAntenasAsignadasState();
}

class ListaAntenasAsignadasState extends State<ListaAntenasAsignadas>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AsignarAntenaBloc  asignarAntenaBloc = AsignarAntenaBloc();
  List<AsignarAntena> listAsignarAntena = List();
  ApiResponse apiResponse;
  AsignarAntena asignarAntena;

  _handleSubmitted() {
    asignarAntenaBloc.listarAsignarAntena().then((apiResponse) {
      setState(() {
        listAsignarAntena = apiResponse.listAsignarAntena;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    AsignarAntenaBloc();
    _handleSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.tittleListaAntenasAsignadas)
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            itemCount: listAsignarAntena.length,
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                  color: Colors.blueAccent[indice],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(listAsignarAntena[indice].antena.nombre,
                            style:
                                TextStyle(fontSize: 20, color: Colors.black87,fontWeight: FontWeight.bold)),
                        subtitle: Text(listAsignarAntena[indice].usuario.nombre),
                        leading: Icon(Icons.flag),
                        onTap: () {
                          print(listAsignarAntena[indice].antena.nombre);
                          asignarAntena = listAsignarAntena[indice];
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ActualizarAsignarAntena(
                                        asignarAntena: asignarAntena,
                                      )));
                        },
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