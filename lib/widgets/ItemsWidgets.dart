// import 'package:flutter/material.dart';
// import 'package:pharma_med/pages/ItemsPage.dart';
// class ItemsWidgets extends StatelessWidget {
//   const ItemsWidgets({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return  GridView.count(
//         childAspectRatio: 0.68,
//         // it disable this scroll functionality of gridview
//       // then it will scroll in list view of home page
//         physics: const NeverScrollableScrollPhysics(),
//         crossAxisCount: 2,
//       shrinkWrap: true,
//       children: [
//         for( int i= 1; i<7; i++)
//         Container(
//           padding: const EdgeInsets.only(left: 15, right: 10.0),
//           margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: BorderRadius.circular(20),
//           ),
//           child:  Column(
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Container(
//                     padding: const EdgeInsets.all(4),
//                     decoration: BoxDecoration(
//                       color: const Color(0xFF4C53A5),
//                         borderRadius: BorderRadius.circular(20),
//                     ),
//                     child: const Text(
//                       "50%",
//                       style: TextStyle(
//                         fontSize: 14, color: Colors.white,
//                       ),
//                     ),
//                   ),
//                    const Icon(
//                     Icons.favorite_border,
//                     color: Colors.red,
//                   ),
//                 ],
//               ),
//               InkWell(
//                 onTap: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemsPage()));
//                 },
//                 child: Container(
//                   margin: const EdgeInsets.all(10),
//                   child: Image.asset(
//                       "images/$i.png",
//                     height: 120,
//                     width: 120,
//                   ),
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.only(bottom: 8),
//                 alignment: Alignment.center,
//                 child: const Text(
//                   "Medicine Title",
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 18,
//                     color: Color(0xFF4C53A5),
//                   ),
//                 ),
//               ),
//
//               const Padding(padding: EdgeInsets.symmetric(vertical: 10),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "\$55",
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF4C53A5),
//                     ),
//                   ),
//                   Icon(Icons.shopping_cart_checkout,
//                     color: Color(0xFF4C53A5),
//                   )
//                 ],
//               ),
//
//               ),
//
//
//             ],
//           ),
//         )
//       ],
//     );
//   }
// }
