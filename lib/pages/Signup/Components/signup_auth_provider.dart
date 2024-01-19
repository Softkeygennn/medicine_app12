
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharma_med/pages/Homepage.dart';


class SignupAuthProvider with ChangeNotifier {
  late UserCredential? userCredential;


  bool loading = false;
  void signupValidation(
  {
    required TextEditingController? fullName,
    required TextEditingController? emailAddress,
    required TextEditingController? password,
    required BuildContext context,
  })  async{
    if(fullName!.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text("Full name is empty"),
        ),
      );
      return;
    }
    if(emailAddress!.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email address is empty"),
        ),
      );
      return;
    }
    else if(emailAddress!.text.trim().isEmpty){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid email address"),
        ),
      );
      return;
  }
    else if(password!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password is empty"),
        ),
      );
      return;
    }
    else if(password.text.length <8){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password must be 8"),
        ),
      );
      return;
    }
  else{
   try {
     loading = true;
     notifyListeners();
     userCredential =
     await FirebaseAuth.instance.createUserWithEmailAndPassword(
       email: emailAddress.text,
       password: password.text,
     );
     loading = true;
     notifyListeners();
     FirebaseFirestore.instance.
     collection("user").
     doc(userCredential!.user!.uid).
     set(
       {
         "fullName": fullName.text.toString(),
         "emailAddress": emailAddress.text.toString(),
         "password": password.text.toString(),
         "userUid": userCredential!.user!.uid,
       },
     ).then((value) {
       loading = false;
       notifyListeners();
       Navigator.of(context).push(
           MaterialPageRoute(
             builder: (context) => const HomePage(),
           ),
       );
     });
   } on FirebaseAuthException catch(e){
     loading= false;
     notifyListeners();
     if(e.code == "weak password") {
       ScaffoldMessenger.of(context).showSnackBar(
         const SnackBar(
           content: Text("weak password"),
         ),
       );
     } else if (e.code== "email-already-taken"){
       ScaffoldMessenger.of(context).showSnackBar(
           const SnackBar(
             content: Text("email-already-taken"),
           ),
       );
     }
     }
   }
    }
  }
