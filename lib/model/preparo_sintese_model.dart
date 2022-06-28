import 'package:cloud_firestore/cloud_firestore.dart';

class PreparoSinteseModel {

  String? id;

  //Inchar Resina
  bool? resinaPesada;
  bool? adicionadoDCM;
  bool? pularEtapa;
  String? anotacoesTempoIncharResina;

  //Lavar Resina
  bool? submeterVacuo;
  bool? adicionadoDCMouAFM;
  bool? pularEtapaLavarResina;
  String? anotacoesTempoLavarResina;

  //Desprotecao
  List<EtapaDesprotecao>? etapasDesprotecao = [];

  //Acoplamento
  List<EtapaAcoplamento>? etapasAcoplamento = [];

  //Clivagem
  List<EtapaClivagem>? etapasClivagem = [];

  //Teste Kaiser
  bool? separarGraosResina;
  bool? adicionarSinidrina;
  bool? adicionarFenol;
  bool? adicionarKCN;
  bool? pularEtapaTesteKaiser;
  String? anotacoesTempoTesteKaiser;

  PreparoSinteseModel({this.id, this.resinaPesada, this.adicionadoDCM, this.pularEtapa = false, this.anotacoesTempoIncharResina,
                       this.submeterVacuo = false, this.adicionadoDCMouAFM = false, this.pularEtapaLavarResina = false, this.anotacoesTempoLavarResina,
                       this.separarGraosResina = false, this.adicionarSinidrina = false, this.adicionarKCN = false,
                       this.adicionarFenol = false, this.pularEtapaTesteKaiser = false, this.anotacoesTempoTesteKaiser});


  DocumentReference get firestoreRef => FirebaseFirestore.instance.doc('sintese/$id/preparo');

  Future<void> saveData() async{
    DocumentReference docRef = FirebaseFirestore.instance.collection("sintese").doc(id).collection("preparo").doc();

    docRef.set(toMap());

    FirebaseFirestore.instance.collection("sintese").doc(id).collection("preparo").doc(docRef.id).set({
      "id": docRef.id,
      "resinaPesada": resinaPesada,
      "adicionadoDCM": adicionadoDCM,
      "pularEtapa": pularEtapa,
      "anotacoesTempoIncharResina": anotacoesTempoIncharResina,
      "submeterVacuo": submeterVacuo,
      "pularEtapaLavarResina": pularEtapaLavarResina,
      "adicionadoDCMouAFM": adicionadoDCMouAFM,
      "anotacoesTempoLavarResina": anotacoesTempoLavarResina,
      "etapasDesprotecao": etapasDesprotecao != null ? List<dynamic>.from(etapasDesprotecao!.map((x) => x.toMap())) : "",
      "etapasAcoplamento": etapasAcoplamento != null ? List<dynamic>.from(etapasAcoplamento!.map((x) => x.toMap())) : "",
      "etapasClivagem": etapasClivagem != null ? List<dynamic>.from(etapasClivagem!.map((x) => x.toMap())) : "",
      "separarGraosResina": separarGraosResina,
      "adicionarSinidrina": adicionarSinidrina,
      "adicionarFenol": adicionarFenol,
      "adicionarKCN": adicionarKCN,
      "pularEtapaTesteKaiser": pularEtapaTesteKaiser,
      "anotacoesTempoTesteKaiser": anotacoesTempoTesteKaiser
    });
  }

  Map<String, dynamic> toMap(){
    return {
      "resinaPesada": resinaPesada,
      "adicionadoDCM": adicionadoDCM,
      "pularEtapa": pularEtapa,
      "anotacoesTempoIncharResina": anotacoesTempoIncharResina,
      "submeterVacuo": submeterVacuo,
      "pularEtapaLavarResina": pularEtapaLavarResina,
      "adicionadoDCMouAFM": adicionadoDCMouAFM,
      "anotacoesTempoLavarResina": anotacoesTempoLavarResina,
      "etapasDesprotecao": etapasDesprotecao != null ? List<dynamic>.from(etapasDesprotecao!.map((x) => x.toMap())) : "",
      "etapasAcoplamento": etapasAcoplamento != null ? List<dynamic>.from(etapasAcoplamento!.map((x) => x.toMap())) : "",
      "etapasClivagem": etapasClivagem != null ? List<dynamic>.from(etapasClivagem!.map((x) => x.toMap())) : "",
      "separarGraosResina": separarGraosResina,
      "adicionarSinidrina": adicionarSinidrina,
      "adicionarFenol": adicionarFenol,
      "adicionarKCN": adicionarKCN,
      "pularEtapaTesteKaiser": pularEtapaTesteKaiser,
      "anotacoesTempoTesteKaiser": anotacoesTempoTesteKaiser
    };
  }

