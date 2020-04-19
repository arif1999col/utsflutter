import 'package:flutter/material.dart';
import 'package:uts/styles/color_style.dart';

class HeaderComponent extends StatelessWidget {

  final String title;

  var gradient1;
  var gradient2;

  HeaderComponent({this.title, this.gradient1, this.gradient2});

  @override
  Widget build(BuildContext context) {
    final double statusbarHeight = MediaQuery
        .of(context)
        .padding
        .top;

    return Positioned(
        top: 0.0,
        left: 0.0,
        right: 0.0,
        child: Container(
          height: statusbarHeight + 50.0,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [gradient1, gradient2]
            )
          ),
          child: AppBar(
            title: Text(
              title,
              textAlign: TextAlign.center,
            ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        )
    );
  }
}