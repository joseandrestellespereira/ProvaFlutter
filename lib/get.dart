import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

class Get extends StatefulWidget {

  @override
  _GetState createState() => new _GetState();
}

class _GetState extends State<Get> {
  String url = 'https://olinda.bcb.gov.br/olinda/servico/Informes_Ouvidorias/versao/v1/odata/Ouvidorias?%24format=json&%24top=15';
  List data;

  @override
  void initState() {  
    super.initState();
    callContacts();
  }

  Future<String> callContacts() async {
    var response = await http.get(Uri.encodeFull(url), 
            headers: {"Accept": "application/json"});
    setState(() {
      var dados = json.decode(response.body);
      data = dados["value"];
      print(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Ouvidorias'),
        ),
        body: new ListView.builder(
            itemCount: data == null ? 0 : data.length,
            itemBuilder: (BuildContext context, i) {
              return new ListTile(
                title: new Text(data[i]["Nome"]),
                subtitle: new Text(data[i]["WebSite"]),
              );
            }, 
          ),
        );
  }

}