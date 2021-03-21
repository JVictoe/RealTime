import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:realtime/pages/infocidade/info_cidades.dart';
const API_KEY = "1af303d7";

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String search;

  Future<Map> searchP() async {
    http.Response response;

    if(search == null){
      response = await http.get(
          "https://api.hgbrasil.com/weather?key=$API_KEY&city_name=Pontal"
      );
    } else if(search != null){
      response = await http.get(
          "https://api.hgbrasil.com/weather?key=$API_KEY&city_name=$search"
      );
    }

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Colors.white,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            title: Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Pesquise uma cidade",
                  labelStyle: TextStyle(
                      color: Colors.black
                  ),
                ),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
                onSubmitted: (text) {
                  setState(() {
                    search = text;
                  });
                },
              ),
            ),
            centerTitle: true,
            iconTheme: IconThemeData(color: Colors.black),
          ),
          drawer: Padding(
            padding: EdgeInsets.only(left: 10, top: 100, bottom: 20),
            child: Drawer(),
          ),
          body: FutureBuilder<Map>(
            future: searchP(),
            builder: (context, snapshot) {
              if(snapshot.hasData){
                return exibeInfoCidade(context, snapshot);
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
                  ),
                );
              }
            },
          ),
        ),
      ],
    );
  }

  Widget exibeInfoCidade(BuildContext context, AsyncSnapshot snapshot) {

    return ListView(
      children: [
        InfoCidade(context, snapshot)
      ],
    );
  }

}