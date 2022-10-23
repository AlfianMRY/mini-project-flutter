import 'package:mini_project/constants/app_constant.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/splash.dart';
import 'package:flutter/material.dart';
import 'widgets/utils.dart';

Future<void> main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

final navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: Utils.messengerKey,
      navigatorKey: navigatorKey,
      title: 'Mini Project',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          backgroundColor: primaryBgColor,
          primaryColor: primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: Splash(),
    );
  }
}
