import 'package:flutter/material.dart';
import 'package:medica/constantes.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:medica/controller/searching_controller.dart';
import 'package:medica/main.dart';
import 'package:medica/model/database.dart';
import 'package:medica/model/model_tableaux/join_med_detail.dart';
import 'package:medica/model/model_tableaux/medicament.dart';
import 'package:medica/model/model_tableaux/medicament.dart';
import 'package:medica/view/medicament_details_screen.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import '../main.dart';
import 'add_med_screen.dart';
import 'package:medica/main.dart';

class List_med extends StatefulWidget {
  static String id = 'list_med_screen';
  @override
  _List_medState createState() => _List_medState();
}

class _List_medState extends State<List_med> {
  var dbmanager = new Dbmedica();

  @override
  // bool medicament_existe = false;
  Icon cusIcon = Icon(Icons.search);
  Widget cusSearchBar = Text(
    'Liste des médicaments',
    style: kappBarTextStyle,
  );
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        actions: <Widget>[
          IconButton(
            onPressed: () {
              setState(() {
                if (this.cusIcon.icon == Icons.search) {
                  this.cusIcon = Icon(Icons.cancel);
                  this.cusSearchBar = TextField(
                    controller: chercher_med_ctrl,
                    decoration:
                        InputDecoration(hintText: 'Chercher un médicament'),
                    textInputAction: TextInputAction.search,
                    onSubmitted: (term) async {
                      //si le med n existe pas on affiche ce alert message
                      med_search =
                          await dbmanager.chercherMed(chercher_med_ctrl.text);

                      if (med_search == null) {
                        Alert(
                                context: context,
                                title: "Ce médicament n'existe pas",
                                desc: "vous devez le l'ajouter d'abord.")
                            .show();
                      } else {

                        selected_id = med_search.id_medicament;
                        print('id delectionne $selected_id');
                        med_det = med_search;
                        medi_detail_det = await dbmanager.getMedDetail(selected_id);
                        //=========================
                        med_search=null;
                        print('exisit');
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Detail_med()));

                      }
                    },
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                  );
                } else {
                  this.cusIcon = Icon(Icons.search);
                  this.cusSearchBar = Text(
                    'Liste des médicaments',
                    style: kappBarTextStyle,
                  );
                }
              });
            },
            icon: cusIcon,
          ),
        ],
        centerTitle: true,
        title: cusSearchBar,
        gradient:
            LinearGradient(colors: [Colors.lightBlueAccent, Colors.tealAccent]),
      ),
      //pour reecrier la list view aprées chaque ajout

      body: FutureBuilder(
        future: dbmanager.getAllJoinMedDetail(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            join_med = snapshot.data;
            return _buildlistview();
          }
          return new CircularProgressIndicator();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Add_med.id);
        },
        child: new Icon(
          Icons.add,
          size: 40,
        ),
        backgroundColor: Colors.lightBlueAccent,
        foregroundColor: Colors.white,
      ),
    );
  }

  //la methode buildlist view
  ListView _buildlistview() {
    return ListView.builder(
        itemCount: join_med == null ? 0 : join_med.length,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            child: ListTile(
              title: Text(
                'médicament : ${Join_med_detail.fromMap(join_med[position]).nom}',
                style: kresultliststyle,
              ),
              //un sous titre
              subtitle: Text(
                'Laboratoire : ${Join_med_detail.fromMap(join_med[position]).nom_labo}',
                style: klabelTextStyle,
              ),
              //l icon a droite
              leading: Image.asset(
                'images/pills.png',
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
                    MaterialPageRoute(builder: (context) => Detail_med()));

                selected_id = Join_med_detail.fromMap(join_med[position]).id_medicament;
                print('id delectionne $selected_id');
                med_det = await dbmanager.getMed(selected_id);
                medi_detail_det = await dbmanager.getMedDetail(selected_id);
              },
            ),
          );
        });
  }
}
