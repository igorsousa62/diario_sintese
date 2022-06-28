import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/user_controller.dart';
import 'package:meu_diario_de_sintese/helpers/validators.dart';
import 'package:meu_diario_de_sintese/model/user_model.dart';
import 'package:meu_diario_de_sintese/pages/home_page.dart';
import 'package:meu_diario_de_sintese/pages/new_user.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/button_custon.dart';
import 'package:meu_diario_de_sintese/widgets/input_text_field_login.dart';
import 'package:meu_diario_de_sintese/widgets/label_text.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';

class Login extends StatelessWidget {

  UserModel user = UserModel();
  final UserLoginController _controller = UserLoginController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.colorAppBar,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20),
                height: MediaQuery.of(context).size.height * 0.45,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/appbar.png"),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: <Widget>[
                    Center(
                      child: GestureDetector(
                        onTap: () {
                        },
                        child: Container(),
                      ),
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.07),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: LabelText('E-mail:', true),
                      ),
                      InputTextFieldLogin(
                        hintText: "Seu E-mail",
                        obscureText: false,
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
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: LabelText('Senha:', true),
                      ),
                      InputTextFieldLogin(
                        hintText: "Sua Senha",
                        obscureText: true,
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
                      Align(
                        alignment: Alignment.centerRight,
                        child: InkWell(
                          onTap: () {},
                          child: const Text(
                            'Esqueceu sua Senha?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.01,
                      ),
                      Obx(
                        () => Center(
                          child: _controller.loading.value ? CircularProgressIndicator() : ButtonCuston(color: Colors.white,
                              colorText: AppTheme.colorAppBar,
                              text:  "Entrar", onTap: () {
                            _formKey.currentState!.save();
                            if (_formKey.currentState!.validate()) {
                              _controller.singIn(user: user, onSucess: (user) {
                                Get.offAll(HomePage());
                              }, onFail: (e) {
                                showToast(e);
                              });
                            }
                          }),
                        ),
                      ),
                      const SizedBox(height: 10,),
                      GestureDetector(
                        onTap: () {
                          Get.to(NewUser());
                        },
                        child: Container(
                          color: AppTheme.colorAppBar,
                          padding: EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.01),
                          height: 60,
                          child: const Center(
                            child: Text(
                              'Criar conta gratuitamente',
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
