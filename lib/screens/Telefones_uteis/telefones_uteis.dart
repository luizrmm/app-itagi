import 'package:aqui_cliente/notifiers/pontosInteresse_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelefonesUteis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int qtdPontos = Provider.of<PontosInteresseNotifier>(context).pontos.length;
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: SafeArea(
                child: ListView.builder(
              shrinkWrap: true,
              itemCount: qtdPontos,
              itemBuilder: (BuildContext context, int index) {
                return Text(Provider.of<PontosInteresseNotifier>(context)
                    .pontos[index]
                    .telefones[0]
                    .telefone);
              },
            )),
          ),
        );
      },
    );
  }
}
