class NoticiaModel {
  String id;
  String data;
  String titulo;
  String resumo;
  String imagem;
  String noticia;
  String likes;
  String delikes;
  NoticiaModel(
      {this.id,
      this.data,
      this.titulo,
      this.resumo,
      this.noticia,
      this.likes,
      this.delikes,
      this.imagem});

  factory NoticiaModel.fromJson(Map<String, dynamic> json) {
    return NoticiaModel(
        id: json["id"],
        data: json["data_noticia"],
        titulo: json["titulo"],
        resumo: json["resumo"],
        imagem: json["imagem"],
        noticia: json["noticia"],
        likes: json["num_curtidas"],
        delikes: json["num_descurtidas"]);
  }
}
