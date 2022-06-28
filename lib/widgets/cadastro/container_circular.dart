import 'package:flutter/material.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';

class ContainerCircular extends StatelessWidget {
  ContainerCircular({Key? key, this.widget, this.color = AppTheme.colorAppBar}) : super(key: key);

  Widget? widget;
  Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: widget,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15)),
    );
  }
}
