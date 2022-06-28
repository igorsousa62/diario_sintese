import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/preparo_sintese_controller.dart';
import 'package:meu_diario_de_sintese/helpers/timer.dart';
import 'package:meu_diario_de_sintese/pages/page_cronometro.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/check_box_option.dart';
import 'package:meu_diario_de_sintese/widgets/teste_kaiser/widget_preparar_kaiser.dart';

class WidgetDesproteger extends StatefulWidget {
  const WidgetDesproteger({Key? key}) : super(key: key);

  @override
  _WidgetDesprotegerState createState() => _WidgetDesprotegerState();
}

class _WidgetDesprotegerState extends State<WidgetDesproteger> {
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
                      Text("Desproteger:",
                          style: TextStyle(color: Colors.white, fontSize: 25))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CheckBoxOption(
                    text: controller.preparoSinteseModel!.etapasDesprotecao![controller.indexDesprotecao!].descricao,
                    onTap: () {
                      controller.preparoSinteseModel!.etapasDesprotecao![controller.indexDesprotecao!].feito =
                      !controller.preparoSinteseModel!.etapasDesprotecao![controller.indexDesprotecao!].feito!;

                      setState(() {

                      });
                    },
                    check: controller.preparoSinteseModel!.etapasDesprotecao![controller.indexDesprotecao!].feito,
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
              controller!.indexDesprotecao = controller!.indexDesprotecao! + 1;

              if (controller.indexDesprotecao! > controller.preparoSinteseModel!.etapasDesprotecao!.length) {
                Get.back();
                showDialog(
                    context: context,
                    builder: (context) {
                      return WidgetTesteKaiser();
                    });

              } else {
                if (controller.preparoSinteseModel!.etapasDesprotecao![controller!.indexDesprotecao!].tipo == "cronometrada") {
                  Get.back();
                  Get.offAll(PageCronometro(
                    text: controller.preparoSinteseModel!.etapasDesprotecao![controller!.indexDesprotecao!].descricao,
                    numeroRepeticoes: 0,
                    tempo: int.parse(getStringToTime(controller.preparoSinteseModel!.etapasDesprotecao![controller!.indexDesprotecao!].tempo!)),
                    rotina: "D",
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

