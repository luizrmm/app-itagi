import 'package:aqui_cliente/models/telefone_model.dart';

class PontosInteresseModel {
  String id;
  String secretaria;
  List<TelefoneModel> telefones;

  PontosInteresseModel({this.id, this.secretaria, this.telefones});

  factory PontosInteresseModel.fromJson(Map<String, dynamic> json) {
    var list = json['telefones'] as List;
    List<TelefoneModel> telefones =
        list.map((i) => TelefoneModel.fromJson(i)).toList();
    return PontosInteresseModel(
        id: json['id'], secretaria: json['secretaria'], telefones: telefones);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'secretaria': secretaria, 'telefones': telefones};
}
