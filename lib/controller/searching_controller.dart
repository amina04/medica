import 'package:flutter/material.dart';

class searching_ctrl extends StatefulWidget {
  @override
  _searching_ctrlState createState() => _searching_ctrlState();
}

final chercher_med_ctrl = TextEditingController();

class _searching_ctrlState extends State<searching_ctrl> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed. pour allouer la ram

    chercher_med_ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
