import 'package:flutter/material.dart';

class TopPart extends StatelessWidget {
  final String productImage;
  const TopPart({
    required this.productImage,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
      child:  Container(

        width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(image: NetworkImage(productImage),),
      ),
      ),);
  }
}
