import 'package:flutter/material.dart';
import '../constantes.dart';
import 'package:medica/widgets_sp%C3%A9cifiques/TextFieldmedica.dart';
import 'package:medica/controller/calcul_step1_controller.dart';
import 'package:medica/main.dart';

class Step1 extends StatefulWidget {
  @override
  _Step1State createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  //final surface_coporelle_ctrl = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed. pour allouer la ram

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Textfieldmedica(
          label: 'Nom',
          controller: nom_patient_ctrl,
        ),
        SizedBox(height: 10.0),
        Textfieldmedica(
          label: 'Prénom',
          controller: prenom_patient_ctrl,
        ),
        SizedBox(height: 15.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'La taille ',
              style: klabelTextStyle,
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  // crossAxisAlignment: CrossAxisAlignment.baseline,

                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: klabelTextStyle,
                    ),
                    Text(
                      'cm',
                      style: klabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Colors.tealAccent,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                    overlayShape: RoundSliderOverlayShape(
                      overlayRadius: 25.0,
                    ),
                    activeTrackColor: Colors.tealAccent.shade700,
                    overlayColor: Color(0xFFE2FFFF),
                    inactiveTrackColor: Color(0xFF8D8E98),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 40.0,
                    max: 220.0,
                    onChanged: (double newValue) {
                      setState(() {
                        height = newValue.round();
                        print("$height");
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text(
              'Le poids ',
              style: klabelTextStyle,
            ),
            Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  // crossAxisAlignment: CrossAxisAlignment.baseline,

                  children: <Widget>[
                    Text(
                      weight.toString(),
                      style: klabelTextStyle,
                    ),
                    Text(
                      'Kg',
                      style: klabelTextStyle,
                    ),
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Colors.tealAccent,
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 10.0),
                    overlayShape: RoundSliderOverlayShape(overlayRadius: 25.0),
                    activeTrackColor: Colors.tealAccent.shade700,
                    overlayColor: Color(0xFFE2FFFF),
                    inactiveTrackColor: Color(0xFF8D8E98),
                  ),
                  child: Slider(
                    value: weight.toDouble(),
                    min: 5.0,
                    max: 140.0,
                    onChanged: (double newValue) {
                      setState(() {
                        weight = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(
          height: 5.0,
        ),
        //une texte field spécifique khdamto w dertp fi class bah tol n3aytolo w nevitiw bzf texte
        Textfieldmedica(
          label: 'Surface coporelle',
          controller: surface_coporelle_ctrl,
        ),
      ],
    );
  }
}
