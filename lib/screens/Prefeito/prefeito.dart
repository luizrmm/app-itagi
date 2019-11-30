import 'package:flutter/material.dart';

class Prefeito extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Prefeito'),
        centerTitle: true,
      ),
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints viewportConstraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints:
                  BoxConstraints(minHeight: viewportConstraints.maxHeight),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                    child: Image.asset(
                      'assets/prefeito.png',
                      height: 120,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      '       Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam tincidunt lacus ut mi molestie, vel bibendum erat cursus. Suspendisse potenti. Duis dapibus tincidunt tellus, a tempus ante dapibus ut. Etiam volutpat et metus quis sodales. Proin eget tincidunt nisi. Nam porttitor laoreet mauris iaculis porta. Curabitur tempus placerat lectus in lobortis.\n\n         Sed posuere a erat vel viverra. Donec in finibus ipsum, sed dictum orci. Donec vitae arcu ac quam ullamcorper faucibus. Duis commodo finibus massa, et ultrices nisi gravida ac. Proin lectus tortor, laoreet sit amet varius ac, iaculis non nisi.',
                      textAlign: TextAlign.justify,
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
