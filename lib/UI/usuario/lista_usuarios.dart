import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/usuario_bloc.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/usuario_model.dart';
import 'package:tenic_api/resource/constants.dart';

import 'actualizar_usuario.dart';

class ListaUsuarios extends StatefulWidget {
  const ListaUsuarios({Key key}) : super(key: key);

  @override
  ListaUsuariosState createState() => ListaUsuariosState();
}

class ListaUsuariosState extends State<ListaUsuarios>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  UsuarioBloc userBloc;
  ApiResponse apiResponse;
  Usuario usuario;

  void showInSnackBar(String value) {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  final List<String> nombres = [];
  final List<String> ciudad = [];
  List<Usuario> listUsuario = List();

  _handleSubmitted() {
    userBloc.listarUsuario().then((apiResponse) {
      setState(() {
        listUsuario = apiResponse.listUsuario;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    userBloc = UsuarioBloc(context);

    _handleSubmitted();
  }

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
        itemCount: listUsuario.length,
        // Constructor de widget para cada elemento de la lista
        itemBuilder: (BuildContext context, int indice) {
          return Card(
            //le damos un color de la lista de primarios
            color: Colors.primaries[indice],
            //agregamos un contenedor de 100 de alto
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(
                    listUsuario[indice].nombre,
                    //le damos estilo a cada texto
                    style: TextStyle(fontSize: 20, color: Colors.white)),
                  onTap: (){
                    print(listUsuario[indice].nombre);
                    usuario = listUsuario[indice];

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ActualizarUsuario( usuario:usuario)));
                  },
                )
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

class EditScreen extends StatefulWidget{

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen>{
  TextEditingController _controller;

  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('editar'),
      ),
      body: Center(child: Column(children: <Widget>[
        TextField(controller: _controller),
          RaisedButton(
            child: Text('guardar'),
            onPressed: () {},
          )
      ],
      ),
      ),
    );
  }
}