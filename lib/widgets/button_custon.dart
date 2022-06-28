import 'package:flutter/material.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';

class ButtonCuston extends StatelessWidget {
  final String? text;
  final Color? color;
  final Color? colorText;
  final Function()? onTap;
  final IconData? icon;
  final height;

  const ButtonCuston({Key? key, this.text, this.color = AppTheme.colorAppBar, this.onTap, this.icon, this.height, this.colorText = Colors.white}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: SizedBox(
          child: Center(
            child: Text(text!, style: TextStyle(color: colorText!, fontSize: 18)),
          ),
          height: MediaQuery.of(context).size.height * 0.06
      ),
      onPressed: onTap!,
      color: color,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(100.0),
          side: const BorderSide(color: AppTheme.colorAppBar)
      ),
    );
  }
}
