import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/etapa_cronometrada_model.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/protocolo_model.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/button_custon.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/container_circular.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/field_custon.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/label_field.dart';
import 'package:meu_diario_de_sintese/widgets/text_form_field_custon.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';

class EtapaCronometrada extends StatelessWidget {
  EtapaCronometrada({Key? key, this.protocoloModel, this.etapaCronometrada}) {
    if (this.etapaCronometrada != null) {
      _descricao.text = etapaCronometrada!.descricao!;
      _tempo.text = etapaCronometrada!.tempo!;
    }
  }

  var maskTempo = MaskTextInputFormatter(mask: '##:##:##', filter: {"#": RegExp(r'[0-9]')});

  final TextEditingController _descricao = TextEditingController();
  final TextEditingController _tempo = TextEditingController();

  ProtocoloModel? protocoloModel;
  EtapaCronometradaModel? etapaCronometrada;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colorBackgroud,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.colorBackgroud,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
            child: ContainerCircular(
              widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [LabelField(label: "Etapa cronometrada")],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FieldCuston(
                          largura: 350,
                          textEditingController: _descricao,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      color: Colors.white,
                      child: TextFormFieldCuston(
                        textAlign: TextAlign.left,
                        controller: _tempo,
                        textInputFormatter: maskTempo,
                        hint: "00:00:00",
                        textInputType: TextInputType.number,
                        text: "",
                        onSaved: (value) {},
                        isPassword: false,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ButtonCuston(
              text: "Adicionar",
              onTap: () {
                if (_descricao.text == "") {
                  showToast("Informe a descrição");
                } else if (_tempo.text == "") {
                  showToast("Informe o tempo");
                } else {
                  if (protocoloModel!.etapaCronometrada == null) {
                    protocoloModel!.etapaCronometrada = [];
                  }

                  if (etapaCronometrada == null) {
                    etapaCronometrada = EtapaCronometradaModel();
                    etapaCronometrada!.descricao = _descricao.text;
                    etapaCronometrada!.tempo = _tempo.text;
                    etapaCronometrada!.dataHora = DateTime.now().toString();

                    protocoloModel!.etapaCronometrada!.add(etapaCronometrada!);

                    showToast("Etapa adicionada com sucesso");

                    Get.back();
                  } else {
                    etapaCronometrada!.descricao = _descricao.text;
                    etapaCronometrada!.tempo = _tempo.text;

                    protocoloModel!.etapaCronometrada!.remove(etapaCronometrada);
                    protocoloModel!.etapaCronometrada!.add(etapaCronometrada!);

                    showToast("Etapa atualizada com sucesso");

                    Get.back();
                    Get.back();
                  }
                }
              },
            ),
          )
        ],
      ),
    );
  }
}
