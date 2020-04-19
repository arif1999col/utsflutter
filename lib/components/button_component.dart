import 'package:flutter/material.dart';

class ButtonComponent extends StatelessWidget {

  String text = '';
  var gradient1;
  var gradient2;
  final GestureTapCallback _onPress;

  ButtonComponent(this.text, this.gradient1, this.gradient2, this._onPress);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: RaisedButton(
        onPressed: _onPress,
        textColor: Colors.white,
        padding: EdgeInsets.all(0.0),
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(80.0)),
        child: Container(
          width: 500,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: <Color>[
                  gradient1,
                  gradient2,
                ],
              ),
              borderRadius: BorderRadius.all(Radius.circular(80.0))
          ),
          padding: EdgeInsets.all(16.0),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}