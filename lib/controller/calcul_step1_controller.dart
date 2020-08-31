import 'package:flutter/material.dart';

class step1_ctrl extends StatefulWidget {
  @override
  _step1_ctrlState createState() => _step1_ctrlState();
}

final surface_coporelle_ctrl = TextEditingController();
final nom_patient_ctrl = TextEditingController();
final prenom_patient_ctrl = TextEditingController();

final chercher_patient_ctrl = TextEditingController();

class _step1_ctrlState extends State<step1_ctrl> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed. pour allouer la ram
    surface_coporelle_ctrl.dispose();
    nom_patient_ctrl.dispose();
    prenom_patient_ctrl.dispose();
    chercher_patient_ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
