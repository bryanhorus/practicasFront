import 'package:flutter/material.dart';
import 'package:tenic_api/UI/observation/observation_detail.dart';
import 'package:tenic_api/bloc/observation_bloc.dart';
import 'package:tenic_api/modelo/api_response_model.dart';
import 'package:tenic_api/modelo/observacion_model.dart';
import 'package:tenic_api/navigator.dart';
import 'package:tenic_api/resource/constants.dart';

class ListaObservation extends StatefulWidget{
  
  const ListaObservation({Key key}) : super(key: key);

  @override
  ListaObservationState createState() => ListaObservationState();
  }

class ListaObservationState extends State<ListaObservation>
    with SingleTickerProviderStateMixin {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<Observacion> listObservation = List();
  ObservationBloc observationBloc;
  ApiResponse apiResponse;
  Observacion observation;



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
    observationBloc = ObservationBloc();
    _handleSubmitted();
  }

    @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: const Text(Constants.tittleListaObs),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              TecniNavigator.goToBuscarObservacion(context);
            },
          ),
        ],),
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Container(
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(20.0),
            itemCount: listObservation.length,
            itemBuilder: (BuildContext context, int indice) {
              return Card(
                  color: Colors.blueAccent[indice],
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      ListTile(
                        title: Text(
                          listObservation[indice].antena.nombre,
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)
                                ),
                                subtitle: Text(listObservation[indice].fecha),
                      leading: Icon(Icons.featured_play_list),
                                onTap: (){Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      ObservationDetail(
                                        observation: observation,
                                      ))); print(listObservation[indice].idObservacion);
                    observation = listObservation[indice];},
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