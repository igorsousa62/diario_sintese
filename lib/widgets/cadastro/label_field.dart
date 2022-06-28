import 'package:flutter/material.dart';

class LabelField extends StatelessWidget {
  LabelField({Key? key, this.label}) : super(key: key);

  String? label;

  @override
  Widget build(BuildContext context) {
    return Text(label!,
        style:
        const TextStyle(color: Colors.white, fontSize: 20));
  }
}
