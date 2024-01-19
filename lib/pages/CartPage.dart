import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharma_med/pages/checkout/check_out_page.dart';
import 'package:pharma_med/pages/detailPage/details_page.dart';
import 'package:pharma_med/pages/provider/cart_provider.dart';
import 'package:pharma_med/widgets/MyButton.dart';
import 'package:pharma_med/widgets/single_cart_item.dart';
import 'package:pharma_med/widgets/single_product.dart';
import 'package:provider/provider.dart';
class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    cartProvider.getCartData();
    return  Scaffold(
      bottomNavigationBar: cartProvider.getCartList.isEmpty? Text(""): MyButton(
        text: "Check Out",
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(
              builder: (context)=> const CheckOutPage(),
              ));
        },
      ),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body:  cartProvider.getCartList.isEmpty?const Center(child: Text("No Product"),)

      :ListView.builder(

                physics: const BouncingScrollPhysics(),
                itemCount: cartProvider.getCartList.length,
                itemBuilder: (ctx, index){

    var data = cartProvider.cartList[index];
    return SingleCartItem(
    productId: data.productId,
    productImage: data.productImage,
    productName: data.productName,
    productPrice: data.productPrice,
    productQuantity: data.productQuantity,
    productCategory: data.productCategory,

    );
    }
    ),
    );
  }
}

