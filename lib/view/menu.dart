import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:medica/view/calculer_la_dose_screen.dart';
import 'package:medica/view/fin_journe_screen.dart';
import 'package:medica/view/list_history_screen.dart';
import 'package:medica/view/list_med_screen.dart';
import 'package:medica/widgets_sp%C3%A9cifiques/top_bar.dart';
import 'package:medica/constantes.dart';
import '../widgets_spécifiques/button_menu.dart';
import 'debut_journe_screen.dart';

class Menu extends StatelessWidget {
  static String id = 'menu_screen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              child: TopBar(),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 18.0, horizontal: 15.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          //pour eviter de beaucoup texte de button alors je le met d une classe qui s appele buutton_menu et puis juste je l appel et je la donne des propriete
                          child: button_menu(
                            //une fonction ndiro fiha win 7abin nro7o
                            ontap: () {
                              Navigator.pushNamed(context, Calculer_ladose.id);
                            },
                            label: 'calculer la dose',
                            nom_image: 'calculator',
                          ),
                        ),
                        Expanded(
                          child: button_menu(
                            ontap: () {
                              Navigator.pushNamed(context, List_med.id);
                            },
                            label: 'Explorer la liste des medicaments',
                            nom_image: 'list-01',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: button_menu(
                            ontap: () {
                              Navigator.pushNamed(context, Debut_journee.id);
                            },
                            label: 'Etat des reliquats',
                            nom_image: 'energy-01',
                          ),
                        ),
                        Expanded(
                          child: button_menu(
                            ontap: () {
                              Navigator.pushNamed(context, Fin_journee.id);
                            },
                            label: 'Etat des médicaments utilisée',
                            nom_image: 'tired',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, list_history.id);
                      },
                      child: Card(
                        elevation: 10.0,
                        margin: EdgeInsets.all(9.0),
                        //pour radius
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Icon(
                              Icons.history,
                              color: Colors.tealAccent,
                              size: 48.0,
                            ),
                            SizedBox(
                              width: 40.0,
                            ),
                            Text(
                              'Historique',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.black54,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
