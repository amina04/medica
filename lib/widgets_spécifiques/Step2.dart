import 'package:flutter/material.dart';
import 'package:medica/controller/calcul_step2_controller.dart';
import 'package:medica/main.dart';
import 'package:medica/model/database.dart';
import 'package:medica/model/model_tableaux/medicament.dart';
import 'package:medica/model/model_tableaux/poches.dart';
import '../constantes.dart';
import 'package:medica/widgets_sp%C3%A9cifiques/TextFieldmedica.dart';

class Step2 extends StatefulWidget {
  @override
  _Step2State createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  var dbmanager = new Dbmedica();

  List<DropdownMenuItem> getDropDownItem() {
    List<DropdownMenuItem<String>> dropdownitems = [];
    for (int i = 0; i < meds.length; i++) {
      //  extrait le nom de chaque objet comme dans list screen

      String currency = Medicament.fromMap(meds[i]).nom;
      var newItem = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      dropdownitems.add(newItem);
    }
    return dropdownitems;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        // TODO: create a dropdown menu from a data base for medication
        Row(
          children: <Widget>[
            Text(
              'Le médicament: ',
              style: klabelTextStyle,
            ),
            SizedBox(
              width: 10.0,
            ),
            FutureBuilder(
              future: dbmanager.getAllMed(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  meds = snapshot.data;
                  return DropdownButton<String>(
                    items: getDropDownItem(),
                    value: selected_item,
                    onChanged: (value)async {
                      setState(() {
                        selected_item = value;
                        print(' selected item $selected_item');

                      });
                      //on chercher par le nom de tableau medicament apres on voit id et on l extrait au detail medicament
                      med_search =
                          await dbmanager.chercherMed(selected_item);
                      int id_med = med_search.id_medicament;
                      print(' selected item $id_med');
                      //on va au tab details med et extrait tout ce que on veut

                      medi_detail_det=await dbmanager.getMedDetail(id_med);
                      ci_jcombobox_selected = medi_detail_det.c_init;
                      c_max_jcombobox_selcted =medi_detail_det.c_max;
                      c_min_jcombobox_selcted =medi_detail_det.c_min;
                      volume_flcn_jcombobox_selected =med_search.volume_flacon;

                      print(' detail pres $ci_jcombobox_selected  volume flacon $volume_flcn_jcombobox_selected');
                    },
                  );
                }
                return new CircularProgressIndicator();
              },
            ),
          ],
        ),

        SizedBox(
          height: 15.0,
        ),
        Textfieldmedica(
          label: 'Posologie',
          controller: posologie_ctrl,
        ),
        SizedBox(
          height: 15.0,
        ),
        Textfieldmedica(
          label: 'Réduction',
          controller: reduction_ctrl,
        ),

      ],
    );
  }
}
