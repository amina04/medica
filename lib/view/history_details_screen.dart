import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medica/constantes.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:medica/model/database.dart';

import '../main.dart';

class Detail_patient extends StatefulWidget {
  static String id = 'Detail_patient';


  @override
  _Detail_patient createState() => _Detail_patient();
}

class _Detail_patient extends State<Detail_patient> {
  var dbmanager = new Dbmedica();
//remplir les variable apartir de variable meds qui est de type medicament qui est initialiser dans list med screen

  String Nom_patient = patient_det.Nom_patient;
  String Prenom_patient = patient_det.Prenom_patient;
  double surface_coporelle = patient_det.surface_coporelle;
  String date =solution_selectione.date_preparation;
  double dose =solution_selectione.dose_administrer;
String reliquat =calcul_selectionne.reliquat;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text('Détails de Patient ', style: kappBarTextStyle),
        gradient:
            LinearGradient(colors: [Colors.lightBlueAccent, Colors.tealAccent]),
      ),
      body: Container(
        color: Colors.white,
        margin: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Nom et prénom :',
                    style: ktitleliststyle,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '$Nom_patient ',
                    style: kresultliststyle,
                  ),
                  Text(
                    '$Prenom_patient ',
                    style: kresultliststyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'La surface coporelle :',
                    style: ktitleliststyle,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '$surface_coporelle',
                    style: kresultliststyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'La date :',
                    style: ktitleliststyle,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '$date',
                    style: kresultliststyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Text(
                    ' La dose :',
                    style: ksubtitleliststyle,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '$dose mg/ml',
                    style: kresultliststyle,
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(15.0),
              child: Row(
                children: <Widget>[
                  Text(
                    'Reliquats:',
                    style: ksubtitleliststyle,
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    '$reliquat mg/ml',
                    style: kresultliststyle,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
