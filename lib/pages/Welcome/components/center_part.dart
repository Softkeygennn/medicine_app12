import 'package:flutter/material.dart';

class CenterPart extends StatelessWidget {
  const CenterPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(child: Image.asset("images/15.jpg"),);
  }
}
