import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/controller/preparo_sintese_controller.dart';
import 'package:meu_diario_de_sintese/helpers/timer.dart';
import 'package:meu_diario_de_sintese/theme/app_theme.dart';
import 'package:meu_diario_de_sintese/widgets/acoplamento/widget_acoplar.dart';
import 'package:meu_diario_de_sintese/widgets/app_bar/widget_app_bar.dart';
import 'package:meu_diario_de_sintese/widgets/button_custon.dart';
import 'package:meu_diario_de_sintese/widgets/cadastro/field_custon.dart';
import 'package:meu_diario_de_sintese/widgets/clivagem/widget_clivagem.dart';
import 'package:meu_diario_de_sintese/widgets/clivagem/widget_clivar.dart';
import 'package:meu_diario_de_sintese/widgets/desprotecao/widget_desprotecao.dart';
import 'package:meu_diario_de_sintese/widgets/preparar_resina/widget_passo_a_passo_lavar_resina.dart';
import 'package:meu_diario_de_sintese/widgets/teste_kaiser/widget_preparar_kaiser.dart';
import 'package:meu_diario_de_sintese/widgets/teste_kaiser/widget_presenca_grupo.dart';
import 'package:meu_diario_de_sintese/widgets/toast_message.dart';
import 'package:meu_diario_de_sintese/widgets/widget_finish_sintese.dart';
import 'package:stop_watch_timer/stop_watch_timer.dart';

class PageCronometro extends StatefulWidget {
  PageCronometro(
      {Key? key, this.text, this.tempo, this.numeroRepeticoes, this.rotina})
      : super(key: key);

  String? text;
  int? tempo;
  int? numeroRepeticoes;
  String? rotina;

  @override
  _State createState() => _State();
}

class _State extends State<PageCronometro> {
  bool timerHeating = true;
  bool timerActived = false;
  bool setStateExecute = false;
  final PreparoSinteseController _controllerPreparoSintese =
      Get.put(PreparoSinteseController());
  final TextEditingController _controllerAnotacao = TextEditingController();
  int etapa = 1;
  Timer? _timer;
  final StopWatchTimer _stopWatchTimer = StopWatchTimer(
    mode: StopWatchMode.countDown,
    presetMillisecond: StopWatchTimer.getMilliSecFromSecond(0),
    onChange: (value) {},
    onChangeRawSecond: (value) async {},
    onEnded: () async {},
  );

  @override
  void initState() {
    super.initState();
    _stopWatchTimer.setPresetSecondTime(widget.tempo!);
  }

