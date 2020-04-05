import 'package:flutter/material.dart';
import 'package:tenic_api/UI/departamento/actualizar_departamento.dart';
import 'package:tenic_api/bloc/departamento_bloc.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';

class ListaDpto extends StatefulWidget {
  final Departamento departamento;
  const ListaDpto({Key key, this.departamento}) : super(key: key);

  @override
  _ListaDptoState createState() => _ListaDptoState();
}

class _ListaDptoState extends State<ListaDpto>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Departamento departamento;
  DptoBloc dptoBloc;
  ApiResponse apiResponse;

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  final List<String> ciudad = [];
  List<Departamento> listDepartamento = List();

  _handleSubmitted() {
    dptoBloc.listarDepartamento().then((apiResponse) {
      setState(() {
        listDepartamento = apiResponse.listDepartamento;
      });
    });
  }

  void _delete(Departamento departamento) {
    dptoBloc.deleteDepartamento(departamento);
    TecniNavigator.goToListaDepartamento(context);
  }

  @override
  void initState() {
    super.initState();
    dptoBloc = DptoBloc(context);
    _handleSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.tittleListaDepartamentos),
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(15.0),
            itemCount: listDepartamento.length,
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                color: Colors.accents[indice],
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    ListTile(
                      title: Text(listDepartamento[indice].nombre,
                          style: TextStyle(fontSize: 22, color: Colors.white)),
                      onTap: () {
                        print(listDepartamento[indice].nombre);
                        departamento = listDepartamento[indice];
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) =>
                                    ActualizarDepartamento(
                                      departamento: departamento,
                                    )));
                      },
                    ),
                    ButtonTheme.bar(
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text(Constants.btnModificar),
                            onPressed: () {
                              departamento = listDepartamento[indice];
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          ActualizarDepartamento(
                                            departamento: departamento,
                                          )));
                            },
                          ),
                          FlatButton(
                            child: const Text(Constants.btnEliminar),
                            onPressed: () {
                              departamento = listDepartamento[indice];
                              _delete(departamento);
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
