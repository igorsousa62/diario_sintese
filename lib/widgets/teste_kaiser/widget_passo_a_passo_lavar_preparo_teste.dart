import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/preparo_sintese_controller.dart';
import 'package:meu_diario_de_sintese/pages/page_cronometro.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/check_box_option.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';

class WidgetPassoAPassoPreparoTeste extends StatefulWidget {
  const WidgetPassoAPassoPreparoTeste({Key? key}) : super(key: key);

  @override
  _WidgetPassoAPassoPreparoTesteState createState() =>
      _WidgetPassoAPassoPreparoTesteState();
}

class _WidgetPassoAPassoPreparoTesteState
    extends State<WidgetPassoAPassoPreparoTeste> {
  final PreparoSinteseController _controller =
      Get.put(PreparoSinteseController());

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppTheme.colorBackgroudDialog,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20.0))),
      title: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(
                color: AppTheme.colorAppBar,
                borderRadius: BorderRadius.circular(15)),
            height: 280,
            child: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Column(
                children: [
                  Row(
                    children: const [
                      Text("Preparo do Teste:",
                          style: TextStyle(color: Colors.white, fontSize: 25))
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CheckBoxOption(
                    text: "Separe grãos de resina",
                    onTap: () {
                      _controller.preparoSinteseModel!.separarGraosResina =
                          !_controller.preparoSinteseModel!.separarGraosResina!;
                      setState(() {});
                    },
                    check: _controller.preparoSinteseModel!.separarGraosResina,
                  ),
                  CheckBoxOption(
                    text: "Adicione sinidrina",
                    onTap: () {
                      _controller.preparoSinteseModel!.adicionarSinidrina =
                          !_controller.preparoSinteseModel!.adicionarSinidrina!;
                      setState(() {});
                    },
                    check: _controller.preparoSinteseModel!.adicionarSinidrina,
                  ),
                  const Text(
                    "5% em etanol m/v, duas gotas)",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  CheckBoxOption(
                    text: "Adicione fenol",
                    onTap: () {
                      _controller.preparoSinteseModel!.adicionarFenol =
                          !_controller.preparoSinteseModel!.adicionarFenol!;
                      setState(() {});
                    },
                    check: _controller.preparoSinteseModel!.adicionarFenol,
                  ),
                  const Text(
                    "80% em etanol m/v, duas gotas)",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                  CheckBoxOption(
                    text: "Adicione KCN",
                    onTap: () {
                      _controller.preparoSinteseModel!.adicionarKCN =
                          !_controller.preparoSinteseModel!.adicionarKCN!;
                      setState(() {});
                    },
                    check: _controller.preparoSinteseModel!.adicionarKCN,
                  ),
                  const Text(
                    "2ml 0.0001M em 98ml de piridina, duas gotas)",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CheckBoxOption(
              text: "Não confirmar passo a passo",
              onTap: () {
                _controller.preparoSinteseModel!.pularEtapaTesteKaiser =
                    !_controller.preparoSinteseModel!.pularEtapaTesteKaiser!;
                setState(() {});
              },
              check: _controller.preparoSinteseModel!.pularEtapaTesteKaiser,
              textSize: 12),
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
              if ((_controller.preparoSinteseModel!.pularEtapaTesteKaiser!) ||
                  ((_controller.preparoSinteseModel!.separarGraosResina!) &&
                      (_controller.preparoSinteseModel!.adicionarSinidrina!) &&
                      (_controller.preparoSinteseModel!.adicionarFenol!) &&
                      (_controller.preparoSinteseModel!.adicionarKCN!))) {
                Get.back();

                /// Alterar o tempo
                Get.offAll(PageCronometro(
                  text: "Submeter a aquecimento de 120° C",
                  tempo: 10,
                  numeroRepeticoes: 0,
                  rotina: "TTK",
                ));
              } else {
                showToast("Necessário confirmar todas as etapas");
              }
            },
            child: const Text(
              "Avançar",
              style: TextStyle(color: Colors.white),
            ))
      ],
    );
  }
}
