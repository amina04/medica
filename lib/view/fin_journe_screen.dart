import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:medica/constantes.dart';

class Fin_journee extends StatefulWidget {
  static String id = 'fin_journee_screen';
  @override
  _Fin_journeeState createState() => _Fin_journeeState();
}

class _Fin_journeeState extends State<Fin_journee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text('Fin de journée', style: kappBarTextStyle),
        gradient:
            LinearGradient(colors: [Colors.lightBlueAccent, Colors.tealAccent]),
      ),
      //Navigateur Bar
      body: ListView.builder(
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
                          'La quantité consommée : ',
                          style: klabelTextStyle,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '20 ',
                          style: klabelTextStyle,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          ' flacons',
                          style: klabelTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'reliquats',
                          style: klabelTextStyle,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '5',
                          style: klabelTextStyle,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'flacons ',
                          style: klabelTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Stabilités',
                          style: klabelTextStyle,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '48',
                          style: klabelTextStyle,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'heures',
                          style: klabelTextStyle,
                        ),
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          'Prix des reliquats jetées',
                          style: klabelTextStyle,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          '48',
                          style: klabelTextStyle,
                        ),
                        SizedBox(
                          width: 10.0,
                        ),
                        Text(
                          'DA',
                          style: klabelTextStyle,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
