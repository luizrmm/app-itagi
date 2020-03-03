import 'package:aqui_cliente/notifiers/pop_notifier.dart';
import 'package:aqui_cliente/screens/Agenda_obras/agenda_obras.dart';
import 'package:aqui_cliente/screens/Contatos/contatos.dart';
import 'package:aqui_cliente/screens/Enquete/enquete_list.dart';
import 'package:aqui_cliente/screens/Fale_conosco/fale_conosco.dart';
import 'package:aqui_cliente/screens/Noticias/noticias.dart';
import 'package:aqui_cliente/screens/Pesquisa_satisfacao/pesquisa.dart';
import 'package:aqui_cliente/screens/Prefeito/prefeito.dart';
import 'package:aqui_cliente/screens/Prefeitura/prefeirura.dart';
import 'package:aqui_cliente/screens/Telefones_uteis/telefones_uteis.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'widgets/menu_item.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  Future<void> _neverSatisfied() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.9,
            child: CarouselSlider(
                viewportFraction: 1.0,
                height: MediaQuery.of(context).size.height * 0.5,
                autoPlay: true,
                items: Provider.of<PopUpNotifier>(context).imagens == null
                    ? <Widget>[Center(child: Loading())]
                    : Provider.of<PopUpNotifier>(context).imagens.map((value) {
                        return Builder(
                          builder: (BuildContext context) {
                            return GestureDetector(
                              onTap: value.url == null
                                  ? () {}
                                  : () async {
                                      var url = value.url;
                                      if (await canLaunch(url)) {
                                        await launch(url);
                                      } else {
                                        throw 'Could not launch $url';
                                      }
                                    },
                              child: Container(
                                padding: EdgeInsets.symmetric(horizontal: 20.0),
                                child: Image.network(value.popUp),
                              ),
                            );
                          },
                        );
                      }).toList()),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text(
                'Fechar',
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                Provider.of<PopUpNotifier>(context).hidePopUp();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (Provider.of<PopUpNotifier>(context).show) {
        _neverSatisfied();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Colors.grey[700]],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 60.0),
              child: Image.asset(
                'assets/logo.png',
                height: 140,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: GridView(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8.0,
                    mainAxisSpacing: 8.0),
                shrinkWrap: true,
                children: <Widget>[
                  MenuItem(
                    route: NoticiasScreen(),
                    icon: 'assets/newspaper.png',
                    label: 'Notícias',
                  ),
                  MenuItem(
                      route: AgendaObras(),
                      icon: 'assets/obras.png',
                      label: 'Agenda de Obras'),
                  MenuItem(
                      route: PesquisaSatisfacao(),
                      icon: 'assets/pesquisa.png',
                      label: 'Pesquisa de Satisfação'),
                  MenuItem(
                    route: TelefonesUteis(),
                    icon: 'assets/telefones.png',
                    label: 'Telefones Úteis',
                  ),
                  MenuItem(
                    route: Contatos(),
                    icon: 'assets/contatos.png',
                    label: 'Contatos',
                  ),
                  MenuItem(
                    route: FaleConosco(),
                    icon: 'assets/fale_conosco.png',
                    label: 'Fale Conosco',
                  ),
                  MenuItem(
                      route: Prefeitura(),
                      icon: 'assets/prefeitura.png',
                      label: 'Prefeitura'),
                  MenuItem(
                      route: Prefeito(),
                      icon: 'assets/prefeito.png',
                      label: 'Prefeito'),
                  MenuItem(
                    route: EnqueteList(),
                    icon: 'assets/enquete.png',
                    label: 'Enquetes',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
