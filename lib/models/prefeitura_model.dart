class PrefeituraModel {
  String id;
  String titulo;
  String descricao;

  PrefeituraModel({this.id, this.titulo, this.descricao});

  factory PrefeituraModel.fromJson(Map<String, dynamic> json) {
    return PrefeituraModel(
        id: json["id"], titulo: json["titulo"], descricao: json["descricao"]);
  }
  Map<String, dynamic> toJson() =>
      {'id': id, 'titulo': titulo, 'descricao': descricao};
}
