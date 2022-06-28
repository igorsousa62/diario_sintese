import 'package:flutter/material.dart';

class ButtonSelectedMetodo extends StatelessWidget {
  Function()? onTap;

  ButtonSelectedMetodo({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.green,
            borderRadius: BorderRadius.circular(15)
        ),
        width: 300,
        height: 60,
        child: ListTile(
          title: const Text("Escolha o Método", style: TextStyle(color: Colors.white)),
          trailing: const Icon(Icons.arrow_downward, color: Colors.white, size: 30),
          onTap: onTap,
        ));
  }
}
