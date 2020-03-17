import 'package:aqui_cliente/notifiers/contatos_notifier.dart';
import 'package:aqui_cliente/notifiers/enquetes/encerradas.dart';
import 'package:aqui_cliente/notifiers/enquetes/enquetes_usuario.dart';
import 'package:aqui_cliente/notifiers/enquetes/novas.dart';
import 'package:aqui_cliente/notifiers/esqueceu_notifier.dart';
import 'package:aqui_cliente/notifiers/faleConosco_notifier.dart';
import 'package:aqui_cliente/notifiers/perfil_notifier.dart';
import 'package:aqui_cliente/notifiers/pesquisa_notifier.dart';
import 'package:aqui_cliente/notifiers/pontosInteresse_notifier.dart';
import 'package:aqui_cliente/notifiers/pop_notifier.dart';
import 'package:aqui_cliente/notifiers/prefeito_notifier.dart';
import 'package:aqui_cliente/notifiers/prefeitura_notifier.dart';
import 'package:aqui_cliente/notifiers/relatar_notifier.dart';
import 'package:aqui_cliente/notifiers/user_notifier.dart';
import 'package:aqui_cliente/repository/contatos_repository.dart';
import 'package:aqui_cliente/repository/pontosInteresse_repository.dart';
import 'package:aqui_cliente/repository/popUp_repository.dart';
import 'package:aqui_cliente/repository/prefeito_repository.dart';
import 'package:aqui_cliente/repository/prefeitura_repository.dart';
import 'package:aqui_cliente/repository/user_repository.dart';
import 'package:aqui_cliente/screens/Home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/Home/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserNotifier(UserRepository()),
        ),
        ChangeNotifierProvider.value(
          value: PrefeitoNotifier(
            PrefeitoRepository(),
          ),
        ),
        ChangeNotifierProvider.value(
          value: PrefeituraNotifier(
            PrefeituraRepository(),
          ),
        ),
        ChangeNotifierProvider.value(
          value: ContatosNotifier(
            ContatosRepository(),
          ),
        ),
        ChangeNotifierProvider.value(
          value: PontosInteresseNotifier(
            PontosInteresseRespository(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => PerfilNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => FaleNotifier(),
        ),
        ChangeNotifierProvider<RelatarNotifier>(
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
          create: (context) => PesquisaNotifier(),
        ),
        ChangeNotifierProvider(
          create: (context) => PopUpNotifier(PopUpRepository()),
        ),
        ChangeNotifierProvider(
          create: (context) => EsqueceuSenhaNotifier(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF00B43A),
          fontFamily: 'Poppins',
        ),
        home: HomeScreen(),
      ),
    );
  }
}
