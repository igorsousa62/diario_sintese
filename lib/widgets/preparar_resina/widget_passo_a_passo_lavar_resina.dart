import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/preparo_sintese_controller.dart';
import 'package:meu_diario_de_sintese/pages/page_cronometro.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/container_circular.dart';
import 'package:meu_diario_de_sintese/widgets/check_box_option.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';

class WidgetPassoAPassoLavarResina extends StatefulWidget {
  const WidgetPassoAPassoLavarResina({Key? key}) : super(key: key);

  @override
  _WidgetPassoAPassoLavarResinaState createState() =>
      _WidgetPassoAPassoLavarResinaState();
}

class _WidgetPassoAPassoLavarResinaState
    extends State<WidgetPassoAPassoLavarResina> {
  PreparoSinteseController controller = Get.put(PreparoSinteseController());

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
          ContainerCircular(
            widget: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text("Lavar a Resina:",
                          style: TextStyle(color: Colors.white, fontSize: 25))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CheckBoxOption(
                    text: "Submeter a vácuo",
                    onTap: () {
                      controller.preparoSinteseModel!.submeterVacuo =
                          !controller.preparoSinteseModel!.submeterVacuo!;
                      setState(() {});
                    },
                    check: controller.preparoSinteseModel!.submeterVacuo,
                  ),
                  CheckBoxOption(
                    text: "Adicione DCM ou AFM",
                    onTap: () {
                      controller.preparoSinteseModel!.adicionadoDCMouAFM =
                          !controller.preparoSinteseModel!.adicionadoDCMouAFM!;
                      setState(() {});
                    },
                    check: controller.preparoSinteseModel!.adicionadoDCMouAFM,
                  ),
                  const Text(
                    "3 vezes o volume da resina",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: AppTheme.colorAppBar,
                borderRadius: BorderRadius.circular(15)),
            height: 60,
            child: const Padding(
                padding: EdgeInsets.only(left: 10, right: 10, top: 10),
                child: Text("Após submeter a agitação repetir o processo 4X",
                    style: TextStyle(color: Colors.white, fontSize: 15))),
          ),
          const SizedBox(
            height: 10,
          ),
          CheckBoxOption(
              text: "Não confirmar passo a passo",
              onTap: () {
                controller.preparoSinteseModel!.pularEtapaLavarResina =
                    !controller.preparoSinteseModel!.pularEtapaLavarResina!;
                setState(() {});
              },
              check: controller.preparoSinteseModel!.pularEtapaLavarResina,
              textSize: 12),
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
              if ((controller.preparoSinteseModel!.pularEtapaLavarResina!) ||
                  ((controller.preparoSinteseModel!.submeterVacuo!) &&
                      (controller.preparoSinteseModel!.adicionadoDCMouAFM!))) {
                Get.back();
                Get.offAll(PageCronometro(
                  text: "Submeter a agitação",
                  rotina: "TLR",
                  numeroRepeticoes: 4,
                  tempo: 60,
                ));
              } else {
                showToast("Necessário confirmar todas as etapas");
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
