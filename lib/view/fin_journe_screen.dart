import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:medica/constantes.dart';
import 'package:medica/model/database.dart';
import 'package:medica/model/model_tableaux/join_med_calc.dart';
import 'package:medica/controller/fonctions_calculs.dart';
import '../main.dart';

class Fin_journee extends StatefulWidget {
  static String id = 'fin_journee_screen';
  @override
  _Fin_journeeState createState() => _Fin_journeeState();
}

class _Fin_journeeState extends State<Fin_journee> {
  var dbmanager = new Dbmedica();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        centerTitle: true,
        title: Text('Fin de journée', style: kappBarTextStyle),
        gradient:
            LinearGradient(colors: [Colors.lightBlueAccent, Colors.tealAccent]),
      ),
      //Navigateur Bar
      body: FutureBuilder(
        future: dbmanager.getAllJoinMedCalc() ,

        builder: (context, snapshot) {
          if (snapshot.hasData) {
            fin_journee = snapshot.data;
           ListView;  {
              return ListView.builder(
                  itemCount: fin_journee == null ? 0 : fin_journee.length,
                  itemBuilder: (BuildContext context, int position) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Card(
                        child: ListTile(
                          title: Text(
                            'médicament : ${Join_Med_Calc.fromMap(fin_journee[position]).nom}',
                            style:ktitlecardStyle,
                          ),
//un sous titre
                          subtitle: Column(
                            children: <Widget>[
                              SizedBox( height: 11.0,),
                              Row(
                                children: <Widget>[
                                  Text(
                                    'La quantité consommée :',
                                    style: kcontaincardStyle,
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    '${Join_Med_Calc.fromMap(fin_journee[position]).qte_consomme}',
                                    style: kcontaincardStyle,
                                  ),
                                  SizedBox(
                                    width: 8.0,
                                  ),
                                  Text(
                                    'flacons',
                                    style: kcontaincardStyle,
                                  ),
                                ],
                              ),
                              SizedBox( height: 6.0,),
                              Row(children: [  Text(
                                'reliquats :',
                                style: kcontaincardStyle,
                              ),

                                SizedBox(
                                  width: 50.0,
                                ),
                                Text(
                                  'Stabilités :',
                                  style: kcontaincardStyle,
                                ),]),

                              Row(children: [   Text(
                                '${Join_Med_Calc.fromMap(fin_journee[position]).reliquat}  mg/ml',
                                style: kcontaincardStyle,
                              ),

                                SizedBox(
                                  width: 30.0,
                                ),
                                Text(
                                  '${Join_Med_Calc.fromMap(fin_journee[position]).stabilite} heures',
                                  style: kcontaincardStyle,
                                ),]),

                              SizedBox( height: 6.0,),

                              Row(
                                children: <Widget>[
                                  Text(
                                    'Prix des reliquats jetées',
                                    style: kcontaincardStyle,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),

                                  Text(
                                     '${prix_reli[Join_Med_Calc.fromMap(fin_journee[position]).nom]}'

                                    ,
                                    style: kcontaincardStyle,
                                  ),
                                  SizedBox(
                                    width: 10.0,
                                  ),
                                  Text(
                                    'DA',
                                    style: kcontaincardStyle,
                                  ),
                                ],
                              ),
                              SizedBox( height: 11.0,),
                            ],

                          ),
                        ),

                      ),
                    );
                  });
            }
          }
          return new CircularProgressIndicator();
        },
      ),
    );
  }
}

