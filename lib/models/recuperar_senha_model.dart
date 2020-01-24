class RecuperarSenha {
  String id;
  String email;
  String mensagem;

  RecuperarSenha({this.id, this.email, this.mensagem});

  RecuperarSenha.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    mensagem = json['mensagem'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['email'] = this.email;
    data['mensagem'] = this.mensagem;
    return data;
  }
}
