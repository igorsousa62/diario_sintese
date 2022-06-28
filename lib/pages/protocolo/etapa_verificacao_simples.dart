import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/etapa_verifica_simples_model.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/protocolo_model.dart';
import 'package:meu_diario_de_sintese/widgets/button_custon.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/container_circular.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/field_custon.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/label_field.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';

import '../../theme/app_theme.dart';

class EtapaVerificacaoSimples extends StatelessWidget {
  EtapaVerificacaoSimples({Key? key, this.protocoloModel, this.etapa}) {
    if (this.etapa != null) {
      _descricao.text = etapa!.descricao!;
    }
  }

  ProtocoloModel? protocoloModel;
  EtapaVerificacaoSimplesModel? etapa;

  final TextEditingController _descricao = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colorBackgroud,
      appBar: AppBar(
        backgroundColor: AppTheme.colorBackgroud,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15, top: 20),
            child: ContainerCircular(
              widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        LabelField(label: "Etapa de verificação simples"),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FieldCuston(largura: 300, textEditingController: _descricao),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ButtonCuston(text: "Adicionar", onTap: () {
              if (_descricao.text == "") {
                showToast("Informe a descrição");
              } else {

                if (protocoloModel!.etapaVerificacaoSimples == null) {
                  protocoloModel!.etapaVerificacaoSimples = [];
                }

                if (etapa == null) {
                  etapa = EtapaVerificacaoSimplesModel();
                  etapa!.descricao = _descricao.text;
                  etapa!.dataHora = DateTime.now().toString();

                  protocoloModel!.etapaVerificacaoSimples!.add(etapa!);

                  showToast("Etapa adicionada com sucesso");

                  Get.back();
                } else {
                  etapa!.descricao = _descricao.text;

                  protocoloModel!.etapaVerificacaoSimples!.remove(etapa);
                  protocoloModel!.etapaVerificacaoSimples!.add(etapa!);

                  showToast("Etapa atualizada com sucesso");

                  Get.back();
                  Get.back();
                }
              }
            },),
          )
        ],
      ),
    );
  }
}
