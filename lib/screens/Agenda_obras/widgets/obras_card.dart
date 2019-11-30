import './custom_icons.dart';
import 'package:flutter/material.dart';

class ObrasCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                'https://source.unsplash.com/random',
                height: 160,
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
              child: Text(
                'Manchete da Notícia',
                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
              ),
            ),
            Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc sagittis turpis lobortis nisi consectetur, nec tempus purus condimentum.'),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CustomIcons.thumbs_up,
                      color: Colors.blue,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CustomIcons.thumbs_down,
                      color: Colors.red,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      CustomIcons.share,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Expanded(
                      child: Text(
                    '02, Novembro 2019',
                    textAlign: TextAlign.end,
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
