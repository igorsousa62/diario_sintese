import 'package:flutter/material.dart';

class ButtonSelectedType extends StatelessWidget {
  Function()? onTap;
  bool? selected;

  ButtonSelectedType({Key? key, this.onTap, this.selected}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: selected! ? Colors.green : Colors.red,
          borderRadius: BorderRadius.circular(15)
      ),
      width: 170,
      height: 50,
      child: ListTile(
          title: const Text("Escolha o tipo", style: TextStyle(color: Colors.white)),
          trailing: const Icon(Icons.arrow_downward, color: Colors.white, size: 20),
          onTap: onTap,
    ));
  }
}
