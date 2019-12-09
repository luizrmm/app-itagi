class PrefeitoModel {
  String id;
  String titulo;
  String descricao;

  PrefeitoModel({this.id, this.titulo, this.descricao});

  factory PrefeitoModel.fromJson(Map<String, dynamic> json) {
    return PrefeitoModel(
        id: json["id"], titulo: json["titulo"], descricao: json["descricao"]);
  }
  Map<String, dynamic> toJson() =>
      {'id': id, 'titulo': titulo, 'descricao': descricao};
}
