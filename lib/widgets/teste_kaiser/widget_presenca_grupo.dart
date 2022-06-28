import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/preparo_sintese_controller.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/acoplamento/widget_acoplamento.dart';
import 'package:meu_diario_de_sintese/widgets/clivagem/widget_clivagem.dart';
import 'package:meu_diario_de_sintese/widgets/desprotecao/widget_desprotecao.dart';

class WidgetPresencaGrupo extends StatelessWidget {
  WidgetPresencaGrupo({Key? key, required etapa}) : super(key: key);
  PreparoSinteseController controller = Get.put(PreparoSinteseController());
  String? etapa;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.colorBackgroudDialog,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      title: Column(
        children: [
          const Center(child: Text("Presença de grupo", style: TextStyle(fontSize: 25, color: Colors.white))),
          const Center(child: Text("amina livre?", style: TextStyle(fontSize: 25, color: Colors.white))),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(color: AppTheme.colorAppBar, borderRadius: BorderRadius.circular(15)),
            height: MediaQuery.of(context).size.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Image.asset("assets/tubos.PNG"),
            ),
          ),
          const SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {

                  },
                  child: GestureDetector(
                    onTap: () {
                      if (controller.etapaAtual == "D") {
                        Get.back();
                        controller.NovoPreparo(controller!.sinteseModel);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return WidgetDesprotecao();
                            });
                      } else if (controller.etapaAtual == "A") {
                        Get.back();
                        showDialog(
                            context: context,
                            builder: (context) {
                              return WidgetClivagem();
                            });
                      }
                    },
                    child: Container(
                        width: 30,
                        height: 30,
                        color: Colors.red,
                        child: const Icon(Icons.close, color: Colors.white, size: 30)),
                  )),

              const SizedBox(width: 100,),

              GestureDetector(
                  onTap: () {
                    if (controller.etapaAtual == "D") {
                      Get.back();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return WidgetAcoplamento();
                          });
                    } else if (controller.etapaAtual == "A") {
                      controller.NovoPreparoAcomplamento();
                      showDialog(
                          context: context,
                          builder: (context) {
                            return WidgetAcoplamento();
                          });
                    }
                  },
                  child: Container(
                    color: Colors.green,
                      height: 30,
                      width: 30,
                      child: const Icon(Icons.check, color: Colors.white, size: 30))),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancelar", style: TextStyle(color: Colors.white),)),
      ],
    );
  }
}
