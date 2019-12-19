import 'package:aqui_cliente/notifiers/enquetes/encerradas.dart';
import 'package:aqui_cliente/notifiers/enquetes/enquetes_usuario.dart';
import 'package:aqui_cliente/notifiers/enquetes/novas.dart';
import 'package:aqui_cliente/screens/Enquete/enquete_res.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EnqueteDetail extends StatefulWidget {
  final String title;
  final String description;
  final String id;
  final String favor;
  final String contra;

  const EnqueteDetail(
      {Key key, this.title, this.description, this.id, this.favor, this.contra})
      : super(key: key);

  @override
  _EnqueteDetailState createState() => _EnqueteDetailState();
}

class _EnqueteDetailState extends State<EnqueteDetail> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text('Detalhes'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(bottom: 18.0),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
              flex: 2,
              child: RichText(
                textAlign: TextAlign.justify,
                text: TextSpan(
                  text: 'Ementa: ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontSize: 18.0,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                        text: widget.description,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      color: Color(0xFF61E47C),
                      onPressed: () async {
                        await Provider.of<NovasEnqueteNotifier>(context)
                            .votarEnquete(widget.id, "1");
                        if (Provider.of<NovasEnqueteNotifier>(context)
                            .requestSucces) {
                          Provider.of<EnqueteEncerradasNotifier>(context)
                              .getEnquetesEncerradas();
                          Provider.of<UsuarioEnqueteNotifier>(context)
                              .getEnquetesUsuario();
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EnqueteResultado()));
                        } else {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text(
                                Provider.of<NovasEnqueteNotifier>(context)
                                    .errorMessage),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
                      child: Text('A Favor',
                          style: TextStyle(color: Colors.white)),
                    ),
                  ),
                  SizedBox(
                    width: 16.0,
                  ),
                  Expanded(
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6.0)),
                      color: Color(0xFFD76E6E),
                      onPressed: () async {
                        await Provider.of<NovasEnqueteNotifier>(context)
                            .votarEnquete(widget.id, "0");
                        if (Provider.of<NovasEnqueteNotifier>(context)
                            .requestSucces) {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EnqueteResultado()));
                        } else {
                          _scaffoldKey.currentState.showSnackBar(SnackBar(
                            content: Text(
                                Provider.of<NovasEnqueteNotifier>(context)
                                    .errorMessage),
                            backgroundColor: Colors.red,
                          ));
                        }
                      },
                      child: Text(
                        'Contra',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
