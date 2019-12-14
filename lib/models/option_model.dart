class OptionModel {
  String id;
  String titulo;
  OptionModel({this.id, this.titulo});
  factory OptionModel.fromJson(Map<String, dynamic> json) {
    return OptionModel(id: json["pesquisa_id"], titulo: json["titulo"]);
  }
}
