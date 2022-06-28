import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/residuo_aa_controller.dart';
import 'package:meu_diario_de_sintese/model/residuo_aa_model.dart';
import 'package:meu_diario_de_sintese/pages/home_page.dart';
import 'package:meu_diario_de_sintese/pages/residuoAA/novo_residuo_aas.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';

class ItemAAS extends StatelessWidget {
  ItemAAS({Key? key, this.residuoAA}) : super(key: key);

  ResiduoAAModel? residuoAA;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
      child: Container(
        decoration: BoxDecoration(
            color: AppTheme.colorAppBar,
            borderRadius: BorderRadius.circular(15)
        ),
        height: 100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(residuoAA!.nome!, style: const TextStyle(color: Colors.white, fontSize: 20)),
                  GestureDetector(onTap: () {
                    Get.to(NovoResiduoAA(residuoAAModel: residuoAA,));
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
                                  Text("Nome: " + residuoAA!.nome!, style: const TextStyle(color: Colors.white),),
                                  const SizedBox(height: 10,),
                                  Text(residuoAA!.descricao!, style: const TextStyle(color: Colors.white),)
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
                            title: const Text("Deseja realmente excluir esse item?", style: TextStyle(color: Colors.white)),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text("Não", style: TextStyle(color: Colors.white),)),
                              FlatButton(
                                  onPressed: () {
                                    ResiduoAAController controller = ResiduoAAController();

                                    controller.deleteResiduoAA(ResiduoAA: residuoAA, onSucess: () {
                                      Get.offAll(HomePage());
                                      showToast("Residuo excluído com sucesso");
                                    }, onFail: () {
                                      showToast("Falha ao excluír resíduo");
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
      ),
    );
  }
}
