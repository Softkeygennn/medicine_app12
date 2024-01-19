import 'package:flutter/material.dart';
import 'package:flutter/src/material/badge.dart';
import 'package:pharma_med/pages/CartPage.dart';
class HomeAppBar extends StatelessWidget {
  const HomeAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(25),
      child:  Row(
        children: [
          /*const Icon(
            Icons.sort,
            size: 30,
            color: Color(0xFF4C53A5),
          ),*/
          const Padding(
              padding: EdgeInsets.only(
                left: 20,
              ),
            child: Text(
              "Pharma Med",
              style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF4C53A5,
                  ),),
            ),

          ),
           const Spacer(),
           Badge(

            backgroundColor: Colors.red,
            padding:  const EdgeInsets.all(7),
            child: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage()));
              } ,
              child:  const Icon(
                Icons.shopping_bag_outlined,
                size: 32,
                color: Color(0xFF4C53A5),
              ),
            ),
          ),
        ],

      ),
    );
  }
}
