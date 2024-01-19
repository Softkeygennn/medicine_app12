import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pharma_med/firebase_options.dart';
import 'package:pharma_med/pages/CartPage.dart';
import 'package:pharma_med/pages/Homepage.dart';
import 'package:pharma_med/pages/ItemsPage.dart';
import 'package:pharma_med/pages/Signup/Components/signup_auth_provider.dart';
import 'package:pharma_med/pages/Signup/signup_page.dart';
import 'package:pharma_med/pages/Welcome/welcome_page.dart';
import 'package:pharma_med/pages/login/Components/login_auth_provider.dart';
import 'package:pharma_med/pages/login/login_page.dart';
import 'package:pharma_med/pages/provider/cart_provider.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => SignupAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => LoginAuthProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // useMaterial3=false,
          appBarTheme: const AppBarTheme(

              iconTheme: IconThemeData(
            color: Colors.black,
          )),
          scaffoldBackgroundColor: Colors.white,
        ),
        home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, userSnp) {
            if (userSnp.hasData) {
              return const HomePage();
            }
            return const WelcomePage();
          },
        ),
        // routes: {
        //   "/": (context) => const SignUpPage(),
        //   "welcomePage": (context) => const WelcomePage(),
        //   "homePage": (context) => const HomePage(),
        //   "cartPage": (context) => const CartPage(),
        //   "itemsPage": (context) => ItemsPage(),
        //
        // },
      ),
    );
  }
}
