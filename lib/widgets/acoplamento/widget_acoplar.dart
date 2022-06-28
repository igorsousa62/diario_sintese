import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/preparo_sintese_controller.dart';
import 'package:meu_diario_de_sintese/helpers/timer.dart';
import 'package:meu_diario_de_sintese/pages/page_cronometro.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/check_box_option.dart';
import 'package:meu_diario_de_sintese/widgets/teste_kaiser/widget_preparar_kaiser.dart';

class WidgetAcoplar extends StatefulWidget {
  const WidgetAcoplar({Key? key}) : super(key: key);

  @override
  _WidgetAcoplarState createState() => _WidgetAcoplarState();
}

class _WidgetAcoplarState extends State<WidgetAcoplar> {
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
                      Text("Acoplamento:",
                          style: TextStyle(color: Colors.white, fontSize: 25))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CheckBoxOption(
                    text: controller.preparoSinteseModel!.etapasAcoplamento![controller.indexAcomplamento!].descricao,
                    onTap: () {
                      controller.preparoSinteseModel!.etapasAcoplamento![controller.indexAcomplamento!].feito =
                      !controller.preparoSinteseModel!.etapasAcoplamento![controller.indexAcomplamento!].feito!;

                      setState(() {

                      });
                    },
                    check: controller.preparoSinteseModel!.etapasAcoplamento![controller.indexAcomplamento!].feito,
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
              controller!.indexAcomplamento = controller!.indexAcomplamento! + 1;

              if (controller.indexAcomplamento! > controller.preparoSinteseModel!.etapasAcoplamento!.length) {
                Get.back();
                showDialog(
                    context: context,
                    builder: (context) {
                      return WidgetTesteKaiser();
                    });

              } else {
                if (controller.preparoSinteseModel!.etapasAcoplamento![controller!.indexAcomplamento!].tipo == "cronometrada") {
                  Get.back();
                  Get.offAll(PageCronometro(
                    text: controller.preparoSinteseModel!.etapasAcoplamento![controller!.indexAcomplamento!].descricao,
                    numeroRepeticoes: 0,
                    tempo: int.parse(getStringToTime(controller.preparoSinteseModel!.etapasAcoplamento![controller!.indexAcomplamento!].tempo!)),
                    rotina: "A",
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

