import 'package:flutter/material.dart';
import 'package:medica/constantes.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:medica/model/database.dart';
import 'package:medica/model/model_tableaux/join_patient_solution.dart';
import 'package:medica/model/model_tableaux/patient.dart';
import 'package:medica/view/medicament_details_screen.dart';
import 'add_med_screen.dart';
import 'history_details_screen.dart';
import 'package:medica/main.dart';

class list_history extends StatefulWidget {
  static String id = 'list_history';
  @override
  _list_history createState() => _list_history();
}

class _list_history extends State<list_history> {
  var dbmanager = new Dbmedica();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text('Liste des patients', style: kappBarTextStyle),
        gradient:
            LinearGradient(colors: [Colors.lightBlueAccent, Colors.tealAccent]),
      ),
      body: FutureBuilder(
        future: dbmanager.getAllJoinPatSol(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            join_pat_sol_list = snapshot.data;
            return _buildlistview();
          }
          return new CircularProgressIndicator();
        },
      ),
    );
  }

  //la methode buildlist view
  ListView _buildlistview() {
    return ListView.builder(
        itemCount: join_pat_sol_list == null ? 0 : join_pat_sol_list.length,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            child: ListTile(
              title: Row(
                children: <Widget>[
                  Text(
                    '${Join_patient_solution.fromMap(join_pat_sol_list[position]).Nom_patient}',
                    style: kresultliststyle,
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    ' ${Join_patient_solution.fromMap(join_pat_sol_list[position]).Prenom_patient}',
                    style: kresultliststyle,
                  ),
                ],
              ),
              //un sous titre
              //un sous titre
              subtitle: Text(
                '${Join_patient_solution.fromMap(join_pat_sol_list[position]).date_preparation}',
                style: klabelTextStyle,
              ),
              //l icon a droite
              leading: Icon(
                Icons.person,
                size: 35.0,
              ),
              // l icon a gauche
              trailing: Icon(
                Icons.arrow_forward,
                size: 35.0,
                color: Colors.lightBlueAccent,
              ),
              //ajouter async pour marcher get med avec await
              onTap: () async {
                // Navigator.pushNamed(context, Detail_med.id);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Detail_patient()));

                selected_id_patient =
                    Join_patient_solution.fromMap(join_pat_sol_list[position]).id_patient;

                patient_det = await dbmanager.getPatient(selected_id_patient);
                solution_selectione = await dbmanager.getSolution(selected_id_patient)  ;
                int med_id_calc =solution_selectione.FKmedId;
                String date_pre_calc =solution_selectione.date_preparation;
              calcul_selectionne = await dbmanager.getCalculs(med_id_calc,date_pre_calc);

if(calcul_selectionne==null){reliquat_history='0';}else{reliquat_history =calcul_selectionne.reliquat;}
              },
            ),
          );
        });
  }

}
