import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/etapa_verifica_simples_model.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/protocolo_model.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';

class ItemEtapaVerificacao extends StatelessWidget {
  ItemEtapaVerificacao({Key? key, this.etapa, this.protocoloModel, this.onTapDelete, this.onTapEdit}) : super(key: key);

  EtapaVerificacaoSimplesModel? etapa;
  ProtocoloModel? protocoloModel;
  Function()? onTapDelete;
  Function()? onTapEdit;

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
                  Text("Descricao: " + etapa!.descricao!, style: const TextStyle(color: Colors.white, fontSize: 20)),
                  GestureDetector(onTap: onTapEdit,
                    child: const Icon(Icons.edit, size: 25, color: Colors.white),)
                ],
              ),
              const SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
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
                                  onPressed: onTapDelete,
                                  child: const Text("Sim", style: TextStyle(color: Colors.white),))
                            ],
                          );
                        });

                  },
                    child: const Icon(Icons.delete, size: 25, color: Colors.white),)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
