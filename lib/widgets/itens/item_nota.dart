import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/model/sintese_model.dart';
import 'package:meu_diario_de_sintese/pages/home_page.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/preparar_resina/widget_preparar_resina.dart';

class ItemNota extends StatelessWidget {
  ItemNota({Key? key, this.sintese}) : super(key: key);

  SinteseModel? sintese;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
      child: GestureDetector(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return WidgetPrepararResina(sinsete: sintese!,);
              });
        },
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
          ),
          height: 120,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Nome do peptídeo: " + sintese!.nomePeptideo!, style: const TextStyle(color: Colors.black, fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Sequência: " + sintese!.sequenciaPeptideo!, style: const TextStyle(color: Colors.black, fontSize: 18)),
                  ],
                ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(sintese!.dataHora!.substring(8, 10) + '/' + sintese!.dataHora!.substring(5, 7) + '/' +sintese!.dataHora!.substring(0, 4) + ' ' +
                        sintese!.dataHora!.substring(11, 13) + ':'  + sintese!.dataHora!.substring(14, 16) + ':' + sintese!.dataHora!.substring(17, 19), style: const TextStyle(color: Colors.black, fontSize: 18)),
                    GestureDetector(onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: AppTheme.colorBackgroudDialog,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                              ),
                              title: const Text("Deseja realmente excluir esse item?", style: TextStyle(color: Colors.white)),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text("Não", style: TextStyle(color: Colors.white),)),
                                FlatButton(
                                    onPressed: () {
                                      sintese!.deleteData();
                                      Get.offAll(HomePage());
                                    },
                                    child: const Text("Sim", style: TextStyle(color: Colors.white),))
                              ],
                            );
                          });
                    },
                      child: const Icon(Icons.delete, size: 25, color: Colors.red),)
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
