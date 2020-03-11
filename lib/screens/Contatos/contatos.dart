import 'package:aqui_cliente/notifiers/contatos_notifier.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:aqui_cliente/screens/widgets/telefone_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Contatos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contatos'),
        centerTitle: true,
      ),
      body: Consumer<ContatosNotifier>(
        builder: (context, result, child) {
          if (result.pontos != null) {
            int qtdPontos = result.pontos.length;
            return Container(
              child: result.loading
                  ? Center(
                      child: Loading(),
                    )
                  : ListView.separated(
                      itemCount: qtdPontos,
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                result.pontos[index].secretaria,
                                style: TextStyle(
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 12.0),
                              TelefoneTile(
                                telefones: result.pontos[index].telefones,
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
                    ),
            );
          }
          return Text(result.errorMessage);
        },
      ),
    );
  }
}
