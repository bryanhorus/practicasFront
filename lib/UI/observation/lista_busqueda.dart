
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tenic_api/bloc/observation_bloc.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/observacion_model.dart';

class ListaBusquedaPage extends StatefulWidget{
  
  const ListaBusquedaPage({Key key}) : super(key: key);

  @override
  ListaBusquedaPageState createState() => ListaBusquedaPageState();
  }

class ListaBusquedaPageState extends State<ListaBusquedaPage>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Observacion> listBusqueda = List();
  ObservationBloc observationBloc;
  ApiResponse apiResponse;
  Observacion observation;



    _handleSubmitted() {
    observationBloc.listarObservation().then((apiResponse) {
      setState(() {
        listBusqueda = apiResponse.listbusqueda;
      });
    });
  }

  @override
  void initState() {
    super.initState();
    observationBloc = ObservationBloc();
    _handleSubmitted();
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text("Observaciones por Municipio")),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            itemCount: listBusqueda.length,
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                  color: Colors.blueAccent[indice],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          listBusqueda[indice].antena.nombre,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)
                                ),
                                subtitle: Text(listBusqueda[indice].fecha),
                      leading: Icon(Icons.featured_play_list),
                                onTap: (){ print(listBusqueda[indice].idObservacion);
                    observation = listBusqueda[indice];},
                      )
                    ],
                  ));
            },
          ),
        ),
      ]),
    );
  }
}