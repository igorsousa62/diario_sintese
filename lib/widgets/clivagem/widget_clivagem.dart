import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/preparo_sintese_controller.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/clivagem/widget_clivar.dart';

class WidgetClivagem extends StatelessWidget {
  WidgetClivagem({Key? key}) : super(key: key);

  PreparoSinteseController controller = Get.put(PreparoSinteseController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.colorBackgroudDialog,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      title: Column(
        children: [
          const Center(
            child: Text("Você está na etapa", style: TextStyle(fontSize: 25, color: Colors.white)),
          ),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(color: AppTheme.colorAppBar, borderRadius: BorderRadius.circular(15)),
            child: const Padding(
              padding: EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Text("Clivagem", style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(height: 10,),
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
              Get.back();
              showDialog(
                  context: context,
                  builder: (context) {
                    return const WidgetClivar();
                  });
            },
            child: const Text("Avançar", style: TextStyle(color: Colors.white),))
      ],
    );
  }
}
