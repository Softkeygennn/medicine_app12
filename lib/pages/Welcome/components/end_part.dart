import 'package:flutter/material.dart';
import 'package:pharma_med/appColors/app_colors.dart';
import 'package:pharma_med/pages/Signup/signup_page.dart';
import 'package:pharma_med/pages/login/login_page.dart';

import 'package:pharma_med/widgets/mybutton.dart';

class EndPart extends StatelessWidget {
  const EndPart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        MyButton(
            onPressed: ()
    {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
            },
            text: "LOG IN"
        ),
        const SizedBox(
          height: 20,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const SignUpPage(),
              ),
            );
          },
          child: const Text(
            "SIGNUP",
            style: TextStyle(
                color: AppColors.kgreyColor,
            ),
          ),
        )
      ],
    );
  }
}
