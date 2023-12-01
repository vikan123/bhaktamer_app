

import 'package:bhaktamer_app/modal/datamodal.dart';
import 'package:bhaktamer_app/provider/home_provider.dart';
import 'package:bhaktamer_app/provider/mainprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
   DetailScreen({Key? key, required this.modal}) : super(key: key);
   final DataModal modal;
  @override
  Widget build(BuildContext context) {

    bool light = false;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "भक्तामर-स्तोत्र (संस्कृत)",
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(
                Icons.settings,
              )),
          Padding(
              padding: const EdgeInsets.all(10),
              child:
              Consumer<MainProvider>(builder: (context, provider, child) {
                return Switch(
                  value: light,
                  activeColor: Colors.white,
                  onChanged: (bool value) {

                      provider.toggleTheme();

                  },
                );
              })),
          
        ],
      ),
      body:Consumer<HomeProvider>(
        builder: (context,provider,child){
    //final data = provider.modal;
    return Padding(padding: EdgeInsets.all(20),
    child: SingleChildScrollView(child:
      Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("||${modal.problem}||",style: TextStyle(fontSize: 35),),
          Text(modal.shloke,style: TextStyle(fontSize: 25),),
          Image.asset(modal.image,fit: BoxFit.fill,),
          SizedBox(height: 10,),
          Text("भावार्थ",style: TextStyle(fontSize: 35),),
          Text(modal.desc,style: TextStyle(fontSize: 25),),
          SizedBox(height: 10,),
          Text("काव्य",style: TextStyle(fontSize: 35),),
          Text(modal.kavya,style: TextStyle(fontSize: 25)),
          SizedBox(height: 10,),
          Text("मंत्र",style: TextStyle(fontSize: 35),),
          Text(modal.mantra,style: TextStyle(fontSize: 25)),
          SizedBox(height: 10,),


        ],
      ),),
    );


    }));
  }
}
