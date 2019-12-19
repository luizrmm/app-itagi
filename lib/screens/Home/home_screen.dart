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

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 1;

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    Future.microtask(() => Provider.of<HomeNotifier>(context).getToken());
    setupNotification();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.animateTo(_currentIndex);
  }

  void setupNotification() async {
    _firebaseMessaging.getToken().then((token) {
      var json = {"key": token};
      print(token);
      Provider.of<HomeNotifier>(context).saveFCM(json);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {
        print('1');
      },
      onLaunch: (Map<String, dynamic> message) async {
        print('1');
      },
      onResume: (Map<String, dynamic> message) async {
        print('1');
      },
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeNotifier>(
      builder: (context, result, child) {
        return Scaffold(
            backgroundColor: Colors.grey[300],
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              controller: _tabController,
              children: <Widget>[
                result.token == null ? LoginScreen() : Perfil(),
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
              currentIndex: _currentIndex,
              onTap: (currentIndex) {
                setState(() {
                  _currentIndex = currentIndex;
                });

                _tabController.animateTo(_currentIndex);
              },
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
            ));
      },
    );
  }
}
