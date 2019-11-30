import 'package:aqui_cliente/screens/Fale_conosco/widgets/label.dart';
import 'package:flutter/material.dart';

class FaleConosco extends StatefulWidget {
  @override
  _FaleConoscoState createState() => _FaleConoscoState();
}

class _FaleConoscoState extends State<FaleConosco> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Fale Conosco'),
          centerTitle: true,
        ),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints:
                    BoxConstraints(minHeight: viewportConstraints.maxHeight),
                child: SafeArea(
                  child: Container(
                    padding: EdgeInsets.all(20.0),
                    child: Form(
                      child: Column(
                        children: <Widget>[
                          Label(
                            value: 'Nome',
                          ),
                          Material(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            elevation: 7.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 15.0),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                          Label(
                            value: 'Email',
                          ),
                          Material(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            elevation: 7.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 15.0),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                          Label(
                            value: 'Telefone',
                          ),
                          Material(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            elevation: 7.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 15.0),
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide.none)),
                            ),
                          ),
                          Label(
                            value: 'Mensagem',
                          ),
                          Material(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6.0)),
                            elevation: 7.0,
                            shadowColor: Colors.black,
                            child: TextFormField(
                              style: TextStyle(fontSize: 16),
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                      horizontal: 12.0, vertical: 15.0),
                                  hintText: 'Insira aqui sua mensagem',
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(6.0),
                                      borderSide: BorderSide.none)),
                              maxLines: 3,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 18.0, bottom: 20.0),
                            child: MaterialButton(
                              minWidth:
                                  MediaQuery.of(context).size.width * 0.45,
                              height: 42,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0)),
                              color: Theme.of(context).primaryColor,
                              onPressed: () {},
                              child: Text(
                                'Confirmar',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
