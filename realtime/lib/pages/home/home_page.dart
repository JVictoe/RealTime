import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:realtime/pages/drawercuston/drawer_custon.dart';
import 'package:realtime/pages/infocidade/info_cidades.dart';
import 'package:responsive_framework/responsive_framework.dart';
const API_KEY = "31997bc5";

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final nameHolder = TextEditingController();

  limparCampo(){
    nameHolder.clear();
  }

  String search;

  Future<Map> searchP() async {
    http.Response response;

    if(search == null || search.isEmpty){
      response = await http.get(
           "https://api.hgbrasil.com/weather?key=$API_KEY&city_name=Sao Paulo"
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

    DateTime currently = DateTime.now();
    final tablet = ResponsiveWrapper.of(context).isTablet;

    return Stack(
      children: [
        Scaffold(
          extendBodyBehindAppBar: true,
          backgroundColor: Theme.of(context).primaryColor,
          appBar: PreferredSize(
            preferredSize: Size(double.infinity, 80),
            child: AppBar(
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: nameHolder,
                  autofocus: true,
                  autocorrect: true,
                  textAlign: TextAlign.start,
                  enableSuggestions: true,
                  decoration: InputDecoration(
                    hintText: "Pesquise uma cidade",
                    hintStyle: TextStyle(
                        color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,
                    ),
                  ),
                  style: TextStyle(
                    color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,
                    fontSize: 18,
                  ),
                  onSubmitted: (text) {
                    setState(() {
                      search = text;
                      limparCampo();
                    });
                  },
                ),
              ),
              centerTitle: true,
              iconTheme: IconThemeData(color: currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,),
            ),
          ),
          drawer: Padding(
            padding: EdgeInsets.only(left: 10, top: 100, bottom: 20),
            child: Theme(
                data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
                child: DrawerCuston()),
          ),
          body: Padding(
            padding: EdgeInsets.only(top: tablet ? 60 : 50),
            child: FutureBuilder<Map>(
              future: searchP(),
              builder: (context, snapshot) {
                if(snapshot.hasData){
                  return exibeInfoCidade(context, snapshot);
                } else {
                  return Center(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(currently.hour >= 06 && currently.hour <= 17 ? Colors.black : Colors.white,),
                    ),
                  );
                }
              },
            ),
          )
        ),
      ],
    );
  }

  Widget exibeInfoCidade(BuildContext context, AsyncSnapshot snapshot) {

    return Column(
        children: [
          InfoCidade(context, snapshot)
        ],
    );
  }

}