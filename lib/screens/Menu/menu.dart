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
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
          title: Text('Rewind and remember'),
          content: CarouselSlider(
            height: 400.0,
            autoPlay: true,
            items: [1, 2, 3, 4, 5].map((i) {
              return Builder(
                builder: (BuildContext context) {
                  return Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(color: Colors.amber),
                      child: Text(
                        'text $i',
                        style: TextStyle(fontSize: 16.0),
                      ));
                },
              );
            }).toList(),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Regret'),
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
                colors: [Colors.white, Colors.blueGrey],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0, bottom: 60.0),
              child: Image.asset(
                'assets/logo_barreiras.png',
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
