import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/UI/municipio/actualizar_municipio.dart';
import 'package:tenic_api/bloc/municipio_bloc.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/municipio_model.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';
import 'actualizar_municipio.dart';

class ListaMunicipio extends StatefulWidget {
  const ListaMunicipio({Key key}) : super(key: key);

  @override
  ListaMunicipioState createState() => ListaMunicipioState();
}

class ListaMunicipioState extends State<ListaMunicipio>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final MunicipioBloc municipioBloc = MunicipioBloc();
  ApiResponse apiResponse;
  Municipio municipio;
  List<Municipio> listMunicipio = List();

  _handleSubmitted() {
    municipioBloc.listarMunicipio().then((apiResponse) {
      setState(() {
        listMunicipio = apiResponse.listMunicipio;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    MunicipioBloc();
    _handleSubmitted();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.tittleListaMunicipio),
        actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {TecniNavigator.goToRegistrarMunicipio(context);},
            ),
          ],
      ),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            itemCount: listMunicipio.length,
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                color: Colors.blue[indice],
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  title: Text(
                    listMunicipio[indice].nombre,
                    style: TextStyle(fontSize: 20, color: Colors.black87,fontWeight: FontWeight.bold)),
                    leading: Icon(Icons.map),
                  onTap: (){
                    print(listMunicipio[indice].nombre);
                    municipio = listMunicipio[indice];

                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ActualizarMunicipio( municipio:municipio)));
                                },
                )
                  ]
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

