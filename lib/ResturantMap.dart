import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:http/http.dart';
import 'package:latlong/latlong.dart';

class RestaurantsMap extends StatefulWidget {
  @override
  _RestaurantsMapState createState() => _RestaurantsMapState();
}

class _RestaurantsMapState extends State<RestaurantsMap> {
  final String url =
      "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=-33.8670522,151.1957362&radius=1500&type=restaurant&keyword=cruise&key=AIzaSyAQpzhCwnbT-BcZZLwx22bmEQoNCrUXSZs";
  List data;
  List<Marker> markers = new List(0);

  @override
  void initState() {
    super.initState();

    this.getJsonData(super.context);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new FlutterMap(
        options: new MapOptions(
            minZoom: 13.0, center: new LatLng(24.8442144, 55.0388426)),
        layers: [
          new TileLayerOptions(
              urlTemplate: "http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
              subdomains: ['a', 'b', 'c']),
          new MarkerLayerOptions(
            markers: markers,
          )
        ],
      ),
    );
  }

  Future<String> getJsonData(BuildContext context) async {
    var response =
        await get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    print("test");
    print(response.body);

    setState(() {
//      var convertDataToJson = json.decode(response.body);
//      data = convertDataToJson['results'];
      markers = new List(100);
      var lat = 24.8442144;
      var lng = 55.0388426;
      for (var i = 0; i < 100; i++) {
        lat += .00300;
        lng += .00100;
        print(lat);
        print(lng);
        markers[i] = new Marker(
            width: 45.5,
            height: 45.0,
            point: new LatLng(lat, lng),
            builder: (context) => new Container(
                  child: IconButton(
                    icon: new Icon(Icons.location_on, color: Colors.red,),
                  ),
                ));
      }
    });
    return "Success";
  }
}
