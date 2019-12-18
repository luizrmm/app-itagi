import 'package:aqui_cliente/notifiers/home_notifier.dart';
import 'package:aqui_cliente/screens/Login/login_screen.dart';
import 'package:aqui_cliente/screens/Menu/menu.dart';
import 'package:aqui_cliente/screens/Perfil/perfil_screen.dart';
import 'package:aqui_cliente/screens/Relatar_problemas/relatar_problemas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<HomeNotifier>(context).getToken());
    setupNotification();
  }

  void setupNotification() async {
    _firebaseMessaging.getToken().then((token) {
      var json = {"key": token};
      Provider.of<HomeNotifier>(context).saveFCM(json);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print("onMessage: $message");
      },
      onLaunch: (Map<String, dynamic> message) async {
        print("onLaunch: $message");
      },
      onResume: (Map<String, dynamic> message) async {
        print("onResume: $message");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    int cIndex = Provider.of<HomeNotifier>(context).currentIndex;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: IndexedStack(
          index: cIndex,
          children: <Widget>[
            Provider.of<HomeNotifier>(context).token == null
                ? LoginScreen()
                : Perfil(),
            MenuScreen(),
            RelProblemsScreen(),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black38,
          iconSize: 28.0,
          elevation: 10.0,
          currentIndex: cIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.person,
                ),
                title: Text('Perfil'),
                backgroundColor: Theme.of(context).primaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.apps),
                title: Text('Menu'),
                backgroundColor: Theme.of(context).primaryColor),
            BottomNavigationBarItem(
                icon: Icon(Icons.record_voice_over),
                title: Text('Relatar problemas'),
                backgroundColor: Theme.of(context).primaryColor),
          ],
          onTap: (index) {
            Provider.of<HomeNotifier>(context).changePage(index);
          },
        ));
  }
}
