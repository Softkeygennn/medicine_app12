import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
class CartModel{

  final String productId;
  final String productImage;
  final String productName;
  final double productPrice;
 final int productQuantity;
  final String productCategory;
  CartModel({
    required this.productId,
    required this.productCategory,
    required this.productQuantity,
    required this.productImage,
    required this.productPrice,
    required this.productName,
});
  factory CartModel.fromDocument(QueryDocumentSnapshot doc ){
    return CartModel(
      productId: doc["productId"],
      productImage: doc["productImage"],
      productName: doc["productName"],
      productPrice: doc["productPrice"],
      productQuantity:  doc["productQuantity"],
      productCategory: doc["productCategory"],
    );
  }
}