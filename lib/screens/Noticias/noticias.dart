import 'package:aqui_cliente/models/noticia_model.dart';
import 'package:aqui_cliente/notifiers/noticia_notifier.dart';
import 'package:aqui_cliente/repository/noticias_repository.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:share/share.dart';
import 'custom_icons.dart';
import 'noticias_detail.dart';

class NoticiasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text('Notícias'),
        centerTitle: true,
      ),
      body: ChangeNotifierProvider(
        create: (context) => NoticiaNotifier(
          NoticiasRepository(),
        ),
        child: Consumer<NoticiaNotifier>(
          builder: (context, noticiaModel, child) {
            Map<String, dynamic> form = Map();

            if (noticiaModel.noticias.isNotEmpty) {
              int qtd = noticiaModel.noticias.length;
              return Container(
                padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                child: RefreshIndicator(
                  onRefresh: () {
                    var data = noticiaModel.getNoticias();
                    return data;
                  },
                  child: ListView.builder(
                    itemCount: qtd,
                    itemBuilder: (BuildContext context, int index) {
                      NoticiaModel value = noticiaModel.noticias[index];

                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NoticiaDetail(
                                noticia: noticiaModel.noticias[index].noticia,
                                imagens: noticiaModel.noticias[index].carousel,
                                title: 'Detalhes',
                              ),
                            ),
                          );
                        },
                        child: Card(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16.0)),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(10.0),
                                  child: value.imagem == null
                                      ? Text('Imagem indisponível')
                                      : Image.network(
                                          value.imagem,
                                          height: 200,
                                          fit: BoxFit.cover,
                                        ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, bottom: 12.0),
                                  child: Text(
                                    value.titulo,
                                    style: TextStyle(
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Text(value.resumo),
                                Padding(
                                  padding: EdgeInsets.only(top: 20),
                                  child: Row(
                                    children: <Widget>[
                                      Badge(
                                        position: BadgePosition.topRight(
                                            right: 0, top: 0),
                                        badgeContent: Text(
                                          value.likes,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        child: IconButton(
                                          onPressed: () async {
                                            if (value.curtiu == "0") {
                                              form = {
                                                "curtir": "1",
                                                "descurtir": "0",
                                                "noticia_id": value.id
                                              };
                                            } else {
                                              form = {
                                                "curtir": "0",
                                                "descurtir": "0",
                                                "noticia_id": value.id
                                              };
                                            }
                                            await noticiaModel.curtir(form);
                                            if (!noticiaModel.success) {
                                              Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(noticiaModel
                                                      .errorMessage),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );
                                            }
                                          },
                                          icon: Icon(
                                            value.curtiu == "0"
                                                ? CustomIcons.thumbs_up
                                                : CustomIcons.thumbs_up_alt,
                                            color: Colors.blue,
                                          ),
                                        ),
                                      ),
                                      Badge(
                                        position: BadgePosition.topRight(
                                            right: 0, top: 0),
                                        badgeContent: Text(
                                          value.delikes,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12),
                                        ),
                                        child: IconButton(
                                          onPressed: () async {
                                            if (value.descurtiu == "0") {
                                              form = {
                                                "curtir": "0",
                                                "descurtir": "1",
                                                "noticia_id": value.id
                                              };
                                            } else {
                                              form = {
                                                "curtir": "0",
                                                "descurtir": "0",
                                                "noticia_id": value.id
                                              };
                                            }
                                            await noticiaModel.curtir(form);
                                            if (!noticiaModel.success) {
                                              Scaffold.of(context).showSnackBar(
                                                SnackBar(
                                                  content: Text(noticiaModel
                                                      .errorMessage),
                                                  backgroundColor: Colors.red,
                                                ),
                                              );
                                            }
                                          },
                                          icon: Icon(
                                            value.descurtiu == "0"
                                                ? CustomIcons.thumbs_down
                                                : CustomIcons.thumbs_down_alt,
                                            color: Colors.red,
                                          ),
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          Share.share(
                                              'check out my website https://example.com',
                                              subject: 'Look what I made!');
                                        },
                                        icon: Icon(
                                          CustomIcons.share,
                                          color: Theme.of(context).primaryColor,
                                        ),
                                      ),
                                      Expanded(
                                          child: Text(
                                        value.data,
                                        textAlign: TextAlign.end,
                                      ))
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              );
            } else if (noticiaModel.loading) {
              return Center(
                child: Loading(),
              );
            } else {
              return Text('Nenhuma atualização a ser exibida');
            }
          },
        ),
      ),
    );
  }
}
