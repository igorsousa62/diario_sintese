import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/protocolo_model.dart';
import 'package:meu_diario_de_sintese/pages/home_page.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/etapa_adicao_quantizada.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/etapa_verificacao_simples.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_app_bar.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_title.dart';
import 'package:meu_diario_de_sintese/widgets/itens/item_etapa_verificacao.dart';

import '../../widgets/toast_message.dart';

class ListEtapaVerificacao extends StatefulWidget {
  ListEtapaVerificacao({Key? key, this.protocoloModel}) : super(key: key);

  ProtocoloModel? protocoloModel;

  @override
  _ListEtapaVerificacaoState createState() => _ListEtapaVerificacaoState();
}

class _ListEtapaVerificacaoState extends State<ListEtapaVerificacao> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.colorBackgroud,
        body: ListView(
          children: <Widget>[
            const WidgetAppBar(),
            Center(child: WidgetTitle(title: "Etapa Verificação Simples")),
            const SizedBox(
              height: 20,
            ),
            ListView.builder(
                itemCount: widget.protocoloModel!.etapaVerificacaoSimples!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return ItemEtapaVerificacao(
                      onTapEdit: () {
                        Get.to(EtapaVerificacaoSimples(etapa: widget.protocoloModel!.etapaVerificacaoSimples![i], protocoloModel: widget.protocoloModel));
                      },
                      onTapDelete: () {
                        widget.protocoloModel!.etapaVerificacaoSimples!.remove(widget.protocoloModel!.etapaVerificacaoSimples![i]);
                        showToast("Etapa removida com sucesso");
                        Get.back();
                        setState(() {

                        });
                      },
                      etapa: widget.protocoloModel!.etapaVerificacaoSimples![i], protocoloModel: widget.protocoloModel);
                })
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Get.offAll(HomePage());
                },
                child: Container(
                    height: 50,
                    width: 200,
                    decoration: const BoxDecoration(
                      color: AppTheme.colorAppBar,
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                    child: const Center(
                        child: Text(
                          "Voltar a tela inicial",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ))),
              ),
              Container(
                  height: 50,
                  width: 50,
                  decoration: const BoxDecoration(
                    color: AppTheme.colorAppBar,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                  child: const Center(
                      child: Icon(
                        Icons.info_rounded,
                        size: 50,
                        color: Colors.white,
                      ))),
            ],
          ),
        ),
      ),
    );
  }
}

