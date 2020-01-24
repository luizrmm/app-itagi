class PopModel {
  String id;
  String nome;
  String popUp;
  String url;
  String dataCadastro;

  PopModel({this.id, this.nome, this.popUp, this.url, this.dataCadastro});

  PopModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    popUp = json['pop_up'];
    url = json['url'];
    dataCadastro = json['data_cadastro'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['pop_up'] = this.popUp;
    data['url'] = this.url;
    data['data_cadastro'] = this.dataCadastro;
    return data;
  }
}
