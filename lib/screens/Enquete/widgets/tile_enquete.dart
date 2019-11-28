import 'package:aqui_cliente/screens/Enquete/enquete_detail.dart';
import 'package:flutter/material.dart';

class TileEnquete extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => EnqueteDetail()));
      },
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
        child: Row(
          children: <Widget>[
            Flexible(
              flex: 4,
              fit: FlexFit.tight,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Pec 6/2019'),
                    Text(
                      'Modifica o sitema da previdência e auxilia políticos a obterem mais auxilios desnecessários para manter seu sustento',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('205 votos'),
                        Text('Encerramento: 10/03')
                      ],
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0))),
                height: 80,
                child: Center(
                  child: Icon(Icons.arrow_forward_ios, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
