//packeges...
import 'package:flutter/material.dart';
import 'package:moa_examenn/brochure_pagina.dart';
import 'package:moa_examenn/informatie_pagina.dart';
import 'home_pagina.dart';

//Functie voor het runnen van de app...
void main(){
  runApp(myApp());
}

//Stateless widget...
class myApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: mijnBottomNavigatie(),
    );
  }
}

class mijnBottomNavigatie extends StatefulWidget {
  @override
  _mijnBottomNavigatieState createState() => _mijnBottomNavigatieState();
}

class _mijnBottomNavigatieState extends State<mijnBottomNavigatie>
{
  //Index navigatie wordt hier gedefinieerd...
  int _currentIndex = 0;
  //Mijn dart pagina's in navigatie gezet...
  final List<Widget> _children =
  [
    //Deze pagina's zijn mijn navigatie...
    home_pagina(),
    brochure_pagina(),
    informatie_pagina(),
  ];

  //Wanneer je op een navigatie element klikt, wordt deze functie getriggered
  void onTappedBar(int index){
    setState(() {
      //Update de index naar de geklikte navigatie...
      _currentIndex = index;
    });
  }

  //Deze custom widget wordt gebruikt voor de Rivm regels...
  Widget custom_rivmRegels(String tekst, String url){
    return Row(
      children: <Widget>[
        Container(
          width: 60,
          height: 36,
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: AssetImage('$url'),
            ),
          ),
        ),
        Text('$tekst', style: TextStyle(
            color: Colors.white, fontSize: 18, fontWeight: FontWeight.w300, fontStyle: FontStyle.italic
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {

    //Wanneer orientation niet in potrait modus is, gaat de app in landscape modus...
    if(MediaQuery.of(context).orientation != Orientation.portrait){
      return Scaffold(
        backgroundColor: Colors.blue[800],
        appBar: AppBar(
          title: Text('Rivm Richtlijnen', style: TextStyle(
            color: Colors.white, fontStyle: FontStyle.italic
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.blue[900],
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //Hier roep ik Custom widgets op, met een parameter die naar de text vraagt...
            children: <Widget>[
              custom_rivmRegels('• Heb je klachten blijf dan thuis', 'assets/images/ziek1.png'),
              SizedBox(height: 20),
              custom_rivmRegels('• Ben je ook benauwd en/of heb je koorts? Dan moeten alle huisgenoten \n  thuis blijven', 'assets/images/ziek2.png'),
              SizedBox(height: 20),
              custom_rivmRegels('• Houd 1,5 meter afstand', 'assets/images/Covid.png'),
              SizedBox(height: 20),
              custom_rivmRegels('• Werk zoveel mogelijk vanuit huis', 'assets/images/Thuis.png'),
              SizedBox(height: 20),
              custom_rivmRegels('• Vermijd drukte', 'assets/images/drukte.png'),
              SizedBox(height: 20),
              custom_rivmRegels('• Was regelmatig je handen', 'assets/images/handen.png')
            ],
          ),
        ),
      );
    }

    //Hier wordt de navigatie gemaakt...
    return new Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        selectedItemColor: Colors.white70,
        unselectedFontSize: 13,
        selectedFontSize: 15,
        iconSize: 30,
        backgroundColor: Colors.blue[800],
        //Alle item navigatie wordt hier aangemaakt...
        items: [
          //Hier maak je een navigatie aan...
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.group),
            title: Text('Brochure'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            title: Text('Informatie'),
          ),
        ],
      ),
    );
  }
}

