import 'package:aqui_cliente/screens/Fale_conosco/widgets/label.dart';
import 'package:flutter/material.dart';

class RelProblemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(minHeight: viewportConstraints.maxHeight),
            child: Container(
              padding: EdgeInsets.all(20.0),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: Material(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0)),
                          elevation: 7.0,
                          shadowColor: Colors.black,
                          child: Padding(
                            padding: const EdgeInsets.all(40.0),
                            child: Image.asset(
                              'assets/upload.png',
                              height: 100,
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 18.0, bottom: 20.0),
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width * 0.45,
                        height: 42,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                        child: Text(
                          'Tirar foto',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(bottom: 20.0),
                      child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width * 0.45,
                        height: 42,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        color: Theme.of(context).primaryColor,
                        onPressed: () {},
                        child: Text(
                          'Carregar foto',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Label(
                      value: 'Problema',
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
                                horizontal: 12.0, vertical: 10.0),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    Label(
                      value: 'Endereço',
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
                                horizontal: 12.0, vertical: 10.0),
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(6.0),
                                borderSide: BorderSide.none)),
                      ),
                    ),
                    Label(
                      value: 'Descrição',
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
                                horizontal: 12.0, vertical: 10.0),
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
                        minWidth: MediaQuery.of(context).size.width * 0.45,
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
        );
      },
    );
  }
}
