import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/pages/home_page.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/button_custon.dart';

class WidgetFinishSintese extends StatelessWidget {
  WidgetFinishSintese({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.colorBackgroudDialog,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      title: Column(
        children: [
          const Center(
            child: Text("Sua síntese foi", style: TextStyle(fontSize: 25, color: Colors.white)),
          ),
          const Center(
              child: Text("finalizada", style: TextStyle(fontSize: 25, color: Colors.white)),
          ),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(color: AppTheme.colorBackgroud, borderRadius: BorderRadius.circular(15)),
            height: MediaQuery.of(context).size.height * 0.3,
            child: Center(
              child: Image.asset("assets/finish.PNG"),
            )
          ),
          const SizedBox(height: 10,),
          ButtonCuston(text: "Voltar a tela inicial", onTap: () {
            Get.offAll(HomePage());
          },)
        ],
      ),
    );
  }
}
