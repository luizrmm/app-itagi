import 'package:flutter/material.dart';

import 'widgets/news_card.dart';

class NoticiasScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(8.0, 12.0, 8.0, 0.0),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (BuildContext context, int index) {
            return NewsCard();
          },
        ));
  }
}
