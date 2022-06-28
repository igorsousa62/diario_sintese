import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/preparo_sintese_controller.dart';
import 'package:meu_diario_de_sintese/pages/page_cronometro.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/check_box_option.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';

class WidgetPassoAPassoIncharResina extends StatefulWidget {
  const WidgetPassoAPassoIncharResina({Key? key}) : super(key: key);

  @override
  _WidgetPassoAPassoIncharResinaState createState() => _WidgetPassoAPassoIncharResinaState();
}

class _WidgetPassoAPassoIncharResinaState extends State<WidgetPassoAPassoIncharResina> {

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
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(color: AppTheme.colorAppBar, borderRadius: BorderRadius.circular(15)),
            height: MediaQuery.of(context).size.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text("Inchar Resina:", style: TextStyle(color: Colors.white, fontSize: 25))
                    ],
                  ),
                  const SizedBox(height: 10,),
                  CheckBoxOption(text: "Pese " + controller.GetPesoResina().toString() + " g de resina", onTap: () {
                    controller.preparoSinteseModel!.resinaPesada = !controller.preparoSinteseModel!.resinaPesada!;
                    setState(() {

                    });
                  }, check: controller.preparoSinteseModel!.resinaPesada,),
                  CheckBoxOption(text: "Adicione DCM", onTap: () {
                    controller.preparoSinteseModel!.adicionadoDCM = !controller.preparoSinteseModel!.adicionadoDCM!;
                    setState(() {

                    });
                  }, check: controller.preparoSinteseModel!.adicionadoDCM,),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          CheckBoxOption(text: "Não confirmar passo a passo", onTap: () {
            controller.preparoSinteseModel!.pularEtapa = !controller.preparoSinteseModel!.pularEtapa!;
            setState(() {

            });
          }, check: controller.preparoSinteseModel!.pularEtapa, textSize: 12),
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
               if ((controller.preparoSinteseModel!.pularEtapa!) || ((controller.preparoSinteseModel!.resinaPesada!) && (controller.preparoSinteseModel!.adicionadoDCM!))){
                 Get.back();
                 /// Alterar o tempo
                 Get.to(PageCronometro(text: "Submeter a agitação", tempo: 10, numeroRepeticoes: 0, rotina: "TIR",));
               } else {
                 showToast("Necessário confirmar todas as etapas");
               }
            },
            child: const Text("Avançar", style: TextStyle(color: Colors.white),))
      ],
    );
  }
}

