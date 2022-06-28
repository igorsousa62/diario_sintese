import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/model/protocolo_model/protocolo_model.dart';
import 'package:meu_diario_de_sintese/pages/home_page.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/etapa_adicao_quantizada.dart';
import 'package:meu_diario_de_sintese/pages/protocolo/etapa_adicao_quantizada_clivagem.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_app_bar.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_title.dart';
import 'package:meu_diario_de_sintese/widgets/itens/item_etapa_quantizada.dart';
import 'package:meu_diario_de_sintese/widgets/itens/item_etapa_quantizada_clivagem.dart';

import '../../widgets/toast_message.dart';

class ListEtapaQuantizada extends StatefulWidget {
  ListEtapaQuantizada({Key? key, this.protocoloModel, this.tipo}) : super(key: key);

  ProtocoloModel? protocoloModel;
  String? tipo = '';

  @override
  _ListEtapaQuantizadaState createState() => _ListEtapaQuantizadaState(tipo);
}

class _ListEtapaQuantizadaState extends State<ListEtapaQuantizada> {

  String? tipo;

  _ListEtapaQuantizadaState(this.tipo);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppTheme.colorBackgroud,
        body: ListView(
          children: <Widget>[
            const WidgetAppBar(),
            Center(child: WidgetTitle(title: "Etapa Quantizada")),
            const SizedBox(
              height: 20,
            ),
            tipo == "Acoplamento" ? ListView.builder(
                itemCount: widget.protocoloModel!.etapaQuantizadaClivagem!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return ItemEtapaQuantizadaClivagem(
                    onTapEdit: () {
                      Get.to(EtapaAdicaoQuantizadaClivagem(protocoloModel: widget.protocoloModel, etapa: widget.protocoloModel!.etapaQuantizadaClivagem![i]));
                    },
                    onTapDelete: () {
                      widget.protocoloModel!.etapaQuantizadaClivagem!.remove(widget.protocoloModel!.etapaQuantizadaClivagem![i]);
                      showToast("Etapa removida com sucesso");
                      Get.back();
                      setState(() {

                      });
                    },
                    etapa: widget.protocoloModel!.etapaQuantizadaClivagem![i],
                    protocoloModel: widget.protocoloModel,
                  );
                }) : ListView.builder(
                itemCount: widget.protocoloModel!.etapaQuantizada!.length,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, i) {
                  return ItemEtapaQuantizada(
                    onTapEdit: () {
                      Get.to(EtapaAdicaoQuantizada(protocoloModel: widget.protocoloModel, etapa: widget.protocoloModel!.etapaQuantizada![i]));
                    },
                    onTapDelete: () {
                      widget.protocoloModel!.etapaQuantizada!.remove(widget.protocoloModel!.etapaQuantizada![i]);
                      showToast("Etapa removida com sucesso");
                      Get.back();
                      setState(() {

                      });
                    },
                    etapa: widget.protocoloModel!.etapaQuantizada![i],
                    protocoloModel: widget.protocoloModel,
                  );
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

