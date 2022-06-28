import 'package:flutter/material.dart';

class LabelFieldLegenda extends StatelessWidget {
  LabelFieldLegenda({Key? key, this.label}) : super(key: key);

  String? label;

  @override
  Widget build(BuildContext context) {
    return Text(label!, style: const TextStyle(color: Colors.white, fontSize: 12));
  }
}
