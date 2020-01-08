import 'package:flutter/material.dart';

class SubAppBtn extends StatelessWidget {
  final String title;
  final String iconName;
  final Color backgroundColor;
  final Function buttonClick;

  const SubAppBtn(
      {Key key,
      this.title,
      this.iconName,
      this.backgroundColor,
      this.buttonClick})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width / 4,
      child: new FlatButton(
        child: new Container(
          child: new Column(
            children: <Widget>[
              new Container(
                padding: EdgeInsets.all(10),
                height: (MediaQuery.of(context).size.width / 4 - 40) * 1,
                width: MediaQuery.of(context).size.width / 4 - 40,
                decoration: BoxDecoration(
                  color: this.backgroundColor,
                  borderRadius: BorderRadius.all(
                    Radius.circular(15.0),
                  ),
                ),
                child: Image.asset("static/icons/" + this.iconName + ".png",
                    fit: BoxFit.contain),
                // child: Padding(
                // ),
              ),
              Text(
                this.title,
                style: TextStyle(
                  fontSize: 11,
                  backgroundColor:
                      buttonClick == null ? Colors.red[200] : Color(0x00),
                ),
              ),
            ],
          ),
        ),
        onPressed: () {
          if (buttonClick != null) buttonClick();
        },
      ),
    );
  }
}
