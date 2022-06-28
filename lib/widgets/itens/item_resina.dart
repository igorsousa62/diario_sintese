import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/resina_controller.dart';
import 'package:meu_diario_de_sintese/model/resina_model.dart';
import 'package:meu_diario_de_sintese/pages/home_page.dart';
import 'package:meu_diario_de_sintese/pages/resina/nova_resina.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/container_circular.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';

class ItemResina extends StatelessWidget {
  ItemResina({Key? key, this.resina}) : super(key: key);

  ResinaModel? resina;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
      child: ContainerCircular(
        widget: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(resina!.nome!, style: const TextStyle(color: Colors.white, fontSize: 20)),
                  GestureDetector(onTap: () {
                    Get.to(NovaResina(resinaModel: resina,));
                  },
                    child: const Icon(Icons.edit, size: 25, color: Colors.white),)
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              backgroundColor: AppTheme.colorBackgroudDialog,
                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                              ),
                              title: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Nome: " + resina!.nome!, style: const TextStyle(color: Colors.white),),
                                  const SizedBox(height: 10,),
                                  Text(resina!.descricao!, style: const TextStyle(color: Colors.white),)
                                ],
                              ),
                              actions: <Widget>[
                                FlatButton(
                                    onPressed: () {
                                      Get.back();
                                    },
                                    child: const Text("Fechar", style: TextStyle(color: Colors.white),))
                              ],
                            );
                          });
                    },
                    child: Container(
                      child: const Text("Descrição", style: TextStyle(color: Colors.white, fontSize: 20)),
                      height: 30,
                      width: 100,
                      color: Colors.white24,
                    ),
                  ),
                  GestureDetector(onTap: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            backgroundColor: AppTheme.colorBackgroudDialog,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0))
                            ),
                            title: const Text("Deseja realmente excluir essa resina?", style: TextStyle(color: Colors.white)),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text("Não", style: TextStyle(color: Colors.white),)),
                              FlatButton(
                                  onPressed: () {
                                    ResinaController controller = ResinaController();

                                    controller.deleteResina(resina: resina, onSucess: () {
                                      Get.offAll(HomePage());
                                      showToast("Resina excluída com sucesso");
                                    }, onFail: () {
                                      showToast("Falha ao excluír resina");
                                    });
                                  },
                                  child: const Text("Sim", style: TextStyle(color: Colors.white),))
                            ],
                          );
                        });
                  },
                    child: const Icon(Icons.delete, size: 25, color: Colors.white),)
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}
