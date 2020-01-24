class PrefeitoModel {
  String id;
  String titulo;
  String descricao;
  String imagem;

  PrefeitoModel({this.id, this.titulo, this.descricao, this.imagem});

  factory PrefeitoModel.fromJson(Map<String, dynamic> json) {
    return PrefeitoModel(
        id: json["id"],
        titulo: json["titulo"],
        descricao: json["descricao"],
        imagem: json["imagem_prefeito"]);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'titulo': titulo,
        'descricao': descricao,
        'imagem_prefeito': imagem
      };
}
