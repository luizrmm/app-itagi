class CidadeModel {
  String id;
  String nome;
  CidadeModel({this.id, this.nome});
  factory CidadeModel.fromJson(Map<String, dynamic> json) {
    return CidadeModel(id: json["id"], nome: json["cidade"]);
  }

  Map<String, dynamic> toJson() => {'id': id, 'cidade': nome};
}
