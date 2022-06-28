import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/preparo_sintese_controller.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/acoplamento/widget_acoplar.dart';

class WidgetAcoplamento extends StatelessWidget {
  WidgetAcoplamento({Key? key}) : super(key: key);

  PreparoSinteseController controller = Get.put(PreparoSinteseController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.colorBackgroudDialog,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      title: Column(
        children: const [
          Center(
            child: Text("Você está na etapa: Acoplamento", style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          SizedBox(height: 10,),
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancelar", style: TextStyle(color: Colors.white),)),
        FlatButton(
            onPressed: () {
              controller.etapaAtual = "A";
              Get.back();
              showDialog(
                  context: context,
                  builder: (context) {
                    return const WidgetAcoplar();
                  });
            },
            child: const Text("Avançar", style: TextStyle(color: Colors.white),))
      ],
    );
  }
}
