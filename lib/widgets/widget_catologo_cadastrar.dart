import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/button_custon.dart';

class WidgetCatalogoCadastrar extends StatelessWidget {
  const WidgetCatalogoCadastrar({Key? key, this.onCatalogo, this.onCadastrar}) : super(key: key);

  final Function()? onCatalogo;
  final Function()? onCadastrar;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.colorBackgroudDialog,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      title: Column(

        children: [
          ButtonCuston(onTap: onCatalogo, text: "Catálogo",),
          const SizedBox(height: 10,),
          ButtonCuston(onTap: onCadastrar, text: "Cadastrar",),
          const SizedBox(height: 10,)
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Fechar", style: TextStyle(color: Colors.white),))
      ],
    );
  }
}
