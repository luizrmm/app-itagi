import 'dart:convert';
import 'dart:typed_data';

class NoticiaModel {
  String id;
  String data;
  String titulo;
  String resumo;
  String imagem;
  String noticia;
  String likes;
  String delikes;
  String descurtiu;
  String curtiu;
  NoticiaModel({
    this.id,
    this.data,
    this.titulo,
    this.resumo,
    this.noticia,
    this.likes,
    this.delikes,
    this.imagem,
    this.descurtiu,
    this.curtiu,
  });

  factory NoticiaModel.fromJson(Map<String, dynamic> json) {
    return NoticiaModel(
        id: json["id"],
        data: json["data_noticia"],
        titulo: json["titulo"],
        resumo: json["resumo"],
        imagem: json["imagem"].toString(),
        noticia: json["noticia"],
        likes: json["num_curtidas"],
        delikes: json["num_descurtidas"],
        curtiu: json["user_curtiu"],
        descurtiu: json["user_descurtiu"]);
  }
}
