import 'package:flutter/material.dart';

class IconAdd extends StatelessWidget {
  const IconAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(5)
        ),
        height: 30,
        width: 30,
        child: const Icon(Icons.add, size: 20, color: Colors.white));
  }
}
