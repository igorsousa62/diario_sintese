import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/user_controller.dart';
import 'package:meu_diario_de_sintese/helpers/validators.dart';
import 'package:meu_diario_de_sintese/model/user_model.dart';
import 'package:meu_diario_de_sintese/pages/home_page.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/button_custon.dart';
import 'package:meu_diario_de_sintese/widgets/check_box_option.dart';
import 'package:meu_diario_de_sintese/widgets/text_form_field_custon.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';

class NewUser extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  UserModel user = UserModel();
  String _confirmPass = '';
  final UserLoginController _controller = Get.put(UserLoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Material(
          child: Scaffold(
              backgroundColor: AppTheme.colorAppBar,
              appBar: AppBar(
                elevation: 0,
                title: const Text("Novo Usuário"),
                backgroundColor: AppTheme.colorAppBar,
                centerTitle: true,
              ),
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Form(
                  key: _formKey,
                  child: ListView(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.03,
                      ),
                      TextFormFieldCuston(
                        text: 'Seu nome',
                        textAlign: TextAlign.left,
                        hint: "João da Silva",
                        onSaved: (value) {
                          user.name = value;
                        },
                        onValidate: (value) {
                          if (value!.isEmpty || value == null) {
                            return "Informe o nome";
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TextFormFieldCuston(
                        text: 'Seu e-mail',
                        textAlign: TextAlign.left,
                        hint: "email@gmail.com",
                        onSaved: (value) {
                          user.email = value;
                        },
                        onValidate: (value) {
                          if (value!.isEmpty || value == null) {
                            return "Informe o email";
                          } else if (!Validators().emailValid(value)) {
                            return "O email informado é inválido";
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TextFormFieldCuston(
                        text: "Sua senha",
                        textAlign: TextAlign.left,
                        hint: "Mínimo 6 caracteres",
                        isPassword: true,
                        onSaved: (value) {
                          user.pass = value;
                        },
                        onValidate: (value) {
                          if (value!.isEmpty || value == null) {
                            return "Informe a senha";
                          } else if (value.length < 6) {
                            return "A senha precisa ter no mínimo 6 caracteres";
                          }
                        },
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      TextFormFieldCuston(
                        text: "Confirmar senha",
                        textAlign: TextAlign.left,
                        isPassword: true,
                        onSaved: (value) {
                          _confirmPass = value!;
                        },
                        onValidate: (value) {
                          if (value!.isEmpty || value == null) {
                            return "Confirme a senha";
                          } else if (value.length < 6) {
                            return "A senha precisa ter no mínimo 6 caracteres";
                          }
                        },
                      ),
                      CheckBoxOption(text: "É professor?", check: false, onTap: () {
                      },),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      const SizedBox(height: 20,),
                      Obx(
                          () => _controller.loading.value ? const Center(
                            child: CircularProgressIndicator(),
                          ) : ButtonCuston(
                              text: "Cadastrar",
                              color: Colors.white,
                              colorText: AppTheme.colorAppBar,
                              onTap: () {
                                _formKey.currentState!.save();
                                if (_formKey.currentState!.validate()) {
                                  if (user.pass != _confirmPass) {
                                    showToast("Senha e Confirmar senha estão diferentes");
                                  } else {
                                    _controller.singUp(user: user,
                                        onSucess: (user) {
                                          showToast("Conta criada com sucesso");
                                          Get.offAll(HomePage());
                                        },
                                        onFail: (e) {
                                          showToast(e);
                                        });
                                  }
                                }
                              })
                      )
                    ],
                  ),
                ),
              ))),
    );
  }
}
