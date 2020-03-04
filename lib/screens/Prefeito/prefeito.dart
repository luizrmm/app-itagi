import 'package:aqui_cliente/notifiers/prefeito_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class Prefeito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Prefeito'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: screenHeight),
          child: Consumer<PrefeitoNotifier>(
            builder: (context, model, child) {
              if (model.loading) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 20.0, bottom: 30.0, left: 20.0, right: 20.0),
                      child: model.prefeito.imagem.isEmpty
                          ? Image.asset(
                              'assets/prefeito.png',
                              height: 120,
                            )
                          : Image.network(
                              model.prefeito.imagem,
                            ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Html(
                        data: model.prefeito != null
                            ? model.prefeito.descricao
                            : model.errorMessage,
                        customTextAlign: (dom.Node node) {
                          if (node is dom.Element && node.localName == "p") {
                            return TextAlign.justify;
                          }
                          return TextAlign.left;
                        },
                      ),
                    )
                  ],
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
