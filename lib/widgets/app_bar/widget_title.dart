import 'package:flutter/material.dart';

class WidgetTitle extends StatelessWidget {
  WidgetTitle({Key? key, this.title}) : super(key: key);
  String? title;

  @override
  Widget build(BuildContext context) {
    return Text(title!,
        style: const TextStyle(color: Colors.white, fontSize: 30));
  }
}
