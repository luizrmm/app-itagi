import 'package:flutter/material.dart';

class Photo extends StatelessWidget {
  final String src;

  const Photo({Key key, this.src}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('Visualizar'),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: Image.network(src),
        ),
      ),
    );
  }
}
