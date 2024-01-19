import 'package:flutter/material.dart';
import 'package:pharma_med/pages/forgotPassword/forgot_password.dart';

class CenterPart extends StatelessWidget {
 final TextEditingController? email;
 final bool obscureText;
  final TextEditingController? password;
  final Widget icon;
  final void Function()? onPressed;
   const CenterPart({
     required this.obscureText,
     required this.icon,
    required this.email,
   required this.password,
     required this.onPressed,
    Key? key}) :
         super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextFormField(
          controller: email,
          decoration: const InputDecoration(
            hintText: "Email Address",
          ),
        ),
        TextFormField(
          obscureText: obscureText,
          controller: password,
          decoration: InputDecoration(
            counter: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>const ForgotPassword(),
                ));

              },
              child: const Text("forgot password?",
              style: TextStyle(
                color: Colors.blue,
              ),),
            ),

            hintText: "Password",
            suffixIcon: IconButton(
              onPressed: onPressed,
              icon: icon,
            ),
          ),
        ),
      ],
    );
  }
}
