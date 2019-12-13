class UserModel {
  String id;
  String nome;
  String email;
  String telefone;
  String endereco;
  String numero;
  String bairro;
  String complemento;
  String cidadeId;
  String cidade;
  String estado;

  UserModel(
      {this.id,
      this.nome,
      this.email,
      this.telefone,
      this.endereco,
      this.numero,
      this.bairro,
      this.complemento,
      this.cidadeId,
      this.cidade,
      this.estado});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"],
        nome: json["nome"],
        email: json["email"],
        telefone: json["telefone"],
        endereco: json["endereco"],
        numero: json["numero"],
        bairro: json["bairro"],
        complemento: json["complemento"],
        cidadeId: json["cidade_id"],
        cidade: json["cidade"],
        estado: json["estado"]);
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'nome': nome,
        'email': email,
        'telefone': telefone,
        'endereco': endereco,
        'numero': numero,
        'bairro': bairro,
        'complemento': complemento,
        'cidade_id': cidadeId,
        'cidade': cidade,
        'estado': estado
      };
}
