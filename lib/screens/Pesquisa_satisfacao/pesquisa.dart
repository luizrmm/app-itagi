import 'package:aqui_cliente/notifiers/pesquisa_notifier.dart';
import 'package:aqui_cliente/screens/widgets/button.dart';
import 'package:aqui_cliente/screens/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:provider/provider.dart';

class PesquisaSatisfacao extends StatefulWidget {
  @override
  _PesquisaSatisfacaoState createState() => _PesquisaSatisfacaoState();
}

class _PesquisaSatisfacaoState extends State<PesquisaSatisfacao> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<PesquisaNotifier>(context).getOptions());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pesquisa de Satisfação'),
          centerTitle: true,
        ),
        body: Consumer<PesquisaNotifier>(
          builder: (context, result, child) {
            if (result.loading) {
              return Center(
                child: Center(
                  child: Loading(),
                ),
              );
            } else if (result.options == null) {
              return Center(
                child: Text('Nenhum dado encontrado'),
              );
            } else {
              List<dynamic> list = new List(result.options.length);
              return SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(
                      top: 20.0, left: 20.0, right: 20.0, bottom: 0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: <Widget>[
                      ListView.separated(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: result.options.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                Text(
                                  result.options[index].titulo,
                                  style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                RadioButtonGroup(
                                    labels: [
                                      'Insatisfeito',
                                      'Pouco Satisfeito',
                                      'Satisfeito'
                                    ],
                                    onSelected: (String selected) {
                                      if (selected == "Insatisfeito") {
                                        var teste = {
                                          "pesquisa_id":
                                              result.options[index].id,
                                          "voto": 1
                                        };
                                        list[index] = teste;
                                      } else if (selected ==
                                          "Pouco Satisfeito") {
                                        var teste = {
                                          "pesquisa_id":
                                              result.options[index].id,
                                          "voto": 2
                                        };
                                        list[index] = teste;
                                      } else {
                                        var teste = {
                                          "pesquisa_id":
                                              result.options[index].id,
                                          "voto": 3
                                        };
                                        list[index] = teste;
                                      }
                                    })
                              ],
                            ),
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return Divider();
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: DefaultButton(
                          isbusy:
                              Provider.of<PesquisaNotifier>(context).loading,
                          function: () async {
                            if (list.contains(null)) {
                              Scaffold.of(context).showSnackBar(SnackBar(
                                content:
                                    Text('Por favor responda todas as opções'),
                                backgroundColor: Colors.red,
                              ));
                            } else {
                              var form = {"respostas": list};
                              await Provider.of<PesquisaNotifier>(context)
                                  .votar(form);
                              if (Provider.of<PesquisaNotifier>(context)
                                  .requestSucces) {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(result.successMessage),
                                  backgroundColor: Colors.green,
                                ));
                              } else {
                                Scaffold.of(context).showSnackBar(SnackBar(
                                  content: Text(result.errorMessage),
                                  backgroundColor: Colors.red,
                                ));
                              }
                            }
                          },
                          text: 'Confirmar',
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}
