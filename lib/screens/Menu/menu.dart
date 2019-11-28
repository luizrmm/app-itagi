import 'package:aqui_cliente/screens/Enquete/enquete_list.dart';
import 'package:aqui_cliente/screens/Fale_conosco/fale_conosco.dart';
import 'package:flutter/material.dart';
import 'widgets/menu_item.dart';

class MenuScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: GridView(
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, crossAxisSpacing: 8.0, mainAxisSpacing: 8.0),
          shrinkWrap: true,
          children: <Widget>[
            MenuItem(
              route: EnqueteList(),
              icon: 'assets/enquete.png',
              label: 'Enquetes',
            ),
            MenuItem(icon: 'assets/obras.png', label: 'Agenda de Obras'),
            MenuItem(
              route: FaleConosco(),
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
