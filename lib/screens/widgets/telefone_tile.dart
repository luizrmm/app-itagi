import 'package:aqui_cliente/models/telefone_model.dart';
import 'package:aqui_cliente/notifiers/pontosInteresse_notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TelefoneTile extends StatelessWidget {
  final List<TelefoneModel> telefones;
  TelefoneTile({this.telefones});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: telefones.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: GestureDetector(
            onTap: () {
              Provider.of<PontosInteresseNotifier>(context)
                  .launchURL(telefones[index].telefone);
            },
            child: RichText(
              text: TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 16.0),
                text: '${telefones[index].descricao} - ',
                children: <TextSpan>[
                  TextSpan(
                      text: telefones[index].telefone,
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
