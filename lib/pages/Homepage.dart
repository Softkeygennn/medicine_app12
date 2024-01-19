import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar.dart';
import 'package:curved_labeled_navigation_bar/curved_navigation_bar_item.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharma_med/appColors/app_colors.dart';
import 'package:pharma_med/model/user_model.dart';
import 'package:pharma_med/pages/detailPage/details_page.dart';
import 'package:pharma_med/widgets//HomeAppBar.dart';
import 'package:pharma_med/widgets/CategoriesWidget.dart';
import 'package:pharma_med/widgets/ItemsWidgets.dart';
import 'package:pharma_med/widgets/build_drawer.dart';
import 'package:pharma_med/widgets/grid_view_widget.dart';
import 'package:pharma_med/widgets/single_product.dart';

import 'CartPage.dart';
   late UserModel userModel;

Size? size;
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  bool loading=false;
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

  Future getCurrentUserDataFunction() async {
    await FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then(
          (DocumentSnapshot documentSnapshot) {
        if (documentSnapshot.exists) {
          userModel = UserModel.fromDocument(documentSnapshot);
          setState(() {
            loading=false;
          });
        } else {
          print("Document does not exist the database");
        }
      },
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentUserDataFunction();
  }


  Widget buildCategory(){
    return Column(
      children: [
        const ListTile(
            leading: Text(
              "Categories",
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Color(0xFF4C53A5),
              ),
            )
        ),
        Container(
          height: size!.height*0.1+20,
          child: StreamBuilder(
              stream: FirebaseFirestore.instance.collection("categories").snapshots(),
              builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                if(!streamSnapshot.hasData){
                  return  const Center(child: CircularProgressIndicator());
                }
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount: streamSnapshot.data!.docs.length,
                    itemBuilder: (ctx, index){
                      return Categories(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> GridViewWidgets(
                            collection: streamSnapshot.data!.docs[index]["categoryName"],
                            id: streamSnapshot.data!.docs[index].id,
                          )));
                        },
                        categoryName: streamSnapshot.data!.docs[index]["categoryName"],
                        image: streamSnapshot.data!.docs[index]["categoryImage"],
                      );
                    });}
          ),

        ),
      ],
    );
  }
  Widget buildProduct({required Stream<QuerySnapshot<Map<String,dynamic>>>?stream}){
   return Container(
     height: size!.height/3+40,
      child: StreamBuilder(

          stream:  FirebaseFirestore.instance.collection("products").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
            if(!streamSnapshot.hasData){
              return  const Center(child: CircularProgressIndicator());
            }
            var varData = searchFunction(query, streamSnapshot.data!.docs);

            return result.isEmpty?
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
                },
                );
    }
      ),

   );
  }


  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return loading?const Center(child: CircularProgressIndicator()):

    Scaffold(

      drawer: const BuildDrawer(
      ),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
       title: const Text(
         "Pharma Med",
         style: TextStyle(
           fontSize: 23,
           fontWeight: FontWeight.bold,
           color: Color(0xFF4C53A5,
           ),),
       ),
       centerTitle: false,
       actions: [
         Padding(
           padding: const EdgeInsets.only(right: 8.0),
           child: Badge(
             backgroundColor: Colors.red,
             padding:  const EdgeInsets.all(7),
             child: InkWell(
               onTap: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>const CartPage()));
               } ,
               child:  const Icon(
                 Icons.shopping_bag_outlined,
                 size: 32,
                 color: Color(0xFF4C53A5),
               ),
             ),
           ),
         ),
       ],

      ),
      body: ListView(children: [
        // const HomeAppBar(),
        Container(
         // height: 500,
          padding: const EdgeInsets.only(top: 15),
          decoration: const BoxDecoration(
              color: Color(0xFFEDECF2),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(35),
                topRight: Radius.circular(35),
              )
          ),
          child: Column(children: [
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




           query==""? Column(
              children: [
                buildCategory(),
                const ListTile(
                    leading: Text(
                      "Feature Products",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4C53A5),
                      ),
                    )
                ),
                buildProduct(
                  stream: FirebaseFirestore.instance.collection("products").snapshots(),
                ),
              ],
            ): StreamBuilder(

               stream:FirebaseFirestore.instance
                   .collection("products")
                   .snapshots(),
               builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
                 if(!streamSnapshot.hasData){
                   return  const Center(child: CircularProgressIndicator());
                 }
                 return GridView.builder(
                   itemCount: result.length,
                     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                       crossAxisCount: 2,
                       crossAxisSpacing: 5.0,
                       mainAxisSpacing: 5.0,
                     ),
                     itemBuilder: (ctx, index){
                       var varData = searchFunction(query, streamSnapshot.data!.docs);
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
                     }

                 )

                 ;}
           ),
            //Category




          ],

          ),
        ),
      ],
      ),

      bottomNavigationBar: CurvedNavigationBar(
        height: 70,
        buttonBackgroundColor: Colors.redAccent,
        color: Colors.white,
        backgroundColor: const Color(0xFF4C53A5).withOpacity(0.2),
        index: 2,
        items: const [
          CurvedNavigationBarItem(
              child:Icon(

                Icons.shopping_cart,
              color: Colors.black54,
              ),),
          CurvedNavigationBarItem(
            child:Icon(
              Icons.home_filled,
              color: Colors.black54,
            ),),
          CurvedNavigationBarItem(
            child:Icon(

              Icons.person,
              color: Colors.black54,
            ),),
        ],
      ),

    );
  }
}


class Categories extends StatelessWidget {
  final String image;
  final String categoryName;
  final Function()? onTap;
  const Categories({
    Key? key,
    required this.onTap,
    required this.categoryName,
    required this.image
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(12),
        width: size!.width/2-20,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(image,),
          ),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.black.withOpacity(0.7),
          ),
          child: Center(
            child: Text(categoryName,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}