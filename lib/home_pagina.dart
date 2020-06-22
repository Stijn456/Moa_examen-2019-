import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

//Dit is de home pagina...

class home_pagina extends StatefulWidget {
  @override
  _home_paginaState createState() => _home_paginaState();
}

class _home_paginaState extends State<home_pagina> {

    //Variablen gedefineerd...
    int value = 119;
    String land = "Nederland";
    String image = "assets/images/flag (2).png";

    // Custom widget voor de zieken, genezen en doden Covid-19 gevallen...
    Widget custom_box(String tekstBox) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          height: 50.0,
          child: Material(
            color: Colors.blue[800],
            elevation: 14.0,
            borderRadius: BorderRadius.circular(24.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                //In deze container komt de vlag van het land te staan...

                Container(
                  child: ClipRRect(
                    borderRadius: new BorderRadius.circular(24.0),
                    child: Image(
                      image: AssetImage(
                          '$image'),
                    ),
                  ),
                ),
                Container(
                  child: Text(tekstBox, style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w300,
                      color: Colors.white
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }

    //API die ik gebruik voor de Covid-19 gevallen...
    Future<List> countries;

    Future<List> getCountries() async {
      // URL voor het toevoegen van de API...
      var url = 'https://api.covid19api.com/summary';
      var response = await http.get(url);

      Map<String, dynamic> map = json.decode(response.body);
      List<dynamic> data = map["Countries"];

      return(data);
    }

    @override
    void initState() {
      countries = getCountries();
      super.initState();
    }

    @override
    // Hier wordt alles ingedaan wat uiteindelijk op de frontend end komt te staan...
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.blue[900],
        appBar: AppBar(
          backgroundColor: Colors.blue[800],
          title: Text('Home', style: TextStyle(
              fontStyle: FontStyle.italic, fontWeight: FontWeight.w600
            ),
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(height: 20),

            //Deze container komt het logo te staan...
            Container(
              width: 200,
              height: 150,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage('assets/images/Corona.png'),
                ),
              ),
            ),
            SizedBox(height: 10),

            //Hier wordt het geklikte land aangegeven...
            Text('Gegevens $land', style: TextStyle(
                fontSize: 25, color: Colors.white
              ),
            ),
            SizedBox(height: 10),
            FutureBuilder<List>(
              future: countries,
              builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
                if(snapshot.hasData) {
                  print(snapshot.data);
                  return Expanded(
                    child: SizedBox(
                      height: 80,
                      child: new ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: 1,
                        itemBuilder: (BuildContext context, int index) {
                          //Hier vraag je de data van de covid-19 gevallen op...
                          //Dit gaat in een variable die ik later op het frontend vertoon...
                          var confirmed = snapshot.data[value]["TotalConfirmed"].toString();
                          var deaths = snapshot.data[value]["TotalDeaths"].toString();
                          var recovered = snapshot.data[value]["TotalRecovered"].toString();

                          // In deze Column komen al mijn DropDown Keuzes te staan...
                          return Column(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: DropdownButton<int>(
                                  // Items wordt aangeroepen om meedere landen toe te voegen...
                                  items: [
                                    //DropDownMenuItems maak je een keuze aan...
                                    DropdownMenuItem<int>(
                                      value: 1,
                                      child: Center(
                                        child: Text("Afghanistan"),
                                      ),
                                    ),
                                    DropdownMenuItem<int>(
                                      value: 78,
                                      child: Center(
                                        child: Text("Amerika"),
                                      ),
                                    ),
                                    DropdownMenuItem<int>(
                                      value: 34,
                                      child: Center(
                                        child: Text("China"),
                                      ),
                                    ),
                                    DropdownMenuItem<int>(
                                      value: 65,
                                      child: Center(
                                        child: Text("Duitsland"),
                                      ),
                                    ),
                                    DropdownMenuItem<int>(
                                      value: 119,
                                      child: Center(
                                        child: Text("Nederland"),
                                      ),
                                    ),
                                    DropdownMenuItem<int>(
                                      value: 144,
                                      child: Center(
                                        child: Text("Rusland"),
                                      ),
                                    ),
                                  ],

                                  //Switch statement voor het land.
                                  onChanged: (_value) => {
                                    setState((){
                                      value = _value;
                                      // Deze Switch gebruik ik voor het refreshen van het geselecteerde land...
                                      switch(value){
                                        case 119 : land = "Nederland";
                                        image = "assets/images/flag (2).png";
                                        break;
                                        case 78 : land = "Amerika";
                                        image = "assets/images/flag (3).png";
                                        break;
                                        case 65 : land = "Duitsland";
                                        image = "assets/images/flag (1).png";
                                        break;
                                        case 144 : land = "Rusland";
                                        image = "assets/images/flag (4).png";
                                        break;
                                        case 1 : land = "Afghanistan";
                                        image = "assets/images/flag (5).png";
                                        break;
                                        case 34 : land = "China";
                                        image = "assets/images/flag (6).png";
                                        break;

                                        default : "";
                                        break;
                                      }
                                    }),
                                  },

                                  hint: Text("Selecteer een land", style: TextStyle(
                                      fontSize: 17, fontWeight: FontWeight.w400, color: Colors.white, fontStyle: FontStyle.italic
                                    ),
                                  ),
                                ),
                              ),

                              //Hier worden de custom widget aangeroepen die een card maken, voor de covid-19 gevallen...
                              custom_box('  Aantal Doden: ${deaths}'),
                              custom_box('  Aantal Zieken: ${confirmed}'),
                              custom_box('  Aantal genezen: ${recovered}')
                            ],
                          );
                        },
                      ),
                    ),
                  );
                }
                //Return als de API niks teruggeeft...
                return Text('Failed');
              },
            ),
          ],
        ),
      );
    }
  }