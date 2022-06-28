import 'package:flutter/material.dart';

class ButtonGrey extends StatelessWidget {
  ButtonGrey({Key? key, this.text, this.width = 150, this.onTap}) : super(key: key);

  String? text;
  double? width;
  Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white24,
        ),
        child: Center(child: Text(text!, style: const TextStyle(color: Colors.white, fontSize: 20))),
        height: 40,
        width: width,
      ),
      onTap: onTap,
    );
  }
}
