import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/protocolo_controller.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/protocolo_model.dart';
import 'package:meu_diario_de_sintese/pages/home_page.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/etapa_adicao_quantizada.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/etapa_adicao_quantizada_clivagem.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/etapa_cronometrada.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/etapa_verificacao_simples.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/list_etapa_cronometrada.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/list_etapa_quantizada.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/list_etapa_verificacao.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_title.dart';
import 'package:meu_diario_de_sintese/widgets/button_custon.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/container_circular.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/field_custon.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/label_field.dart';
import 'package:meu_diario_de_sintese/widgets/icon_add.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';

class NovoProtocolo extends StatelessWidget {
  NovoProtocolo({Key? key, required this.tipo, this.protocoloModel})
      : super(key: key) {
    if (protocoloModel == null) {
      protocoloModel = ProtocoloModel();
    } else {
      _controllerNome.text = protocoloModel!.nome!;
      _controllerDescricao.text = protocoloModel!.descricao!;
    }
  }

  String? tipo;

  ProtocoloModel? protocoloModel;
  ProtocoloController controller = ProtocoloController();

  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerDescricao = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: WidgetTitle(
            title: "Protocolo " + tipo!,
          ),
          backgroundColor: AppTheme.colorBackgroud,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: AppTheme.colorBackgroud,
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
                child: ContainerCircular(
                  widget: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LabelField(
                              label: "Nome",
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            FieldCuston(
                              textEditingController: _controllerNome,
                              onSaved: (value) {
                                protocoloModel!.nome = value;
                              },
                              largura: 250,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        ListTile(
                          leading: GestureDetector(
                            onTap: () {
                              tipo == "Acoplamento" ? Get.to(EtapaAdicaoQuantizadaClivagem(
                                  protocoloModel: protocoloModel)) : Get.to(EtapaAdicaoQuantizada(
                                  protocoloModel: protocoloModel));
                            },
                            child: const IconAdd(),
                          ),
                          title:
                              LabelField(label: "Etapa de adição quantizada"),
                          trailing: GestureDetector(
                            onTap: () {
                              if (tipo == "Acoplamento") {
                                if ((protocoloModel!.etapaQuantizadaClivagem == null) || (protocoloModel!.etapaQuantizadaClivagem!.isEmpty)) {
                                  showToast(
                                      "Nenhuma etapa quantizada cadastrada");
                                } else {
                                  Get.to(ListEtapaQuantizada(
                                    protocoloModel: protocoloModel,
                                    tipo: "Acoplamento",
                                  ));
                                }
                              } else {
                                if ((protocoloModel!.etapaQuantizada == null) || (protocoloModel!.etapaQuantizada!.isEmpty)) {
                                  showToast(
                                      "Nenhuma etapa quantizada cadastrada");
                                } else {
                                  Get.to(ListEtapaQuantizada(
                                    protocoloModel: protocoloModel,
                                    tipo: "",
                                  ));
                                }
                              }
                            },
                            child: const Icon(Icons.arrow_forward,
                                color: Colors.white),
                          ),
                        ),
                        ListTile(
                          leading: GestureDetector(
                            onTap: () {
                              Get.to(EtapaVerificacaoSimples(
                                protocoloModel: protocoloModel,
                              ));
                            },
                            child: const IconAdd(),
                          ),
                          title:
                              LabelField(label: "Etapa de verificação simples"),
                          trailing: GestureDetector(
                            onTap: () {
                              if ((protocoloModel!.etapaVerificacaoSimples ==
                                  null) || (protocoloModel!.etapaVerificacaoSimples!.isEmpty)) {
                                showToast(
                                    "Nenhuma etapa de verificação cadastrada");
                              } else {
                                Get.to(ListEtapaVerificacao(
                                  protocoloModel: protocoloModel,
                                ));
                              }
                            },
                            child: const Icon(Icons.arrow_forward,
                                color: Colors.white),
                          ),
                        ),
                        ListTile(
                          leading: GestureDetector(
                            onTap: () {
                              Get.to(EtapaCronometrada(
                                protocoloModel: protocoloModel,
                              ));
                            },
                            child: const IconAdd(),
                          ),
                          title: LabelField(label: "Etapa cronometrada"),
                          trailing: GestureDetector(
                            onTap: () {
                              if ((protocoloModel!.etapaCronometrada == null) || (protocoloModel!.etapaCronometrada!.isEmpty)) {
                                showToast(
                                    "Nenhuma etapa cronometrada cadastrada");
                              } else {
                                Get.to(ListEtapaCronometrada(
                                  protocoloModel: protocoloModel,
                                ));
                              }
                            },
                            child: const Icon(Icons.arrow_forward,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 15,
                  ),
                  SizedBox(
                    child: ButtonCuston(
                      text: "Editar descrição",
                      onTap: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                backgroundColor: AppTheme.colorBackgroudDialog,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(20.0))),
                                title: Column(
                                  children: [
                                    WidgetTitle(title: "Descrição do protoc."),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 200,
                                      child: FieldCuston(
                                        textEditingController:
                                            _controllerDescricao,
                                        linhas: 10,
                                        onSaved: (value) {},
                                        onValidade: (value) {},
                                      ),
                                    )
                                  ],
                                ),
                                actions: <Widget>[
                                  FlatButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: const Text(
                                        "Cancelar",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  FlatButton(
                                      onPressed: () {
                                        Get.back();
                                        protocoloModel!.descricao =
                                            _controllerDescricao.text;
                                      },
                                      child: const Text(
                                        "OK",
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              );
                            });
                      },
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      child: ButtonCuston(
                        text: "Cancelar",
                        onTap: () {
                          Get.off(HomePage());
                        },
                      ),
                    ),
                    SizedBox(
                      child: ButtonCuston(
                        text: "Salvar",
                        onTap: () {
                          _formKey.currentState!.save();

                          if (protocoloModel!.nome == '') {
                            showToast("Informe o nome");
                          } else if ((protocoloModel!.descricao == '') ||
                              (protocoloModel!.descricao == null)) {
                            showToast("Informe a deacrição");
                          } else {
                            protocoloModel!.tipo = tipo;
                            controller.saveProtocolo(
                                protocolo: protocoloModel,
                                onSucess: () {
                                  showToast("Protocolo salvo com sucesso");
                                  Get.offAll(HomePage());
                                },
                                onFail: () {
                                  showToast("Falha ao salvar protocolo");
                                });
                          }
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
