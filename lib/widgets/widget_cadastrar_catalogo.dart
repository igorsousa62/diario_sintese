import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/list_protocolo.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/button_custon.dart';

class WidgetCadastrarCatalogo extends StatelessWidget {
  const WidgetCadastrarCatalogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.colorBackgroudDialog,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      title: Column(
        children: [
          ButtonCuston(onTap: () {
            Get.back();
            //Get.offAll(const ListCatalogos());
          }, text: "Catálogo",),
          const SizedBox(height: 10,),
          ButtonCuston(onTap: () {
            Get.back();
          }, text: "Cadastrar",),
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
