import 'dart:convert';
import 'dart:typed_data';

import 'package:aqui_cliente/notifiers/noticia_notifier.dart';
import 'package:aqui_cliente/screens/Noticias/noticias_detail.dart';
import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './custom_icons.dart';

class AgendaObras extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Agenda de Obras'),
          centerTitle: true,
        ),
        body: Consumer<NoticiaNotifier>(builder: (context, result, child) {
          Map<String, dynamic> form = Map();

          int qtd = result.noticias2.length;
          return Container(
              padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
              child: ListView.builder(
                itemCount: qtd,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => NoticiaDetail(
                                    noticia: result.noticias2[index].noticia,
                                    title: 'Detalhes',
                                  )));
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
                                child: Image.network(
                                  result.noticias2[index].imagem,
                                  height: 200,
                                  fit: BoxFit.cover,
                                )),
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 8.0, bottom: 12.0),
                              child: Text(
                                result.noticias2[index].titulo,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Text(result.noticias2[index].resumo),
                            Padding(
                              padding: EdgeInsets.only(top: 20),
                              child: Row(
                                children: <Widget>[
                                  Badge(
                                    position: BadgePosition.topRight(
                                        right: 0, top: 0),
                                    badgeContent: Text(
                                      result.noticias2[index].likes,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    child: IconButton(
                                      onPressed: () async {
                                        if (result.noticias2[index].curtiu ==
                                            "0") {
                                          form = {
                                            "curtir": "1",
                                            "descurtir": "0",
                                            "noticia_id":
                                                result.noticias2[index].id
                                          };
                                        } else {
                                          form = {
                                            "curtir": "0",
                                            "descurtir": "0",
                                            "noticia_id":
                                                result.noticias2[index].id
                                          };
                                        }
                                        await result.curtir2(form);
                                        if (!result.requestSucces) {
                                          Scaffold.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(result.errorMessage),
                                            backgroundColor: Colors.red,
                                          ));
                                        }
                                      },
                                      icon: Icon(
                                        result.noticias2[index].curtiu == "0"
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
                                      result.noticias2[index].delikes,
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                    child: IconButton(
                                      onPressed: () async {
                                        if (result.noticias2[index].descurtiu ==
                                            "0") {
                                          form = {
                                            "curtir": "0",
                                            "descurtir": "1",
                                            "noticia_id":
                                                result.noticias2[index].id
                                          };
                                        } else {
                                          form = {
                                            "curtir": "0",
                                            "descurtir": "0",
                                            "noticia_id":
                                                result.noticias2[index].id
                                          };
                                        }
                                        await result.curtir2(form);
                                        if (!result.requestSucces) {
                                          Scaffold.of(context)
                                              .showSnackBar(SnackBar(
                                            content: Text(result.errorMessage),
                                            backgroundColor: Colors.red,
                                          ));
                                        }
                                      },
                                      icon: Icon(
                                        result.noticias2[index].descurtiu == "0"
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
                                    result.noticias2[index].data,
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
              ));
        }));
  }
}
