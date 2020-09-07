import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:medica/constantes.dart';
import 'package:medica/controller/fonctions_calculs.dart';
import 'package:medica/model/database.dart';
import 'package:medica/model/model_tableaux/join_med_calc_sol.dart';

import '../main.dart';

class Debut_journee extends StatefulWidget {
  static String id = 'Debut_journee';
  @override
  _Debut_journeeState createState() => _Debut_journeeState();
}

class _Debut_journeeState extends State<Debut_journee> {
  var dbmanager = new Dbmedica();
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
      body:  FutureBuilder(
        future: dbmanager.getAllJoinMedSolCalc(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            debut_journee = snapshot.data;
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
      itemCount: debut_journee == null ? 0 : debut_journee.length,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          child: ListTile(
            title: Text(
              'médicament ${Join_med_calc_sol.fromMap(debut_journee[position]).nom}',
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
                      etat_reliquat(Join_med_calc_sol.fromMap(debut_journee[position]).stabilite,Join_med_calc_sol.fromMap(debut_journee[position]).date_preparation),
                      style: klabelTextStyle,
                    ),
                  ],
                ),

                    Text(
                      'date : ${Join_med_calc_sol.fromMap(debut_journee[position]).date_preparation}',
                      style: klabelTextStyle,
                    ),


                    Text(
                      'Quantité : ${Join_med_calc_sol.fromMap(debut_journee[position]).reliquat} ml',
                      style: klabelTextStyle,
                    ),


              ],
            ),
          ),
        );
      });
}
