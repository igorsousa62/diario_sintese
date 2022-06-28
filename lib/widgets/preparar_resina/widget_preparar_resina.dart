import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/preparo_sintese_controller.dart';
import 'package:meu_diario_de_sintese/controller/sintese_controller.dart';
import 'package:meu_diario_de_sintese/model/preparo_sintese_model.dart';
import 'package:meu_diario_de_sintese/model/sintese_model.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/preparar_resina/widget_passo_a_passo_inchar_resina.dart';
import 'package:meu_diario_de_sintese/widgets/nota/widget_selected_sub.dart';

class WidgetPrepararResina extends StatelessWidget {
  WidgetPrepararResina({Key? key, this.sinsete}) : super(key: key);

  SinteseModel? sinsete;
  SinteseController controller = SinteseController();
  PreparoSinteseController controllerPreparo = Get.put(PreparoSinteseController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.colorBackgroudDialog,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Column(
        children: [
          const Center(
            child: Text("Você está na etapa",
                style: TextStyle(fontSize: 25, color: Colors.white)),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: AppTheme.colorAppBar,
                borderRadius: BorderRadius.circular(15)),
            child: const Padding(
              padding:
                  EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
              child: Text("Preparar Resina",
                  style: TextStyle(color: Colors.white)),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Get.back();
            },
            child: const Text(
              "Cancelar",
              style: TextStyle(color: Colors.white),
            )),
        FlatButton(
            onPressed: () {
              Get.back();
              controllerPreparo.NovoPreparo(sinsete);

              showDialog(
                  context: context,
                  builder: (context) {
                    return const WidgetPassoAPassoIncharResina();
                  });
            },
            child: const Text(
              "Iniciar",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
