import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/sintese_controller.dart';
import 'package:meu_diario_de_sintese/pages/home_page.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/list_protocolo.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/novo_protocolo.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/buttonGrey.dart';
import 'package:meu_diario_de_sintese/widgets/button_selected_metodo.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/container_circular.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/label_field.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';

class WidgetMetodos extends StatelessWidget {
  WidgetMetodos({Key? key}) : super(key: key);

  final SinteseController _controller = Get.put(SinteseController());

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
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LabelField(label: "Método de desproteção")
                    ],
                  ),
                  const SizedBox(height: 10,),
                  ButtonSelectedMetodo(onTap: () {
                    Get.to(ListCatalogos(tipo: "Desproteção", sintese: true));
                  }),
                  const SizedBox(height: 10,),
                  ButtonGrey(text: "Cadastrar Novo", onTap: () {
                    Get.to(NovoProtocolo(tipo: "Desproteção"));
                  },)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ContainerCircular(
            widget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LabelField(label: "Método de acoplamento")
                    ],
                  ),
                  const SizedBox(height: 10,),
                  ButtonSelectedMetodo(onTap: () {
                    Get.to(ListCatalogos(tipo: "Acoplamento", sintese: true));
                  }),
                  const SizedBox(height: 10,),
                  ButtonGrey(text: "Cadastrar Novo", onTap: () {
                    Get.to(NovoProtocolo(tipo: "Acoplamento"));
                  },)
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          ContainerCircular(
            widget: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      LabelField(label: "Método de clivagem",)
                    ],
                  ),
                  const SizedBox(height: 10,),
                  ButtonSelectedMetodo(onTap: () {
                    Get.to(ListCatalogos(tipo: "Clivagem", sintese: true));
                  }),
                  const SizedBox(height: 10,),
                  ButtonGrey(text: "Cadastrar Novo", onTap: () {
                    Get.to(NovoProtocolo(tipo: "Clivagem"));
                  },)
                ],
              ),
            ),
          )
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
              _controller.saveProtocolo(onFail: () {
                showToast("Houve uma falha ao salvar a síntese");
              }, onSucess: () {
                showToast("Sintese salva com sucesso");
                Get.offAll(HomePage());
              });
            },
            child: const Text("Finalizar", style: TextStyle(color: Colors.white),))
      ],
    );
  }
}
