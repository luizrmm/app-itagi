import 'package:aqui_cliente/screens/Enquete/widgets/tile_enquete.dart';
import 'package:flutter/material.dart';

class EnquetesAtivas extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0.0),
        child: ListView(
          children: <Widget>[
            TileEnquete(),
            TileEnquete(),
            TileEnquete(),
            TileEnquete(),
            TileEnquete()
          ],
        ));
  }
}
