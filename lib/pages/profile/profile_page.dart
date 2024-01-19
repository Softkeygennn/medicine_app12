import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharma_med/pages/Homepage.dart';
import 'package:pharma_med/widgets/MyButton.dart';

class ProfilePage extends StatefulWidget {

   static Pattern pattern =
       r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';

   RegExp regExp = RegExp(ProfilePage.pattern.toString());

  ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool isEdit = false;
  TextEditingController fullName =
  TextEditingController(text: userModel!.fullName);
  TextEditingController emailAddress =
  TextEditingController(text: userModel!.emailAddress);

  Widget textFromField({required String hintText}){
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[300],
      ),
      child: ListTile(
        leading: Text(hintText),
      ),
    );
  }

  void profileValidation(
      {required TextEditingController? emailAddress,
        required TextEditingController? fullName,
        required BuildContext context}) async {
    if (fullName!.text.trim().isEmpty) {
    ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(
    content: Text("FullName is empty"),
    ),
    );
    return;
    }
    else if (emailAddress!.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Email address is empty"),
        ),
      );
      return;
    } else if (!widget.regExp.hasMatch(emailAddress.text.trim())) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Invalid email address"),
        ),
      );
      return;
    }  else {
      buildUpdateProfile();
    }
  }

  Widget nonEditTextField(){
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/unnamed.jpg"),
              radius: 50,
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        textFromField(hintText: userModel!.fullName),
        const SizedBox(
          height: 10,
        ),
        textFromField(hintText: userModel!.emailAddress),
      ],
    );
  }

  Widget editTextField(){
    return Column(
      children: [
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              backgroundImage: AssetImage("images/unnamed.jpg"),
              radius: 50,
            )
          ],
        ),
        TextFormField(
          controller: fullName,
          decoration: const InputDecoration(
            hintText: "fullName",
          ),
        ),
        TextFormField(
          controller: emailAddress,
          decoration: const InputDecoration(
            hintText:"emailAddress",
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        MyButton(onPressed: (){
          profileValidation(
              emailAddress: emailAddress,
               context: context,
             fullName: fullName,

          );
        },
            text: "up date",

        ),
      ],
    );
  }

  Future buildUpdateProfile() async {
    FirebaseFirestore.instance
        .collection("user")
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .update({
      "fullName" :fullName.text,
      "emailAddress": emailAddress.text,
    }

    ).then((value) =>  Navigator.push(context, MaterialPageRoute(builder: (context)=>const HomePage())
    )
    );

    }
  // RoutingPage.goTonext(
  // context: context,
  // navigateTo: HomePage(),
  // ),
  // );

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        elevation: 0,
          backgroundColor: Colors.transparent,
        leading: isEdit?
        IconButton(onPressed: (){
          setState(() {
            isEdit= false;
          });
        },
          icon:const Icon(Icons.close
          ),
        ) : IconButton(
          onPressed: (){
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: (){
              setState(() {
                isEdit= true;
              });
            },
              icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                 Expanded(
                    child: isEdit? editTextField() :nonEditTextField()
                ),

              ],
            ),
          )
      ),
    );
  }
}
