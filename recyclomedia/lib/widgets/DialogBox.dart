import 'package:flutter/material.dart';

class DialogBoxes extends StatefulWidget {

  final String errorType;
  final String message;
  final bool showSecondaryButton;

  const DialogBoxes({Key key, this.errorType, this.message, this.showSecondaryButton}) : super(key: key);

  @override
  _DialogBoxesState createState() => _DialogBoxesState();
}

class _DialogBoxesState extends State<DialogBoxes> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
//          color: Colors.black,
          image: DecorationImage(

            image: AssetImage("lib/assets/images/alertBox.png"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding:  EdgeInsets.all(15.0),
              child: Text('Cool', style: TextStyle(color: Colors.red),),
            ),
            Padding(
              padding: EdgeInsets.all(15.0),
              child: Text('Awesome', style: TextStyle(color: Colors.red),),
            ),
            Padding(padding: EdgeInsets.only(top: 50.0)),
            FlatButton(onPressed: (){
              Navigator.of(context).pop();
            },
                child: Text('Got It!', style: TextStyle(color: Colors.purple, fontSize: 18.0),))
          ],
        ),
      ),
    );
  }
}


