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

  List<DropdownMenuItem> getDropDownItemPoche() {
    List<DropdownMenuItem<int>> dropdownitems = [];
    for (int i = 0; i < poche_list.length; i++) {
      //  extrait le nom de chaque objet comme dans list screen

      int currency = Poches.fromMap(poche_list[i]).volume_poche;
      var newItem = DropdownMenuItem(
        child: Text(currency.toString()),
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
                  return DropdownButton<String>(
                    items: getDropDownItem(),
                    value: selected_item,
                    onChanged: (value) {
                      setState(() {
                        selected_item = value;
                      });
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
        SizedBox(
          height: 15.0,
        ),
        Row(
          children: <Widget>[
            Text(
              'Volume du poche : ',
              style: klabelTextStyle,
            ),
            SizedBox(
              width: 10.0,
            ),
            FutureBuilder(
              future: dbmanager.getAllPoches(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return DropdownButton<int>(
                    items: getDropDownItemPoche(),
                    value: selected_item_poche,
                    onChanged: (value) {
                      setState(() {
                        selected_item_poche = value;
                      });
                    },
                  );
                }
                return new CircularProgressIndicator();
              },
            ),
          ],
        ),
      ],
    );
  }
}
