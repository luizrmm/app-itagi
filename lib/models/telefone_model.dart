class TelefoneModel {
  String id;
  String descricao;
  String telefone;

  TelefoneModel({this.id, this.descricao, this.telefone});

  factory TelefoneModel.fromJson(Map<String, dynamic> json) {
    return TelefoneModel(
        id: json["id"],
        descricao: json["descricao"],
        telefone: json["telefone"]);
  }

  Map<String, dynamic> toJson() =>
      {'id': id, 'descricao': descricao, 'telefone': telefone};
}
