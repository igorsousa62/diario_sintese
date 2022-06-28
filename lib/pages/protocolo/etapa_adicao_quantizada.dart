import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/etapa_quantizada_model.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/protocolo_model.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/button_custon.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/container_circular.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/field_custon.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/label_field.dart';
import 'package:meu_diario_de_sintese/widgets/check_box_option.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';

class EtapaAdicaoQuantizada extends StatefulWidget {
  EtapaAdicaoQuantizada({Key? key, this.protocoloModel, this.etapa}) : super(key: key);

  ProtocoloModel? protocoloModel;
  EtapaQuantizadaModel? etapa;

  @override
  _EtapaAdicaoQuantizadaState createState() => _EtapaAdicaoQuantizadaState(etapa, protocoloModel);
}

class _EtapaAdicaoQuantizadaState extends State<EtapaAdicaoQuantizada> {

  ProtocoloModel? protocoloModel;
  EtapaQuantizadaModel? etapa;

  _EtapaAdicaoQuantizadaState(this.etapa, this.protocoloModel) {
    if (etapa != null) {
      tipo = etapa!.tipo!;
      _descricao.text = etapa!.descricao!;
      _g_massa.text = etapa!.g_massa!;
      _eq_massa.text = etapa!.eq_massa!;
      _ul_volume.text = etapa!.mol_volume!;
      _eq_volume.text = etapa!.eq_volume!;
    }
  }

  String tipo = '';

  final TextEditingController _descricao = TextEditingController();
  final TextEditingController _g_massa = TextEditingController();
  final TextEditingController _eq_massa = TextEditingController();
  final TextEditingController _ul_volume = TextEditingController();
  final TextEditingController _eq_volume = TextEditingController();

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
              padding: const EdgeInsets.only(
                  right: 15, left: 15, bottom: 15, top: 20),
              child: ContainerCircular(
                widget: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          LabelField(label: "Etapa de adição quantizada"),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          FieldCuston(
                            largura: 300,
                            textEditingController: _descricao,
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: ContainerCircular(
              widget: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        CheckBoxOption(text: "Massa: (g)", check: tipo == 'massa', onTap: () {
                          tipo = 'massa';

                          _ul_volume.text = '';
                          _eq_volume.text = '';
                          setState(() {

                          });
                        }),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        FieldCuston(
                          textInputType: TextInputType.number,
                          readOnly: tipo == 'volume',
                          textEditingController: _g_massa,
                          onSaved: (value) {},
                          largura: 100,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("g/mol:",
                            style:
                            TextStyle(fontSize: 20, color: Colors.white)),
                        const SizedBox(
                          width: 10,
                        ),
                        FieldCuston(
                          textInputType: TextInputType.number,
                          readOnly: tipo == 'volume',
                          textEditingController: _eq_massa,
                          onSaved: (value) {},
                          largura: 100,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("eq:",
                            style:
                            TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        CheckBoxOption(
                          text: "Volume: (µl)",
                          check: tipo == 'volume',
                          onTap: () {
                            tipo = 'volume';

                            _g_massa.text = '';
                            _eq_massa.text = '';

                            setState(() {

                            });
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        FieldCuston(
                          textInputType: TextInputType.number,
                          readOnly: tipo == 'massa',
                          textEditingController: _ul_volume,
                          onSaved: (value) {},
                          largura: 100,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Text("mol/µl:",
                            style:
                            TextStyle(fontSize: 20, color: Colors.white)),
                        const SizedBox(
                          width: 10,
                        ),
                        FieldCuston(
                          textInputType: TextInputType.number,
                          readOnly: tipo == 'massa',
                          textEditingController: _eq_volume,
                          onSaved: (value) {},
                          largura: 100,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        const Text("eq:",
                            style:
                            TextStyle(fontSize: 20, color: Colors.white)),
                      ],
                    )
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
                } else if (tipo == '') {
                  showToast("Selecione massa ou volume");
                }
                else if ((_g_massa.text == "") && (tipo == 'massa')) {
                  showToast("Informe a massa");
                } else if ((_eq_massa.text == "") && (tipo == 'massa')) {
                  showToast("Informe a massa");
                } else if ((_ul_volume.text == "") && (tipo == 'volume')) {
                  showToast("Informe o volume");
                } else if ((_eq_volume.text == "") && (tipo == 'volume')) {
                  showToast("Informe o volume");
                }
                else {
                  if (protocoloModel!.etapaQuantizada == null) {
                    protocoloModel!.etapaQuantizada = [];
                  }

                  if (etapa == null) {
                    etapa = EtapaQuantizadaModel();
                    etapa!.descricao = _descricao.text;
                    etapa!.tipo = tipo;
                    etapa!.dataHora = DateTime.now().toString();

                    if (tipo == 'massa') {
                      etapa!.g_massa = _g_massa.text;
                      etapa!.eq_massa = _eq_massa.text;

                      etapa!.mol_volume = '';
                      etapa!.eq_volume = '';
                    } else {
                      etapa!.g_massa = '';
                      etapa!.eq_massa = '';

                      etapa!.mol_volume = _ul_volume.text;
                      etapa!.eq_volume = _eq_volume.text;
                    }

                    protocoloModel!.etapaQuantizada!.add(etapa!);

                    showToast("Etapa adicionada com sucesso");

                    Get.back();
                  } else {
                    etapa!.descricao = _descricao.text;
                    etapa!.tipo = tipo;

                    if (tipo == 'massa') {
                      etapa!.g_massa = _g_massa.text;
                      etapa!.eq_massa = _eq_massa.text;

                      etapa!.mol_volume = '';
                      etapa!.eq_volume = '';
                    } else {
                      etapa!.g_massa = '';
                      etapa!.eq_massa = '';

                      etapa!.mol_volume = _ul_volume.text;
                      etapa!.eq_volume = _eq_volume.text;
                    }

                    protocoloModel!.etapaQuantizada!.remove(etapa);
                    protocoloModel!.etapaQuantizada!.add(etapa!);

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

