import 'package:aqui_cliente/notifiers/prefeitura_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;
import 'package:provider/provider.dart';

class Prefeitura extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text('Prefeitura'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          constraints: BoxConstraints(minHeight: screenHeight),
          child: Consumer<PrefeituraNotifier>(
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
                      padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                      child: Image.asset(
                        'assets/logo.png',
                        height: 120,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Html(
                        data: model.prefeitura != null
                            ? model.prefeitura.descricao
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
