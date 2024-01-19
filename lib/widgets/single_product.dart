import 'package:flutter/material.dart';
import 'package:pharma_med/pages/Homepage.dart';

class SingleProduct extends StatefulWidget {
  final String image;
  final double price;
  final String name;
  final Function()? onTap;

  const SingleProduct({
    Key? key,
    required this.onTap,
    required this. image,
    required this.name,
    required this. price,
  }) : super(key: key);

  @override
  State<SingleProduct> createState() => _SingleProductState();
}

class _SingleProductState extends State<SingleProduct> {
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: widget.onTap,
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            height: size!.height*0.3,
            width: size!.width/2-20,
            decoration: BoxDecoration(
             image: DecorationImage(
               fit: BoxFit.cover,
               image:NetworkImage(widget.image)
              ),
              borderRadius: BorderRadius.circular(20),
            ),

          ),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Text(
                 widget.name,
                 style: const TextStyle(
                   fontWeight: FontWeight.normal,
                 ),
               ),

                 Text(
                 "Rs ${widget.price}",
                 style: const TextStyle(
                   fontWeight: FontWeight.bold,
                 ),
               ),


             ],
           ),
        ],
      ),
    );
  }
}