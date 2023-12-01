
import 'package:bhaktamer_app/provider/home_provider.dart';
import 'package:bhaktamer_app/provider/mainprovider.dart';
import 'package:bhaktamer_app/screen/home.dart';
import 'package:bhaktamer_app/screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(

        providers: [
          
        ChangeNotifierProvider(create: (context)=>HomeProvider()),
        ChangeNotifierProvider(create: (context)=>MainProvider())  

    ],
        child: Consumer<MainProvider>(builder: (context,value,child){
          return MaterialApp(
          debugShowCheckedModeBanner: false,
            theme: value.darkTheme?ThemeData.dark(useMaterial3: true):ThemeData(useMaterial3: true),
          home: Splashscreen(),
    );
        }));
  }
}


