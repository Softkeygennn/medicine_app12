import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharma_med/pages/CartPage.dart';
import 'package:pharma_med/widgets/MyButton.dart';

class SecondPart extends StatelessWidget {
  final double productPrice;
  final String productName;
  final double oldPrice;
  final String productDescription;
  final String productId;
  final String productImage;
  final String productCategory;

  const SecondPart({
    required this.productCategory,
    required this.oldPrice,
    required this.productImage,
    required this.productDescription,
    required this.productName,
    required this.productPrice,
    required this.productId,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Expanded(
        flex: 2,
        child: Column(

          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
             Text(
              productName,
              style: const TextStyle(
                fontSize: 20,

                fontWeight: FontWeight.bold,
              ),
            ),
             Row(
              children: [
                Text(
                  "\$$productPrice",


                ),
                const SizedBox(width: 20,),
                Text(
                  "\$$oldPrice",
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                  ),
                ),

              ],
            ),
            // const Divider(
            //   thickness: 2,
            // ),
            // Row(
            //   children: [
            //     Container(
            //       height: 40,
            //       width: 40,
            //
            //       decoration: BoxDecoration(
            //         color: AppColors.kgradient1,
            //         borderRadius: BorderRadius.circular(10),
            //       ),
            //       child: const Center(
            //         child: Text(
            //           "4.5",
            //           style: TextStyle(
            //             color: AppColors.kwhiteColor,
            //           ),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            const Divider(
              thickness: 2,
            ),
            const Text(
              "Description",
              style: TextStyle(
                fontWeight: FontWeight.bold,

              ),
            ),
             Text(
              productDescription,
              style: const TextStyle(

              ),
            ),
            MyButton(
              onPressed: (){
                FirebaseFirestore.instance.
                collection("Cart").
                doc(FirebaseAuth.instance.currentUser!.uid).
                collection("userCart").
                doc(productId)
                    .set(
                    {

                      "productId":productId ,
                      "productImage":productImage,
                      "productName" : productName,
                      "productPrice" : productPrice,
                      "oldPrice" : oldPrice,
                      "productDescription" : productDescription,
                      "productQuantity" : 1,
                      "productCategory": productCategory,

                    }
                );
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartPage()));
              },
              text: "Add To Cart",
            )
          ],
        ));
  }
}
