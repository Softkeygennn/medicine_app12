import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharma_med/pages/CartPage.dart';
import 'package:pharma_med/pages/Homepage.dart';
import 'package:pharma_med/pages/login/login_page.dart';
import 'package:pharma_med/pages/profile/profile_page.dart';

class BuildDrawer extends StatelessWidget {
  const BuildDrawer({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration:  const BoxDecoration(
              color: Colors.purple,
            ),
            accountName: Text(userModel!.fullName),
            accountEmail: Text(userModel!.emailAddress),
            currentAccountPicture: const CircleAvatar(
              backgroundImage: AssetImage("images/non_profile.jpg"),
            ),
          ),
          ListTile(
            onTap: () {

              FirebaseAuth.instance.signOut().then(
                    (value) => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context)=>  ProfilePage(),
                  ),
                ),
              );
            },
            leading: const Icon(
              Icons.person,
            ),
            title: const Text("Profile"),
          ),
          ListTile(
            onTap: () {

              FirebaseAuth.instance.signOut().then(
                    (value) => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context)=> const CartPage(),
                  ),
                ),
              );
            },
            leading: const Icon(
              Icons.shopping_cart_rounded,
            ),
            title: const Text("Cart"),
          ),

          ListTile(
            onTap: () {
              FirebaseAuth.instance.signOut().then(
                    (value) => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const LoginPage(),
                  ),
                ),
              );
            },
            leading: const Icon(
              Icons.exit_to_app,
            ),
            title: const Text("Log out"),
          )
        ],
      ),
    );
  }
}

