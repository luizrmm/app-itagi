import 'package:aqui_cliente/notifiers/pontosInteresse_notifier.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:aqui_cliente/screens/widgets/telefone_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelefonesUteis extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Telefones Úteis'),
        centerTitle: true,
      ),
      body: Consumer<PontosInteresseNotifier>(
        builder: (context, telefonesModel, child) {
          if (telefonesModel.pontos.isNotEmpty) {
            int qtdPontos = telefonesModel.pontos.length;
            return ListView.separated(
              itemCount: qtdPontos,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      Text(
                        telefonesModel.pontos[index].secretaria,
                        style: TextStyle(
                            fontSize: 20.0, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 12.0),
                      TelefoneTile(
                        telefones: telefonesModel.pontos[index].telefones,
                      )
                    ],
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return Divider(
                  color: Colors.black,
                  thickness: 1.0,
                );
              },
            );
          } else if (telefonesModel.loading) {
            return Center(
              child: Loading(),
            );
          }
          return Text(telefonesModel.errorMessage);
        },
      ),
    );
  }
}
