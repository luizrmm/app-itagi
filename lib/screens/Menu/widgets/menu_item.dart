import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String label;
  final String icon;
  final Widget route;
  MenuItem({this.label, this.icon, this.route});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => route));
      },
      child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6.0), color: Colors.white),
          padding: EdgeInsets.all(6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                icon,
                height: 50,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Text(
                  label,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 12.0),
                ),
              )
            ],
          )),
    );
  }
}
