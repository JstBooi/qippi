import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pages/welcome.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized;
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      //CALL THE 'Welcome method'
      home: WelcomePage(),
    );
  }
}
