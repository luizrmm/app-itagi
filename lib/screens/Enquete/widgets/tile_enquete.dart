import 'package:aqui_cliente/screens/Enquete/enquete_desc.dart';
import 'package:aqui_cliente/screens/Enquete/enquete_detail.dart';
import 'package:flutter/material.dart';

class TileEnquete extends StatelessWidget {
  final Color color;
  final IconData iconData;
  final String id;
  final String title;
  final String description;
  final String qtdVotos;
  final String aFavor;
  final String contra;
  final String dataEnc;
  final bool encerrada;
  TileEnquete(
      {this.color,
      this.iconData,
      this.id,
      this.title,
      this.description,
      this.qtdVotos,
      this.aFavor,
      this.contra,
      this.dataEnc,
      this.encerrada});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (encerrada) {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EnqueteDesc(
                    title: title,
                    description: description,
                    contra: contra,
                    favor: aFavor,
                  )));
        } else {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EnqueteDetail(
                    id: id,
                    title: title,
                    description: description,
                    contra: contra,
                    favor: aFavor,
                  )));
        }
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
                    Text(title),
                    Text(
                      description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text('$qtdVotos votos'),
                        Text('Encerramento: $dataEnc')
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
                    color: color,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(12.0),
                        bottomRight: Radius.circular(12.0))),
                height: 80,
                child: Center(
                  child: Icon(iconData, color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
