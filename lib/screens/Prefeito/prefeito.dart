import 'package:aqui_cliente/notifiers/prefeito_notifier.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 30.0),
                            child: Image.asset(
                              'assets/prefeito.png',
                              height: 120,
                            ),
                          ),
                          result.loading
                              ? Center(child: Loading())
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Text(
                                    result.prefeito != null
                                        ? result.prefeito.descricao
                                        : result.errorMessage,
                                    textAlign: TextAlign.justify,
                                  ),
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
