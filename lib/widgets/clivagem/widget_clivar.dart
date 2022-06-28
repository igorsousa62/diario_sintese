import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/preparo_sintese_controller.dart';
import 'package:meu_diario_de_sintese/helpers/timer.dart';
import 'package:meu_diario_de_sintese/pages/page_cronometro.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/check_box_option.dart';
import 'package:meu_diario_de_sintese/widgets/teste_kaiser/widget_preparar_kaiser.dart';

class WidgetClivar extends StatefulWidget {
  const WidgetClivar({Key? key}) : super(key: key);

  @override
  _WidgetClivarState createState() => _WidgetClivarState();
}

class _WidgetClivarState extends State<WidgetClivar> {
  PreparoSinteseController controller = Get.put(PreparoSinteseController());
  int? index;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.colorBackgroudDialog,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: AppTheme.colorAppBar,
                borderRadius: BorderRadius.circular(15)),
            height: 120,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text("Clivagem:",
                          style: TextStyle(color: Colors.white, fontSize: 25))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CheckBoxOption(
                    text: controller.preparoSinteseModel!.etapasClivagem![controller.indexClivagem!].descricao,
                    onTap: () {
                      controller.preparoSinteseModel!.etapasClivagem![controller.indexClivagem!].feito =
                      !controller.preparoSinteseModel!.etapasClivagem![controller.indexClivagem!].feito!;

                      setState(() {

                      });
                    },
                    check: controller.preparoSinteseModel!.etapasClivagem![controller.indexClivagem!].feito,
                  ),
                ],
              ),
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
              controller!.indexClivagem = controller!.indexClivagem! + 1;

              if (controller.indexClivagem! > controller.preparoSinteseModel!.etapasClivagem!.length) {
                Get.back();
                showDialog(
                    context: context,
                    builder: (context) {
                      return WidgetTesteKaiser();
                    });

              } else {
                if (controller.preparoSinteseModel!.etapasClivagem![controller!.indexClivagem!].tipo == "cronometrada") {
                  Get.back();
                  Get.offAll(PageCronometro(
                    text: controller.preparoSinteseModel!.etapasClivagem![controller!.indexClivagem!].descricao,
                    numeroRepeticoes: 0,
                    tempo: int.parse(getStringToTime(controller.preparoSinteseModel!.etapasClivagem![controller!.indexClivagem!].tempo!)),
                    rotina: "C",
                  ));
                } else {
                  setState(() {

                  });
                }
              }
            },
            child: const Text(
              "Avançar",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}

