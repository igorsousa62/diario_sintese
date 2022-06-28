import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/preparo_sintese_controller.dart';
import 'package:meu_diario_de_sintese/controller/sintese_controller.dart';
import 'package:meu_diario_de_sintese/pages/residuoAA/list_aas.dart';
import 'package:meu_diario_de_sintese/pages/residuoAA/novo_residuo_aas.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/buttonGrey.dart';
import 'package:meu_diario_de_sintese/widgets/button_selected_type.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/container_circular.dart';
import 'package:meu_diario_de_sintese/widgets/nota/widget_resina_and_massa.dart';

class WidgetSelectedSub extends StatelessWidget {
  WidgetSelectedSub({Key? key}) : super(key: key);

  SinteseController controller = Get.put(SinteseController());
  PreparoSinteseController controllerPreparo = Get.put(PreparoSinteseController());

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
            child: Text("Resíduo de aas", style: TextStyle(color: Colors.white, fontSize: 18)),
          ),
          const SizedBox(height: 10,),
          Container(
            decoration: const BoxDecoration(
              color: AppTheme.colorAppBar,
              borderRadius: BorderRadius.all(Radius.circular(15))
            ),
            height: MediaQuery.of(context).size.height * 0.3,
            child: Obx(
                () => Column(
                  children: [
                    const SizedBox(height: 10,),
                    Center(
                      child: Text(controller.listResiduos[controller.index.value].name!, style: const TextStyle(color: Colors.white, fontSize: 25)),
                    ),
                    Image.asset(controller.listResiduos[controller.index.value].image!, height: MediaQuery.of(context).size.height * 0.2, fit: BoxFit.cover,)
                  ],
                ),
            )
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    controller.decIndex();
                  },
                  child: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 30)),
              const SizedBox(width: 20,),
              Obx(
                  () => Text(controller.listResiduos[controller.index.value].symobol!, style: const TextStyle(color: Colors.white, fontSize: 25)),
              ),
              const SizedBox(width: 20,),
              GestureDetector(
                  onTap: () {
                    controller.incIndex();
                  },
                  child: const Icon(Icons.arrow_forward, color: Colors.white, size: 30)),
            ],
          ),
          const SizedBox(height: 10,),
          Obx(
              () => ButtonSelectedType(
                selected: controllerPreparo.residuoAASelected.value,
                onTap: () {
                  Get.to(ListAAS(tipo: controller.listResiduos[controller.index.value].symobol!,));
                },),
          ),
          const SizedBox(height: 10,),
          GestureDetector(
            onTap: () {
              Get.to(NovoResiduoAA());
            },
            child: ButtonGrey(text: "Cadastrar nova")
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
                    return WidgetResinaAndMassa();
                  });
            },
            child: const Text("Avançar", style: TextStyle(color: Colors.white),))
      ],
    );
  }
}
