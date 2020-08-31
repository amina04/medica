import 'package:flutter/material.dart';

class step2_ctrl extends StatefulWidget {
  @override
  _step2_ctrlState createState() => _step2_ctrlState();
}

final posologie_ctrl = TextEditingController();
final reduction_ctrl = TextEditingController();

class _step2_ctrlState extends State<step2_ctrl> {
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed. pour allouer la ram

    posologie_ctrl.dispose();
    reduction_ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
