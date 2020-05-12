import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_marker_cluster/flutter_map_marker_cluster.dart';
import 'package:latlong/latlong.dart';

class MapPage extends StatefulWidget {
  MapPage({
    Key key,
    @required this.lat,
    @required this.lng,
    @required this.mapController,
    @required this.markers,
    this.isNominatim = true,
    this.apiKey,
    this.customMapLayer,
  }) : super(key: key);
  final List<Marker> markers;
  final double lat;
  final double lng;
  final MapController mapController;
  final bool isNominatim;
  final String apiKey;
  final TileLayerOptions customMapLayer;

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  List<LatLng> tappedPoints = [];

// funcao que atualiza o estado do mapa e salva a coordenada na lista tappedPoints.
  void _handleTap(LatLng latlng) {
    setState(() {
      print(latlng);
      tappedPoints.add(latlng);
    });
  }

  Widget body(BuildContext context) {
    var markers = tappedPoints.map((latlng) {
      return Marker(
        // dimensao dos marcadores
        width: 80.0,
        height: 80.0,
        // coordenadas do marcadores.
        point: latlng,
        builder: (ctx) => GestureDetector(
          onTap: () {
            // Mostrar uma SnackBar quando clicar em um marcador
            Scaffold.of(ctx).showSnackBar(SnackBar(
                content: Text("Latitude =" +
                    latlng.latitude.toString() +
                    " :: Longitude = " +
                    latlng.longitude.toString())));
          },
          child: Container(
            child: Icon(
              // Icone do marcador
              Icons.pin_drop,
              color: Colors.red,
            ),
          ),
        ),
      );
    }).toList();

    return FlutterMap(
      mapController: widget.mapController,
      options: MapOptions(
          plugins: [
            MarkerClusterPlugin(),
          ],
          onTap: _handleTap,
          center: LatLng(widget.lat, widget.lng),
          zoom: 17,
          maxZoom: 18),
      layers: [
        widget.isNominatim
            ? widget.customMapLayer == null
                ? TileLayerOptions(
                    urlTemplate:
                        'https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png',
                    subdomains: ['a', 'b', 'c'],
                    tileProvider: CachedNetworkTileProvider())
                : widget.customMapLayer
            : widget.customMapLayer == null
                ? TileLayerOptions(
                    urlTemplate: "https://api.tiles.mapbox.com/v4/"
                        "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                    additionalOptions: {
                      'accessToken': widget.apiKey,
                      'id': 'mapbox.streets',
                    },
                  )
                : widget.customMapLayer,
        MarkerLayerOptions(
          markers: markers,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: body(context),
    );
  }
}
