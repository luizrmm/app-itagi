import 'package:aqui_cliente/screens/widgets/button.dart';
import 'package:aqui_cliente/screens/widgets/imageView.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:share/share.dart';

class NoticiaDetail extends StatelessWidget {
  final String noticia;
  final String title;
  final List imagens;

  const NoticiaDetail({Key key, this.noticia, this.title, this.imagens})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: CarouselSlider(
                  viewportFraction: 1.0,
                  autoPlay: imagens.length == 1 ? false : true,
                  scrollPhysics: imagens.length == 1
                      ? NeverScrollableScrollPhysics()
                      : null,
                  items: imagens.map((value) {
                    return Builder(
                      builder: (context) {
                        return SizedBox(
                          width: MediaQuery.of(context).size.width * 1,
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Photo(
                                            src: value["imagem"],
                                          )));
                            },
                            child: Image.network(value["imagem"],
                                height: 200, fit: BoxFit.cover),
                          ),
                        );
                      },
                    );
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Html(
                  data: noticia,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 40.0),
                child: DefaultButton(
                  function: () {
                    Share.share('check out my website https://example.com',
                        subject: 'Look what I made!');
                  },
                  text: 'Compartilhar',
                  isbusy: false,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
