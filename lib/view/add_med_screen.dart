import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medica/constantes.dart';
import 'package:medica/main.dart';
import 'package:medica/model/database.dart';
import 'package:medica/model/model_tableaux/d%C3%A9tails_med.dart';
import 'package:medica/widgets_sp%C3%A9cifiques/TextFieldmedica.dart';
import 'package:medica/controller/add_med_controller.dart';
import 'package:medica/model/model_tableaux/medicament.dart';
import 'package:medica/view/list_med_screen.dart';
import 'package:medica/model/model_tableaux/medicament.dart';

class Add_med extends StatefulWidget {
  static String id = 'Add_med';

  @override
  _Add_med createState() => _Add_med();
}

class _Add_med extends State<Add_med> {
  //cree une instance de db class

  var dbmanager = new Dbmedica();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 30.0, horizontal: 15.0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.tealAccent),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0) //         <--- border radius here
                    ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Nom :',
                    textAlign: TextAlign.center,
                    style: klabeladdMedStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfieldmedica(
                    label: 'Nom de médicament',
                    controller: nom_med_ctrl,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfieldmedica(
                    label: 'Laboratoire',
                    controller: nom_labo_ctrl,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.tealAccent),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0) //         <--- border radius here
                    ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Présentation :',
                    textAlign: TextAlign.center,
                    style: klabeladdMedStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfieldmedica(
                    label: 'Pésentation',
                    controller: presentation_ctrl,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.tealAccent),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0) //         <--- border radius here
                    ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'volume de flacon :',
                    textAlign: TextAlign.center,
                    style: klabeladdMedStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfieldmedica(
                    label: 'volume de flacon',
                    controller: volum_flcn_ctrl,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.tealAccent),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0) //         <--- border radius here
                    ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Quantité disponible :',
                    textAlign: TextAlign.center,
                    style: klabeladdMedStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfieldmedica(
                    label: 'Quantité disponible',
                    controller: qte_disponible_ctrl,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.tealAccent),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0) //         <--- border radius here
                    ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Concentration :',
                    textAlign: TextAlign.center,
                    style: klabeladdMedStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfieldmedica(
                    label: 'C Initiale',
                    controller: c_ini_ctrl,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfieldmedica(
                    label: 'C Minimale',
                    controller: c_min_ctrl,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfieldmedica(
                    label: 'C Maximale',
                    controller: c_max_ctrl,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.tealAccent),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0) //         <--- border radius here
                    ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Volume aprés péparation :',
                    textAlign: TextAlign.center,
                    style: klabeladdMedStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfieldmedica(
                    label: 'Volume aprés péparation',
                    controller: volum_apr_praparation_ctrl,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.tealAccent),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0) //         <--- border radius here
                    ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Prix du mg :',
                    textAlign: TextAlign.center,
                    style: klabeladdMedStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfieldmedica(
                    label: 'Prix du mg ',
                    controller: prix_ctrl,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
              decoration: BoxDecoration(
                border: Border.all(width: 2.0, color: Colors.tealAccent),
                borderRadius: BorderRadius.all(
                    Radius.circular(5.0) //         <--- border radius here
                    ),
              ),
              child: Column(
                children: <Widget>[
                  Text(
                    'Stabilités :',
                    textAlign: TextAlign.center,
                    style: klabeladdMedStyle,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfieldmedica(
                    label: 'Flacon verre 4 ',
                    controller: verre_4_ctrl,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfieldmedica(
                    label: 'Flacon verre 25 ',
                    controller: verre_25_ctrl,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Textfieldmedica(
                    label: 'PVC 25',
                    controller: pvc_25_ctrl,
                  ),
                  SizedBox(
                    height: 20,
                  ),

                ],
              ),
            ),
            SizedBox(
              height: 60.0,
            ),
            RaisedButton(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15.0),
              color: Colors.lightBlueAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: Text(
                "sauvegarder",
                style: kbuttonTextStyle,
              ),
              onPressed: () async{
                //ajout de med
                if (med_modif == null){
                  //ajouter un medicament
                  int res = await dbmanager.insertMedicament(new Medicament(
                      nom_med_ctrl.text,
                      int.parse(qte_disponible_ctrl.text),
                      double.parse(volum_flcn_ctrl.text)));
                  print("id medicament $res");

                  int res_det = await dbmanager
                      .insertDetailMedicament(new Detail_medicament(
                    res,
                    nom_labo_ctrl.text,
                    double.parse(presentation_ctrl.text),
                    int.parse(prix_ctrl.text),
                    double.parse(c_ini_ctrl.text),
                    double.parse(c_min_ctrl.text),
                    double.parse(c_max_ctrl.text),
                    double.parse(volum_apr_praparation_ctrl.text),
                    int.parse(verre_4_ctrl.text),
                    int.parse(verre_25_ctrl.text),
                    int.parse(pvc_25_ctrl.text),
                  ));
                  print("id detail $res_det");

                  //pour met les texte field null
                  nom_med_ctrl.clear();
                  nom_labo_ctrl.clear();
                  volum_flcn_ctrl.clear();
                  qte_disponible_ctrl.clear();
                  presentation_ctrl.clear();
                  c_ini_ctrl.clear();
                  c_min_ctrl.clear();
                  c_max_ctrl.clear();
                  volum_apr_praparation_ctrl.clear();
                  prix_ctrl.clear();
                  verre_4_ctrl.clear();
                  verre_25_ctrl.clear();
                  pvc_25_ctrl.clear();

                  /* setState(() {
                    selected_item = Medicament.fromMap(meds.first).nom;
                  });*/
                }else{
                  //modification
                  Medicament medUpdated = Medicament.fromMap({
                    "nom": nom_med_ctrl.text,
                    "qte_disponible": int.parse(qte_disponible_ctrl.text),
                    "volume_flacon": double.parse(volum_flcn_ctrl.text),
                    "id_medicament": updated_id,
                  });
                  await dbmanager.modifierMed(medUpdated);

                  Detail_medicament medDetailUpdated =
                      Detail_medicament.fromMap({
                    "nom_labo": nom_labo_ctrl.text,
                    "presentation": double.parse(presentation_ctrl.text),
                    "prix": int.parse(prix_ctrl.text),
                    "c_init": double.parse(c_ini_ctrl.text),
                    "c_min": double.parse(c_min_ctrl.text),
                    "c_max": double.parse(c_max_ctrl.text),
                    "volume": double.parse(volum_apr_praparation_ctrl.text),
                    "verre_4": int.parse(verre_4_ctrl.text),
                    "verre_25": int.parse(verre_25_ctrl.text),
                    "PVC_25": int.parse(pvc_25_ctrl.text),
                    "FKmedId": updated_id,
                  });
                  await dbmanager.modifierDetailMed(medDetailUpdated);
                  //pour met les texte field null
                  nom_med_ctrl.clear();
                  nom_labo_ctrl.clear();
                  volum_flcn_ctrl.clear();
                  qte_disponible_ctrl.clear();
                  presentation_ctrl.clear();
                  c_ini_ctrl.clear();
                  c_min_ctrl.clear();
                  c_max_ctrl.clear();
                  volum_apr_praparation_ctrl.clear();
                  prix_ctrl.clear();
                  verre_4_ctrl.clear();
                  verre_25_ctrl.clear();
                  pvc_25_ctrl.clear();
                  //mettre medupdated null a lafin de procuss
                  med_modif = null;
                  updated_id = null;
                  Navigator.pushNamed(context, List_med.id);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
