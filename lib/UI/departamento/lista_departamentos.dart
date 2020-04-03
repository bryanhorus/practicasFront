import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/departamento_bloc.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/departamento_model.dart';
import 'package:tenic_api/resource/constants.dart';

class ListaDpto extends StatefulWidget {
  @override
  ListaDptosState createState() => ListaDptosState();
}

class ListaDptosState extends State<ListaDpto>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DptoBloc dptoBloc;
  ApiResponse apiResponse;

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  final List<String> nombres = [];
  final List<String> ciudad = [];
  List<Departamento> listDepartamento = List();

  _handleSubmitted() {
    dptoBloc.listarDepartamento().then((apiResponse) {
      setState(() {
        listDepartamento = apiResponse.listDepartamento;
      });
    });
  }

  @override
  void initState() {
    dptoBloc = DptoBloc(context);
    _handleSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(title: const Text(Constants.tittleListaDepartamentos)),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            // tamaño de la lista
            itemCount: listDepartamento.length,
            // Constructor de widget para cada elemento de la lista
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                //le damos un color de la lista de primarios
                color: Colors.primaries[indice],
                //agregamos un contenedor de 100 de alto
                child: Container(
                  height: 50,
                  child: Center(
                    child: Text(
                      listDepartamento[indice].nombre,
                      //le damos estilo a cada texto
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ]),
    );
  }
}
