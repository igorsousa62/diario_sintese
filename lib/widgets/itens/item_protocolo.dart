import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/protocolo_controller.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/protocolo_model.dart';
import 'package:meu_diario_de_sintese/pages/home_page.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/novo_protocolo.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/container_circular.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/label_field.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';

class ItemProtocolo extends StatelessWidget {
  ItemProtocolo({Key? key, this.protocoloModel}) : super(key: key);

  ProtocoloModel? protocoloModel;

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
                  LabelField(label: protocoloModel!.nome),
                  GestureDetector(onTap: () {
                    Get.to(NovoProtocolo(tipo: protocoloModel!.tipo, protocoloModel: protocoloModel,));
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
                                  Text("Nome: " + protocoloModel!.nome!, style: const TextStyle(color: Colors.white),),
                                  const SizedBox(height: 10,),
                                  Text(protocoloModel!.descricao!, style: const TextStyle(color: Colors.white),)
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
                            title: const Text("Deseja realmente excluir esse protocolo?", style: TextStyle(color: Colors.white)),
                            actions: <Widget>[
                              FlatButton(
                                  onPressed: () {
                                    Get.back();
                                  },
                                  child: const Text("Não", style: TextStyle(color: Colors.white),)),
                              FlatButton(
                                  onPressed: () {
                                    Get.back();
                                    ProtocoloController controller = ProtocoloController();

                                    controller.deleteProtocolo(protocolo: protocoloModel, onSucess: () {
                                      Get.offAll(HomePage());
                                      showToast("Protocolo excluído com sucesso");
                                    }, onFail: () {
                                      showToast("Falha ao excluír protocolo");
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
