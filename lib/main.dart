import 'package:firebase_core/firebase_core.dart';
import 'package:mysholat/screens/login_admin.dart';
import 'package:mysholat/screens/daftar_screen.dart';
import 'package:mysholat/screens/forgot_screen.dart';
import 'package:mysholat/screens/login_screen.dart';
import 'package:mysholat/screens/newpassword_screen.dart';
import 'package:mysholat/screens/reset_screen.dart';
import 'package:mysholat/screens/tambahdata.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:mysholat/screens/Bacaan_screen.dart';
import 'package:mysholat/screens/dzikir_screen.dart';
import 'package:mysholat/screens/home_screen.dart';
import 'package:mysholat/screens/niat_screnn.dart';
import 'package:mysholat/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MySholat',
      theme: ThemeData(fontFamily: 'Poppins'),
      initialRoute: '/splashScreen',
      routes: {
        '/splashScreen': (context) => SplashScreen(),
        '/homeScreen': (context) => HomeScreen(),
        '/niatScreen': (context) => NiatScreen(),
        '/bacaanScreen': (context) => BacaanScreen(),
        '/dzikirScreen': (context) => DzikirScreen(),
        '/loginScreen': (context) => LoginScreen(),
        '/daftarScreen': (context) => DaftarScreen(),
        '/forgotScreen': (context) => ForgotScreen(),
        '/resetScreen': (context) => ResetScreen(),
        '/newpassword': (context) => Newpassword(),
        '/loginadmin': (context) => LoginAdmin(),
        '/tambahdata': (context) => TambahData(),
      },
    );
  }
}
