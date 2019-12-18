import 'package:aqui_cliente/notifiers/noticia_notifier.dart';
import 'package:aqui_cliente/screens/Agenda_obras/widgets/news_card.dart';

import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AgendaObras extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Agenda de Obras'),
          centerTitle: true,
        ),
        body: Consumer<NoticiaNotifier>(
          builder: (context, result, child) {
            if (result.loading) {
              return Center(child: Loading());
            } else if (result.noticias2 == null) {
              return Center(
                child: Text('Nenhuma noticia encontrada'),
              );
            } else {
              int qtd = result.noticias2.length;
              return Container(
                  padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 0.0),
                  child: ListView.builder(
                    itemCount: qtd,
                    itemBuilder: (BuildContext context, int index) {
                      return ObrasCard(
                        id: result.noticias2[index].id,
                        titulo: result.noticias2[index].titulo,
                        data: result.noticias2[index].data,
                        imagem: result.noticias2[index].imagem,
                        resumo: result.noticias2[index].resumo,
                        noticia: result.noticias2[index].noticia,
                        curtiu: result.noticias2[index].curtiu,
                        descurtiu: result.noticias2[index].descurtiu,
                        deslikes: result.noticias2[index].delikes,
                        likes: result.noticias2[index].likes,
                      );
                    },
                  ));
            }
          },
        ));
  }
}
