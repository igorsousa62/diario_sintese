import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/preparo_sintese_controller.dart';
import 'package:meu_diario_de_sintese/pages/page_cronometro.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/desprotecao/widget_desproteger.dart';
import 'package:meu_diario_de_sintese/widgets/preparar_resina/widget_passo_a_passo_inchar_resina.dart';
import 'package:meu_diario_de_sintese/widgets/nota/widget_selected_sub.dart';

class WidgetDesprotecao extends StatelessWidget {
  WidgetDesprotecao({Key? key}) : super(key: key);

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
              child: Text("Desproteção", style: TextStyle(color: Colors.white)),
            ),
          ),
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
                    controller.etapaAtual = "D";
                    if(controller.preparoSinteseModel!.etapasDesprotecao![controller.indexDesprotecao!].tipo == "cronometrada") {
                      return PageCronometro();
                    } else {
                      return const WidgetDesproteger();
                    }
                  });
            },
            child: const Text("Iniciar", style: TextStyle(color: Colors.white),))
      ],
    );
  }
}
