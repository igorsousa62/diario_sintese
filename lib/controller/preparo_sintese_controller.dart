import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/model/preparo_sintese_model.dart';
import 'package:meu_diario_de_sintese/model/sintese_model.dart';

class PreparoSinteseController extends GetxController {
  SinteseModel? sinteseModel;
  PreparoSinteseModel? preparoSinteseModel;

  int? indexDesprotecao;
  int? indexAcomplamento;
  int? indexClivagem;

  String? etapaAtual;

  Rx<bool> residuoAASelected = false.obs;
  Rx<bool> resinaSelected = false.obs;


  double GetPesoResina() {
    return 10.0;
  }

  void NovoPreparoAcomplamento() {
    indexAcomplamento = 0;

    for (var item in sinteseModel!.acoplamento!.etapaQuantizadaClivagem!) {
      EtapaAcoplamento etapa = EtapaAcoplamento();

      if (etapa.descricao == "1") {
        etapa.descricao = "Pese e adicione " +
            item.desc_residuo! +
            " eq de resíduo";
      } else {
        etapa.descricao = item.descricao;

        if (item.tipo == 'massa') {
          etapa.descricao = etapa.descricao! +
              ' ' +
              item.g_massa! +
              ' g/mol ' +
              item.eq_massa! +
              ' eq';
        } else {
          etapa.descricao = etapa.descricao! +
              ' ' +
              item.mol_volume! +
              ' µl/mol ' +
              item.eq_volume! +
              ' eq';
        }
      }

      etapa.dataHora = item.dataReal;
      etapa.tipo = "quantizada";
      etapa.feito = false;

      preparoSinteseModel!.etapasAcoplamento!.add(etapa);
    }

    for (var item in sinteseModel!.acoplamento!.etapaQuantizada!) {
      EtapaAcoplamento etapa = EtapaAcoplamento();

      etapa.descricao = item.descricao;

      if (item.tipo == 'massa') {
        etapa.descricao = etapa.descricao! +
            ' ' +
            item.g_massa! +
            ' g/mol ' +
            item.eq_massa! +
            ' eq';
      } else {
        etapa.descricao = etapa.descricao! +
            ' ' +
            item.mol_volume! +
            ' µl/mol ' +
            item.eq_volume! +
            ' eq';
      }

      etapa.dataHora = item.dataReal;
      etapa.tipo = "quantizada";
      etapa.feito = false;

      preparoSinteseModel!.etapasAcoplamento!.add(etapa);
    }

    for (var item in sinteseModel!.acoplamento!.etapaVerificacaoSimples!) {
      EtapaAcoplamento etapa = EtapaAcoplamento();

      etapa.descricao = item.descricao;
      etapa.dataHora = item.dataReal;
      etapa.tipo = "simples";
      etapa.feito = false;

      preparoSinteseModel!.etapasAcoplamento!.add(etapa);
    }

    for (var item in sinteseModel!.acoplamento!.etapaCronometrada!) {
      EtapaAcoplamento etapa = EtapaAcoplamento();

      etapa.descricao = item.descricao!;
      etapa.tempo = item.tempo!;
      etapa.dataHora = item.dataReal;
      etapa.tipo = "cronometrada";
      etapa.feito = false;

      preparoSinteseModel!.etapasAcoplamento!.add(etapa);
    }


    preparoSinteseModel!.etapasDesprotecao!.sort((a, b) => a.dataHora!.compareTo(b!.dataHora!));
    preparoSinteseModel!.etapasAcoplamento!.sort((a, b) => a.dataHora!.compareTo(b!.dataHora!));
    preparoSinteseModel!.etapasClivagem!.sort((a, b) => a.dataHora!.compareTo(b!.dataHora!));
  }

