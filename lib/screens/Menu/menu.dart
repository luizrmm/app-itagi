import 'package:aqui_cliente/widgets/menu_item.dart';
import 'package:flutter/material.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(22.0),
        child: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, crossAxisSpacing: 24.0, mainAxisSpacing: 24.0),
          shrinkWrap: true,
          children: <Widget>[
            MenuItem(
              icon: 'assets/enquete.png',
              label: 'Enquetes',
            ),
            MenuItem(icon: 'assets/obras.png', label: 'Agenda de Obras'),
            MenuItem(
              icon: 'assets/fale_conosco.png',
              label: 'Fale Conosco',
            ),
            MenuItem(
              icon: 'assets/telefones.png',
              label: 'Telefones Úteis',
            ),
            MenuItem(
              icon: 'assets/contatos.png',
              label: 'Contatos',
            ),
            MenuItem(icon: 'assets/prefeitura.png', label: 'Prefeitura'),
            MenuItem(icon: 'assets/prefeito.png', label: 'Prefeito'),
            MenuItem(
                icon: 'assets/pesquisa.png', label: 'Pesquisa de Satisfação'),
          ],
        ),
      )),
    );
  }
}
