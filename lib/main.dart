import 'package:aqui_cliente/notifiers/cadastro_notifier.dart';
import 'package:aqui_cliente/notifiers/contatos_notifier.dart';
import 'package:aqui_cliente/notifiers/enquetes/encerradas.dart';
import 'package:aqui_cliente/notifiers/enquetes/enquetes_usuario.dart';
import 'package:aqui_cliente/notifiers/enquetes/novas.dart';
import 'package:aqui_cliente/notifiers/faleConosco_notifier.dart';
import 'package:aqui_cliente/notifiers/home_notifier.dart';
import 'package:aqui_cliente/notifiers/login_notifier.dart';
import 'package:aqui_cliente/notifiers/noticia_notifier.dart';
import 'package:aqui_cliente/notifiers/perfil_notifier.dart';
import 'package:aqui_cliente/notifiers/pesquisa_notifier.dart';
import 'package:aqui_cliente/notifiers/pontosInteresse_notifier.dart';
import 'package:aqui_cliente/notifiers/prefeito_notifier.dart';
import 'package:aqui_cliente/notifiers/prefeitura_notifier.dart';
import 'package:aqui_cliente/notifiers/relatar_notifier.dart';
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
          create: (context) => HomeNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => PrefeituraNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => PrefeitoNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => PontosInteresseNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => ContatosNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => CadastroNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => PerfilNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => FaleNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => RelatarNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => NovasEnqueteNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => EnqueteEncerradasNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => UsuarioEnqueteNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => NoticiaNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => PesquisaNotifier(),
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