  PreparoSinteseModel.fromDocumentSnapshot({DocumentSnapshot? documentSnapshot}) {
    id = documentSnapshot!.id;
    resinaPesada = documentSnapshot!["resinaPesada"];
    adicionadoDCM = documentSnapshot!["adicionadoDCM"];
    anotacoesTempoIncharResina = documentSnapshot!["anotacoesTempoIncharResina"];
    submeterVacuo = documentSnapshot!["submeterVacuo"];
    pularEtapaLavarResina = documentSnapshot!["pularEtapaLavarResina"];
    adicionadoDCMouAFM = documentSnapshot!["adicionadoDCMouAFM"];
    anotacoesTempoLavarResina = documentSnapshot!["anotacoesTempoLavarResina"];
    separarGraosResina = documentSnapshot!["separarGraosResina"];
    adicionarSinidrina = documentSnapshot!["adicionarSinidrina"];
    adicionarFenol = documentSnapshot!["adicionarFenol"];
    adicionarKCN = documentSnapshot!["adicionarKCN"];
    pularEtapaTesteKaiser = documentSnapshot!["pularEtapaTesteKaiser"];
    anotacoesTempoTesteKaiser = documentSnapshot!["anotacoesTempoTesteKaiser"];

    if (documentSnapshot['etapasDesprotecao'] != "") {
      etapasDesprotecao = <EtapaDesprotecao>[];
      documentSnapshot['etapasDesprotecao'].forEach((v) {
        etapasDesprotecao!.add(
            EtapaDesprotecao.fromJson(v));
      });
    }

    if (documentSnapshot['etapasAcoplamento'] != "") {
      etapasAcoplamento = <EtapaAcoplamento>[];
      documentSnapshot['etapasAcoplamento'].forEach((v) {
        etapasAcoplamento!.add(
            EtapaAcoplamento.fromJson(v));
      });
    }

    if (documentSnapshot['etapasClivagem'] != "") {
      etapasClivagem = <EtapaClivagem>[];
      documentSnapshot['etapasClivagem'].forEach((v) {
        etapasClivagem!.add(
            EtapaClivagem.fromJson(v));
      });
    }
  }
}

class EtapaDesprotecao {
  String? descricao;
  String? tempo;
  String? tipo;
  bool? feito;
  DateTime? dataHora;

  EtapaDesprotecao({this.descricao, this.feito, this.dataHora, this.tipo});


  Map<String, dynamic> toMap(){
    return {
      'descricao': descricao,
      "tempo": tempo,
      "tipo": tipo,
      "feito": feito,
      "dataHora": dataHora,
    };
  }

  EtapaDesprotecao.fromJson(Map<String, dynamic> map) {
    descricao = map["descricao"];
    dataHora = map["dataHora"];
    tipo = map["tipo"];
    tempo = map["tempo"];
    feito = map["feito"];
  }
}

class EtapaClivagem {
  String? descricao;
  String? tempo;
  String? tipo;
  bool? feito;
  DateTime? dataHora;

  EtapaClivagem({this.descricao, this.feito, this.dataHora, this.tipo});

  Map<String, dynamic> toMap(){
    return {
      'descricao': descricao,
      "tempo": tempo,
      "tipo": tipo,
      "feito": feito,
      "dataHora": dataHora,
    };
  }

  EtapaClivagem.fromJson(Map<String, dynamic> map) {
    descricao = map["descricao"];
    dataHora = map["dataHora"];
    tipo = map["tipo"];
    tempo = map["tempo"];
    feito = map["feito"];
  }
}

class EtapaAcoplamento {
  String? descricao;
  String? tempo;
  String? tipo;
  bool? feito;
  DateTime? dataHora;

  EtapaAcoplamento({this.descricao, this.feito, this.dataHora, this.tipo});

  Map<String, dynamic> toMap(){
    return {
      'descricao': descricao,
      "tempo": tempo,
      "tipo": tipo,
      "feito": feito,
      "dataHora": dataHora,
    };
  }

  EtapaAcoplamento.fromJson(Map<String, dynamic> map) {
    descricao = map["descricao"];
    dataHora = map["dataHora"];
    tipo = map["tipo"];
    tempo = map["tempo"];
    feito = map["feito"];
  }
}