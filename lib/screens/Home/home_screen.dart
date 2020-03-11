import 'package:aqui_cliente/notifiers/user_notifier.dart';
import 'package:aqui_cliente/screens/Login/login_screen.dart';
import 'package:aqui_cliente/screens/Menu/menu.dart';
import 'package:aqui_cliente/screens/Perfil/perfil_screen.dart';
import 'package:aqui_cliente/screens/Relatar_problemas/relatar_problemas.dart';
import 'package:aqui_cliente/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:provider/provider.dart';

final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 1;

  String token;

  TabController _tabController;
  @override
  void initState() {
    super.initState();
    Future.microtask(
        () => Provider.of<UserNotifier>(context, listen: false).getUserToken());
    setupNotification();
    _tabController = TabController(vsync: this, length: 3);
    _tabController.animateTo(_currentIndex);
  }

  void setupNotification() async {
    _firebaseMessaging.getToken().then((token) {
      var json = {"key": token};
      saveFCM(json);
    });

    _firebaseMessaging.configure(
      onMessage: (Map<String, dynamic> message) async {},
      onLaunch: (Map<String, dynamic> message) async {},
      onResume: (Map<String, dynamic> message) async {},
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Consumer<UserNotifier>(
        builder: (context, usermodel, child) {
          return TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: _tabController,
            children: <Widget>[
              usermodel.token == null ? LoginScreen() : Perfil(),
              MenuScreen(),
              RelProblemsScreen(),
            ],
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black38,
        iconSize: 28.0,
        elevation: 10.0,
        currentIndex: _currentIndex,
        onTap: (currentIndex) {
          setState(
            () {
              _currentIndex = currentIndex;
            },
          );

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
      ),
    );
  }
}
