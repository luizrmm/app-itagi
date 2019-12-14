import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class NoticiaDetail extends StatelessWidget {
  final String noticia;

  const NoticiaDetail({Key key, this.noticia}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notícia'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 20.0, right: 20.0, left: 20.0),
        child: SingleChildScrollView(
          child: Html(
            data: noticia,
          ),
        ),
      ),
    );
  }
}
