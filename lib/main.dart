import 'package:ecom/consts/consts.dart';
import 'package:ecom/views/splash_screen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //We are using getX so we have to change MaterialApp to GetMaterialApp
    return GetMaterialApp(
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
            //to set app bar icon color
            iconTheme: IconThemeData(
              color: darkFontGrey
            ),
            backgroundColor: Colors.transparent
        ),
        fontFamily: regular
      ),
      home: SplashScreen(),
    );
  }
}

