import 'package:aqui_cliente/notifiers/noticia_notifier.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/news_card.dart';

class NoticiasScreen extends StatefulWidget {
  @override
  _NoticiasScreenState createState() => _NoticiasScreenState();
}

class _NoticiasScreenState extends State<NoticiasScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<NoticiaNotifier>(context).getNoticias("1"));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          title: Text('Notícias'),
          centerTitle: true,
        ),
        body: Consumer<NoticiaNotifier>(
          builder: (context, result, child) {
            if (result.loading) {
              return Center(child: Loading());
            } else if (result.noticias == null) {
              return Center(
                child: Text('Nenhuma noticia encontrada'),
              );
            } else {
              int qtd = result.noticias.length;
              return Container(
                  padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                  child: ListView.builder(
                    itemCount: qtd,
                    itemBuilder: (BuildContext context, int index) {
                      return NewsCard(
                        id: result.noticias[index].id,
                        titulo: result.noticias[index].titulo,
                        data: result.noticias[index].data,
                        imagem: result.noticias[index].imagem,
                        resumo: result.noticias[index].resumo,
                        noticia: result.noticias[index].noticia,
                        likes: result.noticias[index].likes,
                        deslikes: result.noticias[index].delikes,
                      );
                    },
                  ));
            }
          },
        ));
  }
}
