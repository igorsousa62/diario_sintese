import 'package:flutter/material.dart';

class CheckBoxOption extends StatelessWidget {
  const CheckBoxOption({Key? key, this.text, this.check, this.onTap, this.textSize = 17}) : super(key: key);

  final String? text;
  final double? textSize;
  final bool? check;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 0, top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
              ),
              child: Icon(Icons.check, color: check! ? Colors.white : Colors.transparent, size: 15),
            ),
            const SizedBox(width: 20,),
            Text(text!, style: TextStyle(fontSize: textSize!, color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
