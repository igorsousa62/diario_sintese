import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/sintese_controller.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/buttonGrey.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/container_circular.dart';
import 'package:meu_diario_de_sintese/widgets/widget_metodos.dart';

class WidgetNomeDataPrevisor extends StatelessWidget {
  WidgetNomeDataPrevisor({Key? key}) : super(key: key);

  SinteseController controller = Get.put(SinteseController());

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
                  Text("Nome do Peptídeo: " + controller.sinteseModel!.nomePeptideo!, style: const TextStyle(color: Colors.white, fontSize: 18)),
                  const SizedBox(height: 10,),
                  Text("Sequencia: " + controller.sinteseModel!.sequenciaPeptideo!, style: const TextStyle(color: Colors.white, fontSize: 18)),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(8),
            decoration: const BoxDecoration(
                color: AppTheme.colorAppBar,
                borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            height: 140,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    Text("Dados", style: TextStyle(color: Colors.white, fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 10,),
                Text("Massa Molar: " + controller.GetMassaMolar().toString(), style: const TextStyle(color: Colors.white, fontSize: 18)),
                const Text("Hidrofobicidade média: 00", style: TextStyle(color: Colors.white, fontSize: 18)),
                const Text("Carga: 00", style: TextStyle(color: Colors.white, fontSize: 18)),
              ],
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
                    children: const [
                      Text("Previsor de Agregação", style: TextStyle(color: Colors.white, fontSize: 18)),
                    ],
                  ),
                  const SizedBox(height: 10,),
                  const Text("Número de hot spots: 00", style: TextStyle(color: Colors.white, fontSize: 18)),
                  const SizedBox(height: 10,),
                  ButtonGrey(text: "Exibir Relatório Completo", width: 250,)

                ],
              ),
            ),
          ),
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
              showDialog(
                  context: context,
                  builder: (context) {
                    return WidgetMetodos();
                  });
            },
            child: const Text("Avançar", style: TextStyle(color: Colors.white),))
      ],
    );
  }
}
