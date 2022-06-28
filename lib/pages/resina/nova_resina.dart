import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/resina_controller.dart';
import 'package:meu_diario_de_sintese/model/resina_model.dart';
import 'package:meu_diario_de_sintese/pages/home_page.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_title.dart';
import 'package:meu_diario_de_sintese/widgets/button_custon.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/container_circular.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/field_custon.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/label_field.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/label_field_legenda.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';

class NovaResina extends StatelessWidget {
  ResinaModel? resinaModel;
  ResinaController controller = ResinaController();

  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerGrau = TextEditingController();
  final TextEditingController _controllerDescricao = TextEditingController();

  NovaResina({this.resinaModel, Key? key}) : super(key: key) {
    if (resinaModel == null) {
      resinaModel = ResinaModel();
    } else {
      _controllerNome.text = resinaModel!.nome!;
      _controllerGrau.text = resinaModel!.grauSubstituicao!;
      _controllerDescricao.text = resinaModel!.descricao!;
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.colorBackgroud,
          elevation: 0,
          centerTitle: true,
          title: WidgetTitle(title: "Resina"),
        ),
        backgroundColor: AppTheme.colorBackgroud,
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                  padding:
                      const EdgeInsets.only(right: 15, left: 15, bottom: 15),
                  child: ContainerCircular(
                    widget: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              LabelField(label: "Nome"),
                              const SizedBox(
                                width: 10,
                              ),
                              FieldCuston(
                                textEditingController: _controllerNome,
                                largura: 270,
                                onSaved: (value) {
                                  resinaModel!.nome = value;
                                },
                                onValidade: (value) {},
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              LabelField(label: "Grau de Substituição"),
                              const SizedBox(
                                width: 10,
                              ),
                              FieldCuston(
                                  textEditingController: _controllerGrau,
                                  textInputType: TextInputType.number,
                                  largura: 70,
                                  onSaved: (value) {
                                    resinaModel!.grauSubstituicao = value;
                                  },
                                  onValidade: (value) {}),
                              const SizedBox(
                                width: 10,
                              ),
                              LabelFieldLegenda(
                                label: "mmol/g",
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )),
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
                      text: "Adicionar Descrição",
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
                                    WidgetTitle(title: "Descrição da resina"),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      height: 200,
                                      child: FieldCuston(
                                        linhas: 10,
                                        textEditingController: _controllerDescricao,
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
                                        resinaModel!.descricao = _controllerDescricao.text;
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
                          Get.back();
                        },
                      ),
                    ),
                    SizedBox(
                      child: ButtonCuston(
                        text: "Salvar",
                        onTap: () {
                          _formKey.currentState!.save();

                          if (resinaModel!.nome == '') {
                            showToast("Informe o nome");
                          } else if (resinaModel!.grauSubstituicao == '') {
                            showToast("Informe o grau de substituição");
                          } else if ((resinaModel!.descricao == '') ||
                              (resinaModel!.descricao == null)) {
                            showToast("Informe a deacrição");
                          } else {
                            controller.saveResina(
                                resina: resinaModel,
                                onSucess: () {
                                  showToast("Resina salva com sucesso");
                                  Get.offAll(HomePage());
                                },
                                onFail: () {
                                  showToast("Falha ao salvar resina");
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
