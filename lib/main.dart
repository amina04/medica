import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:medica/controller/add_med_controller.dart';
import 'package:medica/controller/calcul_step1_controller.dart';
import 'package:medica/model/database.dart';
import 'package:medica/model/model_tableaux/join_patient_solution.dart';
import 'package:medica/model/model_tableaux/medicament.dart';
import 'package:medica/view/add_med_screen.dart';
import 'package:medica/view/calculer_la_dose_screen.dart';
import 'package:medica/view/debut_journe_screen.dart';
import 'package:medica/view/fin_journe_screen.dart';
import 'package:medica/view/history_details_screen.dart';
import 'package:medica/view/list_history_screen.dart';
import 'package:medica/view/list_med_screen.dart';
import 'package:medica/view/menu.dart';
import 'package:medica/view/medicament_details_screen.dart';

import 'model/model_tableaux/calculs.dart';
import 'model/model_tableaux/détails_med.dart';
import 'model/model_tableaux/patient.dart';
import 'model/model_tableaux/poches.dart';
import 'model/model_tableaux/solution.dart';
import 'view/start.dart';
String etat;
//double prix_totale=0;
Map<String,double> prix_reli={};
//pour qeviter le probleme de quand on supprime un reliquat pirimé l accé au deatils hiqtorique de personne sera impossible

String reliquat_history;
List meds;
List patient_list;
List poche_list;
List meds_detail;
List debut_journee;
List fin_journee;
//=============
List join_med;
List join_pat_sol_list;
Color couleur;
//utilisée dans list view pour le item selectionner a le id de item
Medicament med_det, med_modif, med_search;
Detail_medicament medi_detail_det;
Patient patient_det, patient_search;
Solution solution_selectione;
Calculs calcul_selectionne;

double ci_jcombobox_selected;
double volume_flcn_jcombobox_selected;
double c_min_jcombobox_selcted;
double c_max_jcombobox_selcted;
int  id_med_jcombobox;
int selected_id;
int selected_id_patient;
int updated_id;
String selected_item = null;

int height = 180;
int weight = 60;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var dbmanager = new Dbmedica();

  int save1 = await dbmanager.insertPoches(new Poches(250));
  print('poche $save1');
  int save2 = await dbmanager.insertPoches(new Poches(500));
  print('poche $save2');

  meds = await dbmanager.getAllMed();
  patient_list = await dbmanager.getAllpatient();
  poche_list = await dbmanager.getAllPoches();
  //med_det = await dbmanager.getMed(selected_id);
  meds_detail = await dbmanager.getAllDetailMed();
  //===========================================
  join_med=await dbmanager.getAllJoinMedDetail();
  join_pat_sol_list =await dbmanager.getAllJoinPatSol();
  debut_journee = await dbmanager.getAllJoinMedSolCalc();
  fin_journee = await dbmanager.getAllJoinMedCalc();

  //========================================
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
    if (kReleaseMode) exit(1);
  };
  runApp(
    MaterialApp(
      theme: ThemeData.light().copyWith(
        textTheme: TextTheme(
          body1: TextStyle(color: Colors.black),
        ),
      ),
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Start(),
      ),
      initialRoute: Start.id,
      routes: {
        //les fenetres ta3 app kamlin w meme kon nzido des fenetres khin lzm ndirohom hna bah nesta3amlo navigator .push
        //khdemt b const au lieu string bah tol n3odo n3ayto lel constant string w lokan naghalto f 7arf matamchi w manazrbouch nfi9o lel ghalta
        Start.id: (context) => Start(),
        Menu.id: (context) => Menu(),
        Calculer_ladose.id: (context) => Calculer_ladose(),
        List_med.id: (context) => List_med(),
        Debut_journee.id: (context) => Debut_journee(),
        Fin_journee.id: (context) => Fin_journee(),
        Detail_med.id: (context) => Detail_med(),
        Add_med.id: (context) => Add_med(),
        list_history.id: (context) => list_history(),
        Detail_patient.id: (context) => Detail_patient(),
      },
    ),
  );
}
