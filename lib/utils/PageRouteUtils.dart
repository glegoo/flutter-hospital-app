import 'package:flutter/material.dart';

routePage(BuildContext context, Widget page) {
  Navigator.of(context).push(MaterialPageRoute(builder: (context) => page));
}
