import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/asignar_antena.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/asignar_antena.dart';
import 'package:tenic_api/repository/repository.dart';
import 'package:tenic_api/resource/constants.dart';

class Asignadastecnico extends StatefulWidget {
  final AsignarAntena asignarantena;
  const Asignadastecnico({Key key, this.asignarantena}) : super(key: key);

  @override
  AsignadastecnicoState createState() => AsignadastecnicoState();
}

class AsignadastecnicoState extends State<Asignadastecnico>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final AsignarAntenaBloc asignarAntenaBloc = AsignarAntenaBloc();
  List<AsignarAntena> listAsignarAntena12 = List();
  ApiResponse apiResponse;
  Repository repository = Repository();
  AsignarAntena asignarAntena;

  _handleSubmitted() {
    asignarAntenaBloc
        .listarAsignarAntenatecnico()
        .then((apiResponse) {
      setState(() {
        listAsignarAntena12 = apiResponse.listAsignarAntena1;
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
      appBar: AppBar(title: const Text(Constants.tittleListaAntenasAsignadas)),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            itemCount: listAsignarAntena12.length,
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                  color: Colors.blueAccent[indice],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                            listAsignarAntena12[indice].antena.nombre,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black87,
                                fontWeight: FontWeight.bold)),
                        subtitle: Text(listAsignarAntena12[indice].antena.torre.direccion),
                        leading: Icon(Icons.directions),
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
