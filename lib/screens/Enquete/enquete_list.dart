import 'package:aqui_cliente/notifiers/enquetes/encerradas.dart';
import 'package:aqui_cliente/notifiers/enquetes/enquetes_usuario.dart';
import 'package:aqui_cliente/notifiers/enquetes/novas.dart';
import 'package:aqui_cliente/screens/Enquete/enquetes_ativas.dart';
import 'package:aqui_cliente/screens/Enquete/enquetes_encerradas.dart';
import 'package:aqui_cliente/screens/Enquete/enquetes_part.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnqueteList extends StatefulWidget {
  @override
  _EnqueteListState createState() => _EnqueteListState();
}

class _EnqueteListState extends State<EnqueteList>
    with SingleTickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 3);

    Future.microtask(() =>
        Provider.of<UsuarioEnqueteNotifier>(context).getEnquetesUsuario());
    Future.microtask(
        () => Provider.of<NovasEnqueteNotifier>(context).getNovasEnquetes());
    Future.microtask(() => Provider.of<EnqueteEncerradasNotifier>(context)
        .getEnquetesEncerradas());
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Enquetes'),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          tabs: <Widget>[
            Tab(text: 'Ativos'),
            Tab(text: 'Encerradas'),
            Tab(text: 'Participadas')
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: <Widget>[
          EnquetesAtivas(),
          EnquetesEncerradas(),
          EnquetesPart()
        ],
      ),
    );
  }
}