  void NovoPreparo(SinteseModel? sinteseModel) {
    this.sinteseModel = sinteseModel;
    preparoSinteseModel = PreparoSinteseModel(adicionadoDCM: false, pularEtapa: false, resinaPesada: false);
    indexDesprotecao = 0;
    indexAcomplamento = 0;
    indexClivagem = 0;
    etapaAtual = '';

    residuoAASelected.value = false;
    resinaSelected.value = false;

    preparoSinteseModel!.id = sinteseModel!.id;

    for (var item in sinteseModel!.desprotecao!.etapaQuantizadaClivagem!) {
      EtapaDesprotecao etapa = EtapaDesprotecao();

      if (etapa.descricao == "1") {
        etapa.descricao = "Pese e adicione " +
            item.desc_residuo! +
            " eq de resíduo";
      } else {
        etapa.descricao = item.descricao;

        if (item.tipo == 'massa') {
          etapa.descricao = etapa.descricao! +
              ' ' +
              item.g_massa! +
              ' g/mol ' +
              item.eq_massa! +
              ' eq';
        } else {
          etapa.descricao = etapa.descricao! +
              ' ' +
              item.mol_volume! +
              ' µl/mol ' +
              item.eq_volume! +
              ' eq';
        }
      }

      etapa.dataHora = item.dataReal;
      etapa.tipo = "quantizada";
      etapa.feito = false;

      preparoSinteseModel!.etapasDesprotecao!.add(etapa);
    }

    for (var item in sinteseModel!.desprotecao!.etapaQuantizada!) {
      EtapaDesprotecao etapa = EtapaDesprotecao();

      etapa.descricao = item.descricao;

      if (item.tipo == 'massa') {
        etapa.descricao = etapa.descricao! +
            ' ' +
            item.g_massa! +
            ' g/mol ' +
            item.eq_massa! +
            ' eq';
      } else {
        etapa.descricao = etapa.descricao! +
            ' ' +
            item.mol_volume! +
            ' µl/mol ' +
            item.eq_volume! +
            ' eq';
      }

      etapa.dataHora = item.dataReal;
      etapa.tipo = "quantizada";
      etapa.feito = false;

      preparoSinteseModel!.etapasDesprotecao!.add(etapa);
    }

    for (var item in sinteseModel!.desprotecao!.etapaVerificacaoSimples!) {
      EtapaDesprotecao etapa = EtapaDesprotecao();

      etapa.descricao = item.descricao;
      etapa.dataHora = item.dataReal;
      etapa.tipo = "simples";
      etapa.feito = false;

      preparoSinteseModel!.etapasDesprotecao!.add(etapa);
    }

    for (var item in sinteseModel!.desprotecao!.etapaCronometrada!) {
      EtapaDesprotecao etapa = EtapaDesprotecao();

      etapa.descricao = item.descricao!;
      etapa.tempo = item.tempo!;
      etapa.dataHora = item.dataReal;
      etapa.tipo = "cronometrada";
      etapa.feito = false;

      preparoSinteseModel!.etapasDesprotecao!.add(etapa);
    }

    /* ---------------------------------------------------------- */

    for (var item in sinteseModel!.clivagem!.etapaQuantizadaClivagem!) {
      EtapaClivagem etapa = EtapaClivagem();

      if (item.tipo_quant == "1") {
        etapa.descricao = "Pese e adicione " +
            item.desc_residuo! +
            " eq de resíduo";
      } else {
        etapa.descricao = item.descricao;

        if (item.tipo == 'massa') {
          etapa.descricao = etapa.descricao! +
              ' ' +
              item.g_massa! +
              ' g/mol ' +
              item.eq_massa! +
              ' eq';
        } else {
          etapa.descricao = etapa.descricao! +
              ' ' +
              item.mol_volume! +
              ' µl/mol ' +
              item.eq_volume! +
              ' eq';
        }
      }

      etapa.dataHora = item.dataReal;
      etapa.tipo = "quantizada";
      etapa.feito = false;

      preparoSinteseModel!.etapasClivagem!.add(etapa);
    }

    for (var item in sinteseModel!.clivagem!.etapaQuantizada!) {
      EtapaClivagem etapa = EtapaClivagem();

      etapa.descricao = item.descricao;

      if (item.tipo == 'massa') {
        etapa.descricao = etapa.descricao! +
            ' ' +
            item.g_massa! +
            ' g/mol ' +
            item.eq_massa! +
            ' eq';
      } else {
        etapa.descricao = etapa.descricao! +
            ' ' +
            item.mol_volume! +
            ' µl/mol ' +
            item.eq_volume! +
            ' eq';
      }

      etapa.dataHora = item.dataReal;
      etapa.tipo = "quantizada";
      etapa.feito = false;

      preparoSinteseModel!.etapasClivagem!.add(etapa);
    }

    for (var item in sinteseModel!.clivagem!.etapaVerificacaoSimples!) {
      EtapaClivagem etapa = EtapaClivagem();

      etapa.descricao = item.descricao;
      etapa.dataHora = item.dataReal;
      etapa.tipo = "simples";
      etapa.feito = false;

      preparoSinteseModel!.etapasClivagem!.add(etapa);
    }

    for (var item in sinteseModel!.clivagem!.etapaCronometrada!) {
      EtapaClivagem etapa = EtapaClivagem();

      etapa.descricao = item.descricao!;
      etapa.tempo = item.tempo!;
      etapa.dataHora = item.dataReal;
      etapa.tipo = "cronometrada";
      etapa.feito = false;

      preparoSinteseModel!.etapasClivagem!.add(etapa);
    }

    /* -------------------------------------------------------------------------------- */

    for (var item in sinteseModel!.acoplamento!.etapaQuantizadaClivagem!) {
      EtapaAcoplamento etapa = EtapaAcoplamento();

      if (item.tipo_quant == "1") {
        etapa.descricao = "Pese e adicione " +
            item.desc_residuo! +
            " eq de resíduo";
      } else {
        etapa.descricao = item.descricao;

        if (item.tipo == 'massa') {
          etapa.descricao = etapa.descricao! +
              ' ' +
              item.g_massa! +
              ' g/mol ' +
              item.eq_massa! +
              ' eq';
        } else {
          etapa.descricao = etapa.descricao! +
              ' ' +
              item.mol_volume! +
              ' µl/mol ' +
              item.eq_volume! +
              ' eq';
        }
      }

      etapa.dataHora = item.dataReal;
      etapa.tipo = "quantizada";
      etapa.feito = false;

      preparoSinteseModel!.etapasAcoplamento!.add(etapa);
    }

    for (var item in sinteseModel!.acoplamento!.etapaQuantizada!) {
      EtapaAcoplamento etapa = EtapaAcoplamento();

      etapa.descricao = item.descricao;

      if (item.tipo == 'massa') {
        etapa.descricao = etapa.descricao! +
            ' ' +
            item.g_massa! +
            ' g/mol ' +
            item.eq_massa! +
            ' eq';
      } else {
        etapa.descricao = etapa.descricao! +
            ' ' +
            item.mol_volume! +
            ' µl/mol ' +
            item.eq_volume! +
            ' eq';
      }

      etapa.dataHora = item.dataReal;
      etapa.tipo = "quantizada";
      etapa.feito = false;

      preparoSinteseModel!.etapasAcoplamento!.add(etapa);
    }

    for (var item in sinteseModel!.acoplamento!.etapaVerificacaoSimples!) {
      EtapaAcoplamento etapa = EtapaAcoplamento();

      etapa.descricao = item.descricao;
      etapa.dataHora = item.dataReal;
      etapa.tipo = "simples";
      etapa.feito = false;

      preparoSinteseModel!.etapasAcoplamento!.add(etapa);
    }

    for (var item in sinteseModel!.acoplamento!.etapaCronometrada!) {
      EtapaAcoplamento etapa = EtapaAcoplamento();

      etapa.descricao = item.descricao!;
      etapa.tempo = item.tempo!;
      etapa.dataHora = item.dataReal;
      etapa.tipo = "cronometrada";
      etapa.feito = false;

      preparoSinteseModel!.etapasAcoplamento!.add(etapa);
    }


    preparoSinteseModel!.etapasDesprotecao!.sort((a, b) => a.dataHora!.compareTo(b!.dataHora!));
    preparoSinteseModel!.etapasAcoplamento!.sort((a, b) => a.dataHora!.compareTo(b!.dataHora!));
    preparoSinteseModel!.etapasClivagem!.sort((a, b) => a.dataHora!.compareTo(b!.dataHora!));
  }

  void setResiduoAASelected(bool value) {
    residuoAASelected.value = value;
    update();
  }

  void setResina(bool value) {
    resinaSelected.value = value;
    update();
  }
}