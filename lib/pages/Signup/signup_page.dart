import 'package:flutter/material.dart';
import 'package:pharma_med/pages/Signup/Components/signup_auth_provider.dart';
import 'package:pharma_med/pages/login/login_page.dart';

import 'package:pharma_med/widgets/Mybutton.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {

  TextEditingController fullName = TextEditingController();
      TextEditingController emailAddress = TextEditingController();
  TextEditingController password = TextEditingController();

  bool visibility = false;



  @override
  Widget build(BuildContext context) {

    SignupAuthProvider signupAuthProvider = Provider.of<SignupAuthProvider>(context);

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const Text("Sign Up",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
              ),
              Column(
                children: [
                  TextFormField(
                    controller: fullName,
                    decoration: const InputDecoration(
                      hintText: "Full Name",
                    ),
                      validator: (value){
                        if(value!.isEmpty) {
                          return 'name';
                        }
                        return null;
                      }
                  ),
                  TextFormField(
                    controller: emailAddress,
                    decoration: const InputDecoration(
                      hintText: "Email Address",
                    ),
                      validator: (value){
                        if(value!.isEmpty) {
                          return 'enter email';
                        }
                        return null;
                      }
                  ),
                  TextFormField(
                    controller: password,
                    obscureText: visibility,
                    decoration: InputDecoration(
                      hintText: "Password",
                      suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              visibility=!visibility;
                            });
                          },
                        icon: Icon(
                            visibility? Icons.visibility: Icons.visibility_off),
                      ),
                    ),
                      validator: (value){
                        if(value!.isEmpty) {
                          return 'enter password';
                        }
                        return null;
                      }
                  ),
                ],
              ),
              Column(
                children: [
                  signupAuthProvider!.loading== false?
                  MyButton(
                      onPressed: (){
                        signupAuthProvider.signupValidation(
                            fullName: fullName,
                            context: context,
                            emailAddress: emailAddress,
                            password: password
                        );

                      },
                      text: "SIGN UP"
                  ): const Center(
                    child: CircularProgressIndicator(),
                  ),
                  const SizedBox(height: 20,),
                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?\t\t"),
                      GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const LoginPage(),
                                ),);
                          },
                          child: const Text("LOGIN"))
                    ],
                  )
                ],
              )
            ],
          ),
        ),

      ),
    );
  }
}
