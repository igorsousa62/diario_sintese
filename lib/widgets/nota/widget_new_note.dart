import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/sintese_controller.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/field_custon.dart';
import 'package:meu_diario_de_sintese/widgets/nota/widget_selected_sub.dart';

class WidgetNewNote extends StatelessWidget {
  WidgetNewNote({Key? key}) : super(key: key);

  final TextEditingController _nome = TextEditingController();
  final TextEditingController _sequencia = TextEditingController();
  final SinteseController _controller = Get.put(SinteseController());
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.colorBackgroudDialog,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))
      ),
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Nome:", style: TextStyle(fontSize: 25, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 10,),
          Container(
              padding: const EdgeInsets.all(3),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
              height: 60,
              child: FieldCuston(textEditingController: _nome, linhas: 1,)
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Sequencia:", style: TextStyle(fontSize: 25, color: Colors.white)),
              Text("(formato FASTA):", style: TextStyle(fontSize: 12, color: Colors.white)),
            ],
          ),
          const SizedBox(height: 10,),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
            height: 100,
            child: FieldCuston(textEditingController: _sequencia, linhas: 15,)
          )
        ],
      ),
      actions: <Widget>[
        FlatButton(
            onPressed: () {
              Get.back();
            },
            child: const Text("Cancelar", style: TextStyle(color: Colors.white),)),
        FlatButton(
            onPressed: () {
              Get.back();
              _controller.NovaSintese();
              _controller.sinteseModel!.nomePeptideo = _nome.text;
              _controller.sinteseModel!.sequenciaPeptideo = _sequencia.text;
              showDialog(
                  context: context,
                  builder: (context) {
                    return WidgetSelectedSub();
                  });
            },
            child: const Text("Próximo", style: TextStyle(color: Colors.white),))
      ],
    );
  }
}
