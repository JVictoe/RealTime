import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DrawerCuston extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white24
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(50),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            children: [
              Text("Contatos",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10,),
              Divider(thickness: 5, endIndent: 20, indent: 20, color: Colors.grey,),
              const SizedBox(height: 10,),
              Container(
                width: 280,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white24
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 100,
                          child: FlatButton(
                            color: Colors.lightGreenAccent,
                            textColor: Colors.black,
                            child: Text("WhatsApp"),
                            onPressed: (){
                              abrirWhatsApp();
                            },
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 100,
                          child: FlatButton(
                            color: Colors.grey[300],
                            textColor: Colors.black,
                            child: Text("E-mail"),
                            onPressed: (){
                              abrirGmail();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Text("Localização",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10,),
              Divider(thickness: 5, endIndent: 20, indent: 20, color: Colors.grey,),
              const SizedBox(height: 10,),
              Container(
                width: 280,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [
                        Colors.white,
                        Colors.white24
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Container(
                          width: 260,
                          child: FlatButton(
                            color: Colors.lightGreenAccent,
                            textColor: Colors.black,
                            child: Text("Minha localização"),
                            onPressed: (){
                              abrirGoogleMaps();
                            },
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  abrirWhatsApp() async {
    var whatsappUrl = "whatsapp://send?phone=+5516992818458&text=Olá,tudo bem ?";

    if (await canLaunch(whatsappUrl)) {
      await launch(whatsappUrl);
    } else {
      throw 'Could not launch $whatsappUrl';
    }
  }

  abrirGmail() async {
    final Uri params = Uri(
      scheme: 'mailto',
      path: 'joaojvwwe@gmail.com',
      query: 'subject=Qual o assunto ?&body=Olá, digite aqui o assunto que deseja tratar...',
    );
    String url = params.toString();
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  abrirGoogleMaps() async {
    const urlMap =
        "https://www.google.com.br/maps/@-21.0168819,-47.7487097,19z";
    if (await canLaunch(urlMap)) {
      await launch(urlMap);
    } else {
      throw 'Could not launch Maps';
    }
  }
}