  @override
  void dispose() async {
    super.dispose();
    await _stopWatchTimer.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.colorBackgroud,
      body: ListView(
        children: [
          const WidgetAppBar(),
          Center(
              child: Text(
            widget.text!,
            style: const TextStyle(fontSize: 25, color: Colors.white),
          )),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              height: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(500),
                  border: Border.all(color: Colors.white, width: 7)),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 0),
                      child: StreamBuilder<int>(
                        stream: _stopWatchTimer.rawTime,
                        initialData: _stopWatchTimer.rawTime.value,
                        builder: (context, snap) {
                          final value = snap.data;
                          final displayTime = StopWatchTimer.getDisplayTime(
                              value!,
                              hours: false);
                          return Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  displayTime,
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 40,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    GestureDetector(
                        onTap: () {
                          if (_stopWatchTimer.isRunning) {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.stop);
                          } else {
                            _stopWatchTimer.onExecute
                                .add(StopWatchExecute.start);
                          }

                          setState(() {});
                        },
                        child: Icon(
                          _stopWatchTimer.isRunning
                              ? Icons.pause
                              : Icons.play_arrow,
                          color: Colors.white,
                          size: 50,
                        ))
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Visibility(
              visible: widget.numeroRepeticoes != 0,
              child: Center(
                  child: Text(
                      "Etapa " +
                          etapa.toString() +
                          " de " +
                          widget.numeroRepeticoes.toString(),
                      style:
                          const TextStyle(fontSize: 25, color: Colors.white)))),
          const SizedBox(
            height: 20,
          ),
          Visibility(
            visible: widget.numeroRepeticoes != 0,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: ButtonCuston(
                text: "Repetir processo",
                onTap: () {
                  if (etapa == widget.numeroRepeticoes) {
                    showToast("Número máximo de etapas atingido");
                  } else {
                    setState(() {
                      _stopWatchTimer.setPresetSecondTime(0);
                      _stopWatchTimer.setPresetSecondTime(widget.tempo!);
                      _stopWatchTimer.onExecute.add(StopWatchExecute.start);
                      etapa++;
                    });
                  }
                },
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Visibility(
              visible: widget.rotina != "D" &&
                  widget.rotina != "A" &&
                  widget.rotina != "C",
              child: const Center(
                  child: Text("Anotações",
                      style: TextStyle(fontSize: 15, color: Colors.white)))),
          Visibility(
            visible: widget.rotina != "D" &&
                widget.rotina != "A" &&
                widget.rotina != "C",
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.white, width: 7)),
                child: FieldCuston(
                    linhas: 15, textEditingController: _controllerAnotacao),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: ButtonCuston(
                onTap: () {
                  if (widget.rotina == "TIR") {
                    _controllerPreparoSintese.preparoSinteseModel!
                        .anotacoesTempoIncharResina = _controllerAnotacao.text;

                    showDialog(
                        context: context,
                        builder: (context) {
                          return const WidgetPassoAPassoLavarResina();
                        });
                  }
                  else if (widget.rotina == "TLR") {
                    _controllerPreparoSintese.preparoSinteseModel!
                        .anotacoesTempoLavarResina = _controllerAnotacao.text;
                    showDialog(
                        context: context,
                        builder: (context) {
                          return WidgetDesprotecao();
                        });
                  }
                  else if (widget.rotina == "D") {
                    _controllerPreparoSintese.indexDesprotecao =
                        _controllerPreparoSintese.indexDesprotecao! + 1;

                    if (_controllerPreparoSintese.indexDesprotecao! >
                        _controllerPreparoSintese
                            .preparoSinteseModel!.etapasDesprotecao!.length) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return WidgetTesteKaiser();
                          });
                    }
                  }
                  else if (widget.rotina == "TTK") {
                    _controllerPreparoSintese.preparoSinteseModel!
                        .anotacoesTempoTesteKaiser = _controllerAnotacao.text;
                    showDialog(
                        context: context,
                        builder: (context) {
                          return WidgetPresencaGrupo(etapa: _controllerPreparoSintese.etapaAtual);
                        });
                  } else if (widget.rotina == "A") {

                    _controllerPreparoSintese.indexAcomplamento =
                        _controllerPreparoSintese.indexAcomplamento! + 1;

                    if (_controllerPreparoSintese.indexAcomplamento! >
                        _controllerPreparoSintese
                            .preparoSinteseModel!.etapasAcoplamento!.length) {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return WidgetTesteKaiser();
                          });
                    }

                    else if (_controllerPreparoSintese
                        .preparoSinteseModel!
                        .etapasAcoplamento![
                    _controllerPreparoSintese.indexAcomplamento!]
                        .tipo ==
                        "cronometrada") {
                      Get.offAll(PageCronometro(
                        text: _controllerPreparoSintese
                            .preparoSinteseModel!
                            .etapasAcoplamento![
                        _controllerPreparoSintese!.indexAcomplamento!]
                            .descricao,
                        numeroRepeticoes: 0,
                        tempo: int.parse(getStringToTime(
                            _controllerPreparoSintese
                                .preparoSinteseModel!
                                .etapasAcoplamento![_controllerPreparoSintese!
                                .indexAcomplamento!]
                                .tempo!)),
                        rotina: "A",
                      ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return WidgetAcoplar();
                          });
                    }
                  } else if (widget.rotina == "C") {

                    _controllerPreparoSintese.indexClivagem =
                        _controllerPreparoSintese.indexClivagem! + 1;

                    if (_controllerPreparoSintese.indexClivagem! >
                        _controllerPreparoSintese
                            .preparoSinteseModel!.etapasClivagem!.length) {

                      _controllerPreparoSintese.preparoSinteseModel!.saveData();

                      showDialog(
                          context: context,
                          builder: (context) {
                            return WidgetFinishSintese();
                          });
                    }

                    else if (_controllerPreparoSintese
                        .preparoSinteseModel!
                        .etapasClivagem![
                    _controllerPreparoSintese.indexClivagem!]
                        .tipo ==
                        "cronometrada") {
                      Get.offAll(PageCronometro(
                        text: _controllerPreparoSintese
                            .preparoSinteseModel!
                            .etapasClivagem![
                        _controllerPreparoSintese!.indexClivagem!]
                            .descricao,
                        numeroRepeticoes: 0,
                        tempo: int.parse(getStringToTime(
                            _controllerPreparoSintese
                                .preparoSinteseModel!
                                .etapasClivagem![_controllerPreparoSintese!
                                .indexClivagem!]
                                .tempo!)),
                        rotina: "C",
                      ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return const WidgetClivar();
                          });
                    }
                  }
                  else {
                    if (_controllerPreparoSintese
                            .preparoSinteseModel!
                            .etapasDesprotecao![
                                _controllerPreparoSintese.indexDesprotecao!]
                            .tipo ==
                        "cronometrada") {
                      Get.offAll(PageCronometro(
                        text: _controllerPreparoSintese
                            .preparoSinteseModel!
                            .etapasDesprotecao![
                                _controllerPreparoSintese!.indexDesprotecao!]
                            .descricao,
                        numeroRepeticoes: 0,
                        tempo: int.parse(getStringToTime(
                            _controllerPreparoSintese
                                .preparoSinteseModel!
                                .etapasDesprotecao![_controllerPreparoSintese!
                                    .indexDesprotecao!]
                                .tempo!)),
                        rotina: "D",
                      ));
                    } else {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return WidgetDesprotecao();
                          });
                    }
                  }
                },
                text: "Avançar"),
          ),
        ],
      ),
    );
  }
}
