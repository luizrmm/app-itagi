import 'dart:convert';
import 'dart:typed_data';

import 'package:aqui_cliente/notifiers/noticia_notifier.dart';
import 'package:aqui_cliente/screens/Noticias/noticias_detail.dart';
import 'package:badges/badges.dart';
import 'package:provider/provider.dart';

import './custom_icons.dart';
import 'package:flutter/material.dart';

class NewsCard extends StatelessWidget {
  final String id;
  final String data;
  final String titulo;
  final String resumo;
  final String imagem;
  final String noticia;
  final String curtiu;
  final String descurtiu;
  final String likes;
  final String deslikes;

  const NewsCard(
      {Key key,
      this.id,
      this.data,
      this.titulo,
      this.resumo,
      this.imagem,
      this.noticia,
      this.curtiu,
      this.descurtiu,
      this.likes,
      this.deslikes})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> form;
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => NoticiaDetail(
                      noticia: noticia,
                      title: 'Detalhes',
                    )));
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: imagem == null
                      ? Text('Imagem indisponível')
                      : Image.network(
                          imagem,
                          height: 200,
                          fit: BoxFit.cover,
                        )),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
                child: Text(
                  titulo,
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              Text(resumo),
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Row(
                  children: <Widget>[
                    Badge(
                      position: BadgePosition.topRight(right: 0, top: 0),
                      badgeContent: Text(
                        likes,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          if (curtiu == "0") {
                            form = {
                              "curtir": "1",
                              "descurtir": "0",
                              "noticia_id": id
                            };
                          } else {
                            form = {
                              "curtir": "0",
                              "descurtir": "0",
                              "noticia_id": id
                            };
                          }
                          await Provider.of<NoticiaNotifier>(context,
                                  listen: false)
                              .curtir(form);
                          if (!Provider.of<NoticiaNotifier>(context)
                              .requestSucces) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  Provider.of<NoticiaNotifier>(context)
                                      .errorMessage),
                              backgroundColor: Colors.red,
                            ));
                          }
                        },
                        icon: Icon(
                          curtiu == "0"
                              ? CustomIcons.thumbs_up
                              : CustomIcons.thumbs_up_alt,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    Badge(
                      position: BadgePosition.topRight(right: 0, top: 0),
                      badgeContent: Text(
                        deslikes,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      child: IconButton(
                        onPressed: () async {
                          if (descurtiu == "0") {
                            form = {
                              "curtir": "0",
                              "descurtir": "1",
                              "noticia_id": id
                            };
                          } else {
                            form = {
                              "curtir": "0",
                              "descurtir": "0",
                              "noticia_id": id
                            };
                          }
                          await Provider.of<NoticiaNotifier>(context,
                                  listen: false)
                              .curtir(form);
                          if (!Provider.of<NoticiaNotifier>(context)
                              .requestSucces) {
                            Scaffold.of(context).showSnackBar(SnackBar(
                              content: Text(
                                  Provider.of<NoticiaNotifier>(context)
                                      .errorMessage),
                              backgroundColor: Colors.red,
                            ));
                          }
                        },
                        icon: Icon(
                          descurtiu == "0"
                              ? CustomIcons.thumbs_down
                              : CustomIcons.thumbs_down_alt,
                          color: Colors.red,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(
                        CustomIcons.share,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    Expanded(
                        child: Text(
                      data,
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
  }
}
