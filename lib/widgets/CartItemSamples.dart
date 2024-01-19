// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// class CartItemSamples extends StatelessWidget {
//   const CartItemSamples (Container container, {Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         for(int i=1; i<4; i++)
//         Container(
//     margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 10),
//     padding: const EdgeInsets.all(15),
//     decoration:  BoxDecoration(
//     color: Colors.white,
//     borderRadius: BorderRadius.circular(20),
//         ),
//         child: Row(
//           children: [
//             Radio(value: "",
//                 groupValue: "",
//                 onChanged: (index) {},
//             ),
//             Container(
//               height: 70,
//               width: 70,
//               margin: const EdgeInsets.only(right: 15),
//               child: Image.asset("images/$i.png"),
//             ),
//             const Padding(
//               padding: EdgeInsets.symmetric(vertical: 10),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                       "Product Title",
//                        style: TextStyle(
//                         fontSize: 18,
//                         fontWeight: FontWeight.bold,
//                        color: Color(0xFF4C53A5),
//                       ),
//                     ),
//                 Text(
//                   "\$55",
//                   style: TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF4C53A5),
//                   ),
//                 ),
//               ],
//
//             ),
//           ),
//            // Spacer(),
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 5),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.end,
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Icon(
//                       Icons.delete,
//                       color: Colors.red,
//                     ),
//                     Row(
//                       children: [
//                         Container(
//                           padding: const EdgeInsets.all(4),
//                           decoration:  BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 1,
//                                 blurRadius: 10,
//                               ),
//                             ],
//                         ),
//                           child: const Icon(
//                             CupertinoIcons.minus,
//                             size: 18,
//                           ),
//                         ),
//                         Container(
//                           margin: const EdgeInsets.symmetric(horizontal: 10),
//                           child: const Text(
//                             "01",
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: Color(0xFF4C53A5),
//                             ),
//                           ),
//                         ),
//                         Container(
//                           padding:  const EdgeInsets.all(4),
//                           decoration:  BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(20),
//                             boxShadow: [
//                               BoxShadow(
//                                 color: Colors.grey.withOpacity(0.5),
//                                 spreadRadius: 1,
//                                 blurRadius: 10,
//                               ),
//                             ],
//                           ),
//                           child: const Icon(
//                             CupertinoIcons.plus,
//
//                             size: 18,
//                           ),
//                         ),
//                       ],
//                     )
//                   ],
//             ),
//             ), ],
//         ),
//         ),
//       ],
//     );
//   }
// }
