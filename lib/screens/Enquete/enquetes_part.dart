import 'package:aqui_cliente/notifiers/enquetes/enquetes_usuario.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/tile_enquete.dart';

class EnquetesPart extends StatefulWidget {
  @override
  _EnquetesPartState createState() => _EnquetesPartState();
}

class _EnquetesPartState extends State<EnquetesPart> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<UsuarioEnqueteNotifier>(context).loading) {
      return Container(
        child: Center(
          child: Loading(),
        ),
      );
    } else if (Provider.of<UsuarioEnqueteNotifier>(context).usuarioEnquetes ==
        null) {
      return Container(
        child: Center(
          child: Text('Nenhuma enquete foi encontrada'),
        ),
      );
    }
    return Consumer<UsuarioEnqueteNotifier>(
      builder: (context, result, child) {
        int qtd = result.usuarioEnquetes.length;
        return ListView.builder(
          itemCount: qtd,
          itemBuilder: (BuildContext context, int index) {
            return TileEnquete(
              id: result.usuarioEnquetes[index].id,
              title: result.usuarioEnquetes[index].titulo,
              description: result.usuarioEnquetes[index].enquete,
              qtdVotos: result.usuarioEnquetes[index].qtdVotos,
              aFavor: result.usuarioEnquetes[index].vFavor,
              contra: result.usuarioEnquetes[index].vContra,
              dataEnc: result.usuarioEnquetes[index].dataFinal,
              encerrada: true,
              color: Colors.green,
              iconData: Icons.check_circle,
            );
          },
        );
      },
    );
  }
}
