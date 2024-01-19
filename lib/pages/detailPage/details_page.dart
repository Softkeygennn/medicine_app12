import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:pharma_med/appColors/app_colors.dart';
import 'package:pharma_med/pages/detailPage/components/second_part.dart';
import 'package:pharma_med/pages/detailPage/components/top_part.dart';
import 'package:pharma_med/widgets/MyButton.dart';

class DetailsPage extends StatelessWidget {
  final String productImage;
  final double productPrice;
  final String productName;
  final double oldPrice;
  final String productDescription;
  final String productId;
  final String productCategory;


  const DetailsPage({
    required this.productCategory,
    required this.oldPrice,
    required this.productImage,
    required this.productName,
    required this.productPrice,
    required this.productId,

    Key? key, required this.productDescription
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body:  Padding(
        padding: EdgeInsets.symmetric(horizontal: 15,),
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopPart(
            productImage: productImage,
            ),
           SecondPart(
             productName: productName,
             productImage: productImage,
             productPrice:productPrice,
             oldPrice: oldPrice,
             productDescription: productDescription,
             productId: productId,
             productCategory: productCategory,
           ),



          ],
        ),
      ),
    );
  }
}
