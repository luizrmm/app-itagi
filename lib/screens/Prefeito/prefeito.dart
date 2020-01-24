import 'package:aqui_cliente/notifiers/prefeito_notifier.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:html/dom.dart' as dom;

class Prefeito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prefeito'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Consumer<PrefeitoNotifier>(
                  builder: (context, result, child) {
                    return SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                              padding: const EdgeInsets.only(
                                  top: 20.0,
                                  bottom: 30.0,
                                  left: 20.0,
                                  right: 20.0),
                              child: result.prefeito.imagem.isEmpty
                                  ? Image.asset(
                                      'assets/prefeito.png',
                                      height: 120,
                                    )
                                  : Image.network(
                                      result.prefeito.imagem,
                                    )),
                          result.loading
                              ? Center(child: Loading())
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Html(
                                      data: result.prefeito != null
                                          ? result.prefeito.descricao
                                          : result.errorMessage,
                                      customTextAlign: (dom.Node node) {
                                        if (node is dom.Element &&
                                            node.localName == "p") {
                                          return TextAlign.justify;
                                        }
                                        return TextAlign.left;
                                      }),
                                )
                        ],
                      ),
                    );
                  },
                )),
          );
        },
      ),
    );
  }
}
