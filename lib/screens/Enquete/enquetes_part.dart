import 'package:flutter/material.dart';

import 'widgets/tile_enquete.dart';

class EnquetesPart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0.0),
        child: ListView(
          children: <Widget>[
            TileEnquete(
              iconData: Icons.check,
              color: Colors.green,
            ),
            TileEnquete(
              iconData: Icons.check,
              color: Colors.green,
            ),
            TileEnquete(
              iconData: Icons.check,
              color: Colors.green,
            ),
          ],
        ));
  }
}
