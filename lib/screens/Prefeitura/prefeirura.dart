import 'package:aqui_cliente/notifiers/prefeitura_notifier.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Prefeitura extends StatefulWidget {
  @override
  _PrefeituraState createState() => _PrefeituraState();
}

class _PrefeituraState extends State<Prefeitura> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() =>
        Provider.of<PrefeituraNotifier>(context, listen: false)
            .getPrefeituraData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prefeitura'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: Consumer<PrefeituraNotifier>(
                  builder: (context, result, child) {
                    return SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 30.0),
                            child: Image.asset(
                              'assets/logo_barreiras.png',
                              height: 120,
                            ),
                          ),
                          result.loading
                              ? Center(child: Loading())
                              : Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0),
                                  child: Text(
                                    result.prefeitura != null
                                        ? result.prefeitura.descricao
                                        : result.errorMessage,
                                    textAlign: TextAlign.justify,
                                  ),
                                )
                        ],
                      ),
                    );
                  },
                )),
          );
        },
      ),
    );
  }
}
