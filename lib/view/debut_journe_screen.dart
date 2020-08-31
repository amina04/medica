import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:medica/constantes.dart';

class Debut_journee extends StatefulWidget {
  static String id = 'Debut_journee';
  @override
  _Debut_journeeState createState() => _Debut_journeeState();
}

class _Debut_journeeState extends State<Debut_journee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text('Début de journée', style: kappBarTextStyle),
        gradient:
            LinearGradient(colors: [Colors.lightBlueAccent, Colors.tealAccent]),
      ),
      //Navigateur Bar
      body: Center(
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (_, index) {
              return Card(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: ListTile(
                    title: Text(
                      'médicament $index',
                      style: kresultliststyle,
                    ),
                    //un sous titre
                    subtitle: Column(
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Text(
                              'Etat :',
                              style: klabelTextStyle,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'périmée',
                              style: klabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'date :',
                              style: klabelTextStyle,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '19/10/2019',
                              style: klabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Fellahi',
                              style: klabelTextStyle,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'Mouna',
                              style: klabelTextStyle,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'Quantité :',
                              style: klabelTextStyle,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              '20',
                              style: klabelTextStyle,
                            ),
                            SizedBox(
                              width: 10.0,
                            ),
                            Text(
                              'ml',
                              style: klabelTextStyle,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
}
