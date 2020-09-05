import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medica/controller/calcul_step2_controller.dart';
import 'package:medica/controller/fonctions_calculs.dart';
import 'package:medica/model/model_tableaux/patient.dart';
import 'package:medica/model/model_tableaux/solution.dart';
import '../constantes.dart';
import 'package:medica/controller/calcul_step1_controller.dart';
import 'package:medica/model/database.dart';
import 'package:medica/main.dart';

class Step3 extends StatefulWidget {
  @override
  _Step3State createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  var dbmanager = new Dbmedica();
  double dose = Dose_a_administrer();
  double volume = Volume_finale();
  int nbr_flacon = Nbr_flacon();
  double reliquat = Reliquat();
  int poche = ChoisirPoche();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Text('La dose adminitré :', style: klabelTextStyle),
            SizedBox(
              width: 20.0,
            ),
            Text("$dose", style: klabelresultatStyle),
            SizedBox(
              width: 20.0,
            ),
            Text('mg', style: klabelresultatStyle),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: <Widget>[
            Text('Volume finale :', style: klabelTextStyle),
            SizedBox(
              width: 20.0,
            ),
            Text("$volume", style: klabelresultatStyle),
            SizedBox(
              width: 20.0,
            ),
            Text('ml', style: klabelresultatStyle),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: <Widget>[
            Text('Composé de :', style: klabelTextStyle),
            SizedBox(
              width: 20.0,
            ),
            Text("$nbr_flacon", style: klabelresultatStyle),
            SizedBox(
              width: 20.0,
            ),
            Text('flacons', style: klabelresultatStyle),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
        Row(
          children: <Widget>[
            Text('Relicat :', style: klabelTextStyle),
            SizedBox(
              width: 20.0,
            ),
            Text("$reliquat", style: klabelresultatStyle),
            SizedBox(
              width: 20.0,
            ),
            Text('ml', style: klabelresultatStyle),
          ],
        ),
        SizedBox(
          height: 40.0,
        ),
        SizedBox(
          height: 40.0,
        ),
        Row(
          children: <Widget>[
            Text('Type de poche :', style: klabelTextStyle),
            SizedBox(
              width: 20.0,
            ),
            Text("$poche", style: klabelresultatStyle),
            SizedBox(
              width: 20.0,
            ),
            Text('ml', style: klabelresultatStyle),
          ],
        ),
        SizedBox(
          height: 40.0,
        ),
        RaisedButton(
            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
            color: Colors.lightBlueAccent,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: Text(
              "sauvegarder",
              style: kbuttonTextStyle,
            ),
            onPressed: () async {
              //clock
              //chnger format de date
              var newFormat = DateFormat("yyyy-MM-dd H:m");
              String time = newFormat.format(DateTime.now());

              print('time DateTime.now() $time');
              //insirer patient
              int id_patient_search;
              if(patient_search== null){
               id_patient_search= await  dbmanager.insertPatient(new Patient(
                  nom_patient_ctrl.text,
                  prenom_patient_ctrl.text,
                  height,
                  weight,
                  double.parse(surface_coporelle_ctrl.text),
                ));
              }else{
                 id_patient_search =patient_search.id_patient;
              }

              int id_poche_choisi;
              if(ChoisirPoche()==250){
                id_poche_choisi =1;
              }else{
                id_poche_choisi =2;
              }
              dbmanager.insertSolution(new Solution(
              time,
                double.parse(posologie_ctrl.text),
                int.parse(reduction_ctrl.text),
                dose,
                volume,
                  id_med_jcombobox,
                id_poche_choisi,
                 id_patient_search,
              ));
              //clean textfields
              setState(() {
                nom_patient_ctrl.clear();
                prenom_patient_ctrl.clear();
                height = 180;
                weight = 60;
                surface_coporelle_ctrl.clear();
                posologie_ctrl.clear();
                reduction_ctrl.clear();
              });
              patient_search=null;
            }),
      ],
    );
  }
}
