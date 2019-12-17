import 'package:aqui_cliente/notifiers/enquetes/encerradas.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/tile_enquete.dart';

class EnquetesEncerradas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<EnqueteEncerradasNotifier>(context).loading) {
      return Container(
        child: Center(
          child: Loading(),
        ),
      );
    } else if (Provider.of<EnqueteEncerradasNotifier>(context)
            .enquetesEncerradas ==
        null) {
      return Container(
        child: Center(
          child: Text('Nenhuma enquete foi encontrada'),
        ),
      );
    }
    return Consumer<EnqueteEncerradasNotifier>(
      builder: (context, result, child) {
        int qtd = result.enquetesEncerradas.length;
        return ListView.builder(
          itemCount: qtd,
          itemBuilder: (BuildContext context, int index) {
            return TileEnquete(
              id: result.enquetesEncerradas[index].id,
              title: result.enquetesEncerradas[index].titulo,
              description: result.enquetesEncerradas[index].enquete,
              qtdVotos: result.enquetesEncerradas[index].qtdVotos,
              aFavor: result.enquetesEncerradas[index].vFavor,
              contra: result.enquetesEncerradas[index].vContra,
              dataEnc: result.enquetesEncerradas[index].dataFinal,
              encerrada: true,
              color: Colors.red,
              iconData: Icons.description,
            );
          },
        );
      },
    );
  }
}
