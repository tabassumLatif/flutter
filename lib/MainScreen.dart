import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final String url =
      "https://fam-erp.com/property/myproperties/getMyProperties";
  List data;

  @override
  void initState() {
    super.initState();
    this.getJsonData();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // ignore: argument_type_not_assignable
      title: "Test",
      home: new Container(
        child: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, int index) {
              return new Container(
                child: new Center(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      new Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Container(
                              child:
                                  new Text("Unit: " + data[index]['unit_type']),
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 10.0, 10.0, 0.0),
                            ),
                            new Container(
                              child: new Text(data[index]['city'] +
                                  ", " +
                                  data[index]['country']),
                              padding: const EdgeInsets.fromLTRB(
                                  10.0, 10.0, 10.0, 0.0),
                            ),
                            new Container(
                              child: new Text("Net Price: " +
                                  data[index]['net_purchase_price'].toString()),
                              padding: const EdgeInsets.all(10.0),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }

  Future<String> getJsonData() async {
    var response =
        await get(Uri.encodeFull(url), headers: {"Accept": "application/json"});

    print(response.body);
    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['items'];
    });
    return "Success";
  }
}
