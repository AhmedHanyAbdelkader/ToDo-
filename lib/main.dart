import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'file:///D:/programs/android%20studio%20projects/New%20folder/to_do_app/lib/models/data_model.dart';
import 'file:///D:/programs/android%20studio%20projects/New%20folder/to_do_app/lib/layouts/home_page.dart';


bool x=false;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=>DataProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        theme: ThemeData(
          brightness: Brightness.dark,
          primaryColor: Colors.teal,
          accentColor: Colors.orangeAccent,

        ),
      ),
    );
  }
}
