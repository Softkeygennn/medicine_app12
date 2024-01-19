import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SingleCartItem extends StatefulWidget {
  final String productName;
 final String productImage;
  final double productPrice;
 final int productQuantity;
 final String productCategory;
 final String productId;
   const SingleCartItem({
    Key? key,
     required this.productId,
     required this.productCategory,
    required this.productName,
    required this.productQuantity,
    required this.productPrice,
    required this.productImage,

  }) : super(key: key);

  @override
  State<SingleCartItem> createState() => _SingleCartItemState();
}

class _SingleCartItemState extends State<SingleCartItem> {
  int quantity = 1;
  void quantityFunction(){
    FirebaseFirestore.instance
        .collection("Cart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("userCart")
        .doc(widget.productId)
        .update({
      "productQuantity": quantity,
    });
  }


  void deleteProductFunction(){
    FirebaseFirestore.instance
        .collection("Cart")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection("userCart")
        .doc(widget.productId)
        .delete();
  }
  @override
  Widget build(BuildContext context) {
   return Container(
      height: 150,
      width: double.infinity,

      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.green.withOpacity(0.5),
              blurRadius: 7,
            )
          ]
      ),
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(

                    decoration:  BoxDecoration(
                        color: Colors.green,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(widget.productImage),
                        )
                    ),
                  )
              ),
              Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         Text(
                         widget.productName,
                          style: const TextStyle(
                            fontSize: 18,
                          ),
                        ),
                          Text(
                            widget.productCategory,
                          style: const TextStyle(
                          ),
                        ),
                         Text(
                          "\$${widget.productPrice* widget.productQuantity}",
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            IncrementAndDecrement(
                              icon: Icons.add,
                              onPressed: (){
                                setState(() {
                                  quantity ++;
                                  quantityFunction();
                                });
                              },
                            ),
                            Text(
                              widget.productQuantity.toString(),
                            style: const TextStyle(
                              fontSize: 18,

                            ),),
                            IncrementAndDecrement(
                              icon: Icons.remove,
                              onPressed: (){
                                if (quantity>1){
                                  setState(() {
                                    quantity --;
                                    quantityFunction();
                                  });

                                }

                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )
              ),
            ],
          ),
          
          IconButton(
              onPressed: (){
            deleteProductFunction();
          },
              icon: Icon(Icons.close))
        ],
      ),
    );
  }
}
class IncrementAndDecrement extends StatelessWidget {
  final Function()? onPressed;
  final IconData icon;
  const IncrementAndDecrement({
    Key? key,
    required this.icon,
    required this.onPressed,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  MaterialButton(
      minWidth: 40,
      height:30,
      elevation: 2,
      color: Colors.green[300],
      onPressed: onPressed,

      shape:  RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Icon(icon),
    );
  }
}

