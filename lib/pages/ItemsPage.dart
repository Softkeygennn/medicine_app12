// import 'package:clippy_flutter/clippy_flutter.dart';
// import 'package:flutter/material.dart';
// import 'package:pharma_med/widgets/ItemBottomNavBar.dart';
// import 'package:pharma_med/widgets/ItemsAppBar.dart';
//
// class ItemsPage extends StatelessWidget {
//    ItemsPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFEDECF2),
//       body: ListView(
//         children: [
//           ItemsAppBar(),
//           Padding(
//               padding:  const EdgeInsets.all(16),
//             child: Image.asset("images/1.png", height: 300),
//
//           ),
//           Arc(
//             edge: Edge.TOP,
//               arcType: ArcType.CONVEY,
//               height: 30,
//               child: Container(
//                 width: double.infinity,
//                 color: Colors.white,
//                 child:   const Padding(
//                   padding: EdgeInsets.symmetric(horizontal: 20),
//                   child: Column(
//                     children: [
//                       Padding(
//                           padding: EdgeInsets.only(
//                             top: 48,
//                             bottom: 15,
//                           ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Medicine Name",
//                               style: TextStyle(
//                                   fontSize: 28,
//                                   color: Color(0xFF4C53A5),
//                                   fontWeight: FontWeight.bold
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       Padding(
//                           padding:  EdgeInsets.symmetric(horizontal: 12),
//                           child: Text(
//                             'This is the complete description of the product you can write more here about the product.You can write everything about the product',
//                             style: TextStyle(
//                               fontSize: 17,
//                               color: Color(0xFF4C53A5),
//                             ),
//                           )
//                       ),
//                     ],
//                   ),
//             ),
//               ),
//             ),
//         ],
//       ),
//       bottomNavigationBar: ItemBottomNavBar(),
//     );
//   }
// }
