import 'package:flutter/material.dart';
import 'package:pharma_med/pages/Welcome/components/center_part.dart';
import 'package:pharma_med/pages/Welcome/components/end_part.dart';
import 'package:pharma_med/pages/Welcome/components/top_part.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // top part
                TopPart(),
                // center part
                CenterPart(),
                // end part
                EndPart(),
              ],
            ),
          )
      ),
    );
  }
}
