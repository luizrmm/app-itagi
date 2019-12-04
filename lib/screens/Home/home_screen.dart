import 'package:aqui_cliente/notifiers/home_notifier.dart';
import 'package:aqui_cliente/screens/Login/login_screen.dart';
import 'package:aqui_cliente/screens/Menu/menu.dart';
import 'package:aqui_cliente/screens/Relatar_problemas/relatar_problemas.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int cIndex = Provider.of<HomeNotifier>(context).currentIndex;
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: IndexedStack(
          index: cIndex,
          children: <Widget>[
            LoginScreen(),
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
