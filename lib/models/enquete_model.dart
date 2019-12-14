class EnqueteModel {
  String id;
  String titulo;
  String enquete;
  String dataFinal;
  String qtdVotos;
  String vFavor;
  String vContra;

  EnqueteModel(
      {this.id,
      this.titulo,
      this.enquete,
      this.dataFinal,
      this.qtdVotos,
      this.vFavor,
      this.vContra});

  factory EnqueteModel.fromJson(Map<String, dynamic> json) {
    return EnqueteModel(
        id: json["id"],
        titulo: json["titulo"],
        enquete: json["enquete"],
        dataFinal: json["data_final"],
        qtdVotos: json["quant_votos"],
        vFavor: json["votos_afavor"],
        vContra: json["votos_contra"]);
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "titulo": titulo,
        "enquete": enquete,
        "data_final": dataFinal,
        "quant_votos": qtdVotos,
        "votos_afavor": vFavor,
        "votos_contra": vContra
      };
}
