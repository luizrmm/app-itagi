import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: Container(
                padding: EdgeInsets.all(20.0),
                color: Colors.white,
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Prefeitura de Barreiras',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 32.0,
                            color: Colors.red,
                            fontWeight: FontWeight.bold),
                      ),
                      TextFormField(),
                      TextFormField(),
                      MaterialButton(
                        height: 42,
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0)),
                        onPressed: () {},
                        child: Text(
                          'Login',
                          style: TextStyle(color: Colors.white, fontSize: 14.0),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
