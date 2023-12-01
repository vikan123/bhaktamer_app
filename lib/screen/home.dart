import 'dart:convert';

import 'package:bhaktamer_app/list/datalist.dart';
import 'package:bhaktamer_app/modal/datamodal.dart';
import 'package:bhaktamer_app/provider/home_provider.dart';
import 'package:bhaktamer_app/screen/detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../provider/mainprovider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isReady = false;

  bool light = false;
  DataList? datalist;
  List<dynamic> datamodal = [];

  @override
  void initState() {
    final auth = Provider.of<HomeProvider>(context, listen: false);
    auth.loadDataModal();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {


    //var dataModal;
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
                      setState(() {
                        provider.toggleTheme();
                      });
                    },
                  );
                }))
          ],
        ),
        body: Consumer<HomeProvider>(
          builder: (context,provider,child){
            final data = provider.datalist;
            return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                    const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text(
                          "भक्तामर-स्तोत्र",
                          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                        )),
                    const Padding(
                        padding: EdgeInsets.all(5),
                        child: Text("इस स्तोत्र के बारे में कई किंवदंतियाँ हैं। इसमें सबसे प्रसिद्ध किदवंती यह है कि आचार्य मानतुंग को जब राजा भोज ने जेल में बंद करवा दिया था। और उस जेल के 48 दरवाजे थे जिन पर 48 मजबूत ताले लगे हुए थे। तब आचार्य मानतुंग ने भक्तामर स्तोत्र की रचना की तथा हर श्लोक की रचना ताला टूटता गया।",
                          style: TextStyle(fontSize: 22),
                        )),
                    SizedBox(height: 10,),
                    (!isReady)
                        ? ListView.builder(
                        itemCount: data!.dataModal.length,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        DetailScreen(modal:data!.dataModal[index]),
                                  ));
                            },
                            child: ListTile(
                              leading: Text(
                                data!.dataModal[index].id.toString(),
                                style: const TextStyle(fontSize: 30),
                              ),
                              title: Text(
                                data!.dataModal[index].problem,
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          );
                        })
                        : const CircularProgressIndicator()
                  ]),
                ));
          },
        ));
  }
}
