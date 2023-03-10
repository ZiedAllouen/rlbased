
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:roleb/Homefav.dart';
import 'package:roleb/favorite_provider.dart';

import 'register.dart';



import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
    runApp(MyApp());
} 

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>FavoriteProvider(),
      child: MaterialApp(
        home:Register(),
      )
      );
  }
}