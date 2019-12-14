import 'package:aqui_cliente/notifiers/enquetes/novas.dart';
import 'package:aqui_cliente/screens/Enquete/widgets/tile_enquete.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnquetesAtivas extends StatefulWidget {
  @override
  _EnquetesAtivasState createState() => _EnquetesAtivasState();
}

class _EnquetesAtivasState extends State<EnquetesAtivas> {
  @override
  Widget build(BuildContext context) {
    if (Provider.of<NovasEnqueteNotifier>(context).loading) {
      return Container(
        child: Center(
          child: Loading(),
        ),
      );
    } else if (Provider.of<NovasEnqueteNotifier>(context).novasEnquetes ==
        null) {
      return Container(
        child: Center(
          child: Text('Nenhuma enquete foi encontrada'),
        ),
      );
    }
    return Consumer<NovasEnqueteNotifier>(
      builder: (context, result, child) {
        int qtd = result.novasEnquetes.length;
        return ListView.builder(
          itemCount: qtd,
          itemBuilder: (BuildContext context, int index) {
            return TileEnquete(
              id: result.novasEnquetes[index].id,
              title: result.novasEnquetes[index].titulo,
              description: result.novasEnquetes[index].enquete,
              qtdVotos: result.novasEnquetes[index].qtdVotos,
              aFavor: result.novasEnquetes[index].vFavor,
              contra: result.novasEnquetes[index].vContra,
              dataEnc: result.novasEnquetes[index].dataFinal,
              encerrada: false,
              color: Theme.of(context).primaryColor,
              iconData: Icons.arrow_forward_ios,
            );
          },
        );
      },
    );
  }
}
