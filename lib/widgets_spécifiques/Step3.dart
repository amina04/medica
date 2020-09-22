import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:medica/controller/calcul_step2_controller.dart';
import 'package:medica/controller/fonctions_calculs.dart';
import 'package:medica/model/model_tableaux/calculs.dart';
import 'package:medica/model/model_tableaux/join_med_calc_sol.dart';
import 'package:medica/model/model_tableaux/patient.dart';
import 'package:medica/model/model_tableaux/solution.dart';
import 'package:medica/view/add_med_screen.dart';
import '../constantes.dart';
import 'package:medica/controller/calcul_step1_controller.dart';
import 'package:medica/model/database.dart';
import 'package:medica/main.dart';

class Step3 extends StatefulWidget {
  @override
  _Step3State createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  String selected_currency = 'Flacon verre 4';
  List <DropdownMenuItem> getDropDownItems (){
    List<DropdownMenuItem<String>> DropDownItem =[];
    for(int i=0;i<currentList.length;i++){
    String currency =currentList[i];
   var newItem= DropdownMenuItem(child: Text(currency),value: currency,);
   DropDownItem.add(newItem);
  }
    return DropDownItem;
  }
  var dbmanager = new Dbmedica();
  double dose = Dose_a_administrer();
  double volume = Volume_finale();
  int nbr_flacon = Nbr_flacon();
  String reliquat = Reliquat();
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
        Column(children: [
          Text('les conditions de conservation :', style: klabelTextStyle),
          SizedBox(
            width: 20.0,
          ),
DropdownButton<String>(
  value: selected_currency,
items: getDropDownItems(),


onChanged: (value){
  setState(() {
    selected_currency =value;
  });
},)
        ],),
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
              var newFormat = DateFormat("yyyy-MM-dd HH:mm");
              String time = newFormat.format(DateTime.now());

              print('time DateTime.now() $time');
              //extrait stabilité
              String stblt= stabilite(selected_currency, medi_detail_det);
              int id_poche_choisi;
              if(ChoisirPoche()==250){
                id_poche_choisi =1;
              }else{
                id_poche_choisi =2;
              }
              //insirer patient
              int id_patient_search;
             // if(patient_search== null){
                id_patient_search= await  dbmanager.insertPatient(new Patient(
                  nom_patient_ctrl.text,
                  prenom_patient_ctrl.text,
                  height,
                  weight,
                  double.parse(surface_coporelle_ctrl.text),
                ));
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
                double qte_reli_mg = (double.parse(reliquat)*dose)/volume;
                double prixRe =medi_detail_det.prix*qte_reli_mg;
              String prix_re = prixRe.toStringAsFixed(2);
                int res=await dbmanager.insertcalculs(new Calculs(
                  reliquat,nbr_flacon,stblt,double.parse(prix_re),id_med_jcombobox,time,
                ));
        /*      }else{
                //modifier medicament et modifier solution
                id_patient_search =patient_search.id_patient;
                Patient patpdated = Patient.fromMap({
                  "Nom_patient": nom_patient_ctrl.text,
                  "Prenom_patient": prenom_patient_ctrl.text,
                  "taille": height,
                  "poids":  weight,
                  "surface_coporelle": double.parse(surface_coporelle_ctrl.text),
                  "id_patient": id_patient_search,
                });
                await dbmanager.modifierpatient(patpdated);
                //get the right solution
                Solution old_sol =await dbmanager.getSolution(id_patient_search);
                int id_old_sol =old_sol.id_solution;
                //modifier solution
                Solution updatedsol =Solution.fromMap({
                  "id_solution" : id_old_sol,
                  "date_preparation" : time,
                  "posologie" :  double.parse(posologie_ctrl.text),
                  "reduction" :  int.parse(reduction_ctrl.text),
                  "dose_administrer" :  dose,
                  "volume_finale" : volume,
                  "FKmedId"  : id_med_jcombobox,
                  "FKpoche" : id_poche_choisi,
                  "FKpatientId" : id_patient_search,
                });
                await dbmanager.modifierSolution(updatedsol);


              }*/







              //modifier la qte disponible une fonction
             modifier_qte_disponible(nbr_flacon,context);
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
