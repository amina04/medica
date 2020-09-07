import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:medica/constantes.dart';
import 'package:medica/model/database.dart';
import 'package:medica/model/model_tableaux/join_med_calc.dart';

import '../main.dart';

class Fin_journee extends StatefulWidget {
  static String id = 'fin_journee_screen';
  @override
  _Fin_journeeState createState() => _Fin_journeeState();
}

class _Fin_journeeState extends State<Fin_journee> {
  var dbmanager = new Dbmedica();
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
      body: FutureBuilder(
        future: dbmanager.getAllJoinMedCalc(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            fin_journee = snapshot.data;
            return _buildlistview();
          }
          return new CircularProgressIndicator();
        },
      ),
    );
  }
}
ListView _buildlistview() {
  return ListView.builder(
      itemCount: fin_journee == null ? 0 : fin_journee.length,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          child: ListTile(
            title: Text(
              'médicament ${Join_Med_Calc.fromMap(fin_journee[position]).nom}',
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
                      'reliquats ',
                      style: klabelTextStyle,
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      '${Join_Med_Calc.fromMap(fin_journee[position]).reliquat}',
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
                      '${Join_Med_Calc.fromMap(fin_journee[position]).stabilite}',
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
        );
      });
}
