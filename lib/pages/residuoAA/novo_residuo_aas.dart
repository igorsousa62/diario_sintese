import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/residuo_aa_controller.dart';
import 'package:meu_diario_de_sintese/model/residuo_aa_model.dart';
import 'package:meu_diario_de_sintese/pages/home_page.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_title.dart';
import 'package:meu_diario_de_sintese/widgets/button_custon.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/container_circular.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/field_custon.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/label_field.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';

class NovoResiduoAA extends StatelessWidget {
  ResiduoAAModel? residuoAAModel;
  ResiduoAAController controller = ResiduoAAController();

  final TextEditingController _controllerNome = TextEditingController();
  final TextEditingController _controllerSigla = TextEditingController();
  final TextEditingController _controllerSimbolo = TextEditingController();
  final TextEditingController _controllerMassaMolarProtegida = TextEditingController();
  final TextEditingController _controllerMassaMolarDesprotegida = TextEditingController();
  final TextEditingController _controllerGrupoProtetor = TextEditingController();
  final TextEditingController _controllerDescricao = TextEditingController();

  NovoResiduoAA({this.residuoAAModel, Key? key}) : super(key: key) {
    if (residuoAAModel == null) {
      residuoAAModel = ResiduoAAModel();
    } else {
      _controllerNome.text = residuoAAModel!.nome!;
      _controllerSigla.text = residuoAAModel!.sigla!;
      _controllerSimbolo.text = residuoAAModel!.simbolo!;
      _controllerMassaMolarProtegida.text = residuoAAModel!.massaMolarProtegido!;
      _controllerMassaMolarDesprotegida.text = residuoAAModel!.massaMolarDesprotegido!;
      _controllerGrupoProtetor.text = residuoAAModel!.grupoProtetor!;
      _controllerDescricao.text = residuoAAModel!.descricao!;
    }
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.colorBackgroud,
        body: Form(
          key: _formKey,
          child: ListView(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: WidgetTitle(title: "Resíduo de aa"),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(right: 15, left: 15, bottom: 15),
                child: ContainerCircular(
                  widget: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LabelField(label: "Nome"),
                            const SizedBox(width: 10,),
                            FieldCuston(
                              textEditingController: _controllerNome,
                              largura: 250, onSaved: (value) {
                                residuoAAModel!.nome = value;
                            }, )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LabelField(label: "Sigla"),
                            const SizedBox(width: 10,),
                            FieldCuston(
                              textEditingController: _controllerSigla,
                              largura: 250, onSaved: (value) {
                                residuoAAModel!.sigla = value;
                            }, )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LabelField(label: "Símbolo"),
                            const SizedBox(width: 10,),
                            FieldCuston(
                              textEditingController: _controllerSimbolo,
                              largura: 250, onSaved: (value) {
                              residuoAAModel!.simbolo = value;
                            }, )
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LabelField(label: "Massa Molar (Protegida)"),
                            const SizedBox(width: 10,),
                            FieldCuston(
                              textEditingController: _controllerMassaMolarProtegida,
                              textInputType: TextInputType.number,
                              largura: 70, onSaved: (value) {
                              residuoAAModel!.massaMolarProtegido = value;
                            }, ),
                            const SizedBox(width: 10,),
                            const Text("g/mol", style: TextStyle(color: Colors.white),)
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            LabelField(label: "Massa Molar (Desprote.)"),
                            const SizedBox(width: 10,),
                            FieldCuston(
                              textEditingController: _controllerMassaMolarDesprotegida,
                              textInputType: TextInputType.number,
                              largura: 70, onSaved: (value) {
                              residuoAAModel!.massaMolarDesprotegido = value;
                            }, ),
                            const SizedBox(width: 10,),
                            const Text("g/mol", style: TextStyle(color: Colors.white),)
                          ],
                        ),
                        const SizedBox(height: 30,),
                        Row(
                          children: [
                            LabelField(label: "Grupo protetor"),
                          ],
                        ),
                        const SizedBox(height: 10,),
                        Row(
                          children: [
                            FieldCuston(
                              textEditingController: _controllerGrupoProtetor,
                              largura: 350, onSaved: (value) {
                              residuoAAModel!.grupoProtetor = value;
                            }, ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ),
              const SizedBox(height: 10,),
              Row(
                children: [
                  const SizedBox(width: 15,),
                  SizedBox(
                    child: ButtonCuston(
                      text: "Adicionar Descrição",
                      onTap: () {
                        showDialog(context: context, builder: (context) {
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
                                    residuoAAModel!.descricao = _controllerDescricao.text;
                                  },
                                  child: const Text(
                                    "OK",
                                    style: TextStyle(color: Colors.white),
                                  ))
                            ],
                          );
                        });
                      },),
                  )
                ],
              ),
              const SizedBox(height: 10,),
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
                        },),
                    ),
                    SizedBox(
                      child: ButtonCuston(
                        text: "Salvar",
                        onTap: () {
                          _formKey.currentState!.save();

                          if (residuoAAModel!.nome == '') {
                            showToast("Informe o nome");
                          } else if (residuoAAModel!.sigla == '') {
                            showToast("Informe a sigla");
                          } else if (residuoAAModel!.simbolo == '') {
                            showToast("Informe a símbolo");
                          } else if (residuoAAModel!.massaMolarProtegido == '') {
                            showToast("Informe a massa molar protegida");
                          } else if (residuoAAModel!.massaMolarDesprotegido == '') {
                            showToast("Informe a massa molar desprotegida");
                          } else if (residuoAAModel!.grupoProtetor == '') {
                            showToast("Informe o grupo protetor");
                          } else if ((residuoAAModel!.descricao == '') ||
                              (residuoAAModel!.descricao == null)) {
                            showToast("Informe a deacrição");
                          } else {
                            controller.saveResiduoAA(
                                ResiduoAA: residuoAAModel,
                                onSucess: () {
                                  showToast("Resíduo AA salvo com sucesso");
                                  Get.offAll(HomePage());
                                },
                                onFail: () {
                                  showToast("Falha ao salvar resina");
                                });
                          }
                        },),
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

