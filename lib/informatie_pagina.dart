import 'package:flutter/material.dart';

//Deze pagina is voor informatie...

class informatie_pagina extends StatefulWidget {
  @override
  _informatie_paginaState createState() => _informatie_paginaState();
}

class _informatie_paginaState extends State<informatie_pagina> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        title: Text('Informatie', style: TextStyle(
            fontWeight: FontWeight.w600, fontStyle: FontStyle.italic
        ),
      ),
      centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[

            //In deze container komt de Roc Van Twente foto...
            Container(
              width: 200,
              height: 125,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: DecorationImage(
                  image: AssetImage('assets/images/RocvanTwente.png'),
                ),
              ),
            ),

            //Tekst student...
            Text('Student Informatie:', style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 20),

            //Tekst informatie...
            Text('Ik ben Stijn Lassche, student van Roc van Twente en zit op de opleiding Applicatie-Ontwikkelaar. Deze Covid-19 App is gemaakt voor een examen onderdeel.', style: TextStyle(
                fontSize: 18, color: Colors.white, fontWeight: FontWeight.w300
              ),
            ),
            SizedBox(height: 20),

            //Contact informatie...
            Text('Contact Informatie:', style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.email,
                  color: Colors.white,
                  size: 25,
                ),
                Text(' Stijnlassche@hotmail.com', style: TextStyle(
                  color: Colors.white, fontSize: 18, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.phone,
                  color: Colors.white,
                  size: 25,
                ),
                Text(' 053-8513025', style: TextStyle(
                    color: Colors.white, fontSize: 18, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300
                ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(
                  Icons.home,
                  color: Colors.white,
                  size: 25,
                ),
                Text(' Gieterij 200 7553 VZ Hengelo', style: TextStyle(
                    color: Colors.white, fontSize: 18, fontStyle: FontStyle.italic, fontWeight: FontWeight.w300
                ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
