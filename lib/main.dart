import 'package:aqui_cliente/notifiers/contatos_notifier.dart';
import 'package:aqui_cliente/notifiers/home_notifier.dart';
import 'package:aqui_cliente/notifiers/pontosInteresse_notifier.dart';
import 'package:aqui_cliente/notifiers/prefeito_notifier.dart';
import 'package:aqui_cliente/notifiers/prefeitura_notifier.dart';
import 'package:aqui_cliente/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          builder: (context) => HomeNotifier(),
        ),
        ChangeNotifierProvider(
          builder: (context) => PrefeituraNotifier(),
        ),
        ChangeNotifierProvider(
          builder: (context) => PrefeitoNotifier(),
        ),
        ChangeNotifierProvider(
          builder: (context) => PontosInteresseNotifier(),
        ),
        ChangeNotifierProvider(
          builder: (context) => ContatosNotifier(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF2C5573),
          fontFamily: 'Poppins',
        ),
        home: HomeScreen(),
      ),
    );
  }
}
