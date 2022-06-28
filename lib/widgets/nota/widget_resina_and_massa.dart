import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/preparo_sintese_controller.dart';
import 'package:meu_diario_de_sintese/controller/sintese_controller.dart';
import 'package:meu_diario_de_sintese/pages/resina/list_resinas.dart';
import 'package:meu_diario_de_sintese/pages/resina/nova_resina.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/buttonGrey.dart';
import 'package:meu_diario_de_sintese/widgets/button_selected_type.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/container_circular.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/field_custon.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/label_field.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/label_field_legenda.dart';
import 'package:meu_diario_de_sintese/widgets/check_box_option.dart';
import 'package:meu_diario_de_sintese/widgets/nota/widget_nome_dado_previsor.dart';

class WidgetResinaAndMassa extends StatelessWidget {
  WidgetResinaAndMassa({Key? key}) : super(key: key);

  SinteseController controller = Get.put(SinteseController());
  PreparoSinteseController controllerPreparo = Get.put(PreparoSinteseController());

  final TextEditingController _controllerPeptidio = TextEditingController();
  final TextEditingController _controllerResina = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.colorBackgroudDialog,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      title: Column(
        children: [
          ContainerCircular(
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LabelField(label: "Resina",),
                      const SizedBox(width: 10,),
                      Obx(
                          () => ButtonSelectedType(
                            selected: controllerPreparo.resinaSelected.value,
                            onTap: () {
                              Get.to(ListResina(sintese: true));
                            },),
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      Get.to(NovaResina());
                    },
                    child: ButtonGrey(text: "Cadastrar nova"),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10,),
          ContainerCircular(
            widget: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelField(label: "Massa de peptídio",),
                      const SizedBox(width: 5,),
                      LabelFieldLegenda(label: "Desejável",),
                      const SizedBox(width: 10,),
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                          () => FieldCuston(
                              textEditingController: _controllerPeptidio,
                              largura: 100, textInputType: TextInputType.number, readOnly: controller.tipoMassa.value == "resina"),
                      ),
                      const SizedBox(width: 10,),
                      const Text("g", style: TextStyle(color: Colors.white, fontSize: 18)),
                      const SizedBox(width: 60,),
                      Obx(
                              () => CheckBoxOption(
                            onTap: () {
                              controller.SetTipoMassa('peptidio');
                              controller.sinteseModel!.tipoMassa = 'peptidio';
                              _controllerResina.text = "";
                            },
                            check: controller.tipoMassa.value == "peptidio",
                            text: "",
                          )
                      )
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Divider(),
                  const SizedBox(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelField(label: "Massa de Resina",)
                    ],
                  ),
                  Row(
                    children: [
                      Obx(
                            () => FieldCuston(
                                textEditingController: _controllerResina,
                                largura: 100, textInputType: TextInputType.number, readOnly: controller.tipoMassa.value == "peptidio"),
                      ),
                      const SizedBox(width: 10,),
                      const Text("g", style: TextStyle(color: Colors.white, fontSize: 18)),
                      const SizedBox(width: 60,),
                      Obx(
                          () => CheckBoxOption(
                            onTap: () {
                              controller.SetTipoMassa('resina');
                              controller.sinteseModel!.tipoMassa = 'resina';
                              _controllerPeptidio.text = "";
                            },
                            check: controller.tipoMassa.value == "resina",
                            text: "",
                          )
                      )
                    ],
                  ),
                ],
              ),
            ),          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Voltar", style: TextStyle(color: Colors.white),)),
        FlatButton(
            onPressed: () {
              Get.back();
              controller.sinteseModel!.tipoMassa = controller.tipoMassa.value;
              if (controller.tipoMassa.value == "resina") {
                controller.sinteseModel!.qtdMassa = _controllerResina.text;
              } else {
                controller.sinteseModel!.qtdMassa = _controllerPeptidio.text;
              }
              showDialog(
                  context: context,
                  builder: (context) {
                    return WidgetNomeDataPrevisor();
                  });
            },
            child: const Text("Avançar", style: TextStyle(color: Colors.white),))
      ],
    );
  }
}
