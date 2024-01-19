import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:pharma_med/appColors/app_colors.dart';
import 'package:pharma_med/pages/detailPage/details_page.dart';
import 'package:pharma_med/widgets/single_product.dart';



class GridViewWidgets extends StatefulWidget {
  final String id;
  final String collection;

  const GridViewWidgets({
    Key? key,
    required this.id,
    required this.collection,
  }) : super(key: key);

  @override
  State<GridViewWidgets> createState() => _GridViewWidgetsState();
}

class _GridViewWidgetsState extends State<GridViewWidgets> {

  String query ="";
  var result;

  searchFunction(query,searchList){
    result = searchList.where((element){
      return element ["productName"].toLowerCase().contains(query)||
          element ["productName"].toUpperCase().contains(query)||
          element ["productName"].toUpperCase().contains(query)&&
              element ["productName"].toLowerCase().contains(query);
    }).toList();
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: StreamBuilder(
          stream:  FirebaseFirestore.instance.
          collection("categories").
          doc(widget.id).
          collection(widget.collection).
          snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
            if(!snapshot.hasData){
              return const Center(child: CircularProgressIndicator(),);
            }
            var varData = searchFunction(query, snapshot.data!.docs);
            return Column(
              children: [
            Padding(
                    padding: const EdgeInsets.all(8.0),
                  child: Material(
                    elevation: 7,
                    shadowColor: Colors.grey[300],
                    child: TextFormField(
                      onChanged: (value){
                        setState(() {
                          query = value;
                        });

                        },
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        fillColor: AppColors.kwhiteColor,
                        hintText: "search Your Product",
                        filled: true,border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                      ),
                      ),
                    ),
                  ),
                ),


             result.isEmpty?
            const Center(child: Text("Not Found")):
            GridView.builder(
            shrinkWrap: true,
            itemCount: result.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 5.0,
            mainAxisSpacing: 5.0,
            childAspectRatio: 0.6,

            ),
            itemBuilder: (ctx, index){

            var data = varData[index];
            return SingleProduct(
            onTap: (){
            Navigator.push(context,
            MaterialPageRoute(
            builder: (context)=>
            DetailsPage(
            productId: data["productId"],

            productImage: data["productImage"],
            productName: data["productName"],
            productPrice: data["productPrice"],
            oldPrice: data["oldPrice"],
            productDescription: data["productDescription"],
            productCategory:  data["productCategory"],

            )
            ));
            },
            image: data["productImage"],
            name: data["productName"],
            price: data["productPrice"],
            );
            }),
              ],
            );
          }
      ),
    );
  }
}
