
import 'dart:async';

import 'package:bhaktamer_app/screen/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {


  @override
  void initState() {

    super.initState();
    Timer(Duration(seconds: 3),
            ()=>Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  HomePage(),
            )));

  }
  @override
  Widget build(BuildContext context) {


    return Center(
     child: Container(width:double.infinity,height: 500,child:Image.asset("assets/images/bhaktamer.png",fit: BoxFit.fill,))
    );



  }
}


