import 'package:flutter/material.dart';
import 'package:pharma_med/pages/Signup/signup_page.dart';


import '../../../widgets/Mybutton.dart';


class EndPart extends StatelessWidget {
  final void Function()? onPressed;
  final bool loading;
  const EndPart({
    required this.onPressed,
    required this.loading,
    Key? key, }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        loading==true?
            const CircularProgressIndicator():
        MyButton(
          onPressed: onPressed,
          text: "LOG IN",
        ),
        const SizedBox(height: 20,),
         Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Don't have an account?\t\t"),
            GestureDetector(
              onTap: (){
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const SignUpPage(),
                  ),
                );
                /*RoutingPage.goTonext(context: context, navigateTo: const SignUpPage(),
                );*/

              },
                child: const Text("SIGN UP"),
            ),
          ],
        )
      ],
    );
  }
}
