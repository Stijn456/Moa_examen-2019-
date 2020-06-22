import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
import 'package:flutter/material.dart';

//Deze pagina is voor de brochure...

class brochure_pagina extends StatefulWidget {
  @override
  _brochure_paginaState createState() => _brochure_paginaState();
}

class _brochure_paginaState extends State<brochure_pagina> {


      //Deze widgets zorgen ervoor dat de url werken...
      //Hier worden twee parameters gegeven voor tekst en voor URL...
     Widget custom_brochure(String tekst, String url) {
     Future<void> _launched1;
     String _launchUrl1 = "$url";
     Future<void> _launch1(String url) async {
       if(await canLaunch(url)) {
         await launch(
           url,
           forceSafariVC: true,
           forceWebView: true,
           headers: <String, String>{'header_key': 'header_value'},
         );
       } else{
         throw 'Could not launch $url';
       }
     }
     // Returns de brochures
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '$tekst ', style: TextStyle(
                fontSize: 16, color: Colors.white, fontWeight: FontWeight.w400, fontStyle: FontStyle.italic
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Hier maak ik gebruik van een raise button voor het openen van de brochures...
            RaisedButton(
              child: Text('Krijg Brochure', style: TextStyle(
                  //Styling van de Button...
                  fontSize: 15, color: Colors.white, fontStyle: FontStyle.italic
                ),
              ),
              color: Colors.red[800],
              //URL wordt na het drukken uitgevoerd
              onPressed: () {
                  _launch1(_launchUrl1);
              },
              shape: new RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(30.0)
              ),
            ),
          ],
        ),
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Brochures', style: TextStyle(
            fontStyle: FontStyle.italic
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text('Hieronder bevinden zich meedere brochures over het handelen bij het Coronavirus.', style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.w300, color: Colors.white
              ),
            ),
            //Hier worden stuk voor stuk de Custom widget aangeroepen, met twee parameters(Voor de tekst en de URL)
            custom_brochure('Het Coronavirus is er – Wat moet ik doen?', 'https://www.rijksoverheid.nl/onderwerpen/coronavirus-covid-19/documenten/brochures/2020/04/09/het-coronavirus-is-er---wat-moet-ik-doen'),
            custom_brochure('Coronavirus en bezoek in de gehandicaptenzorg', 'https://www.rijksoverheid.nl/onderwerpen/coronavirus-covid-19/documenten/brochures/2020/04/09/brochure-coronavirus-en-bezoek-in-de-gehandicaptenzorg'),
            custom_brochure('Informatie over het Corona en verwijzing naar de zorg', 'https://www.rijksoverheid.nl/onderwerpen/coronavirus-covid-19/documenten/brochures/2020/04/30/brochure-coronavirus-eenvoudige-taal-zorg'),
            custom_brochure('Informatie over de zorg op de Intensive Care', 'https://www.rijksoverheid.nl/onderwerpen/coronavirus-covid-19/documenten/brochures/2020/04/30/brochure-informatie-over-het-corona-virus-en-de-zorg-op-de-intensive-care')
          ],
        ),
      ),
    );
  }
}
