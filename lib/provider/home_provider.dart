import 'dart:convert';

import 'package:bhaktamer_app/list/datalist.dart';
import 'package:bhaktamer_app/modal/datamodal.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HomeProvider with ChangeNotifier {
  bool isReady = false;

  DataList? datalist;
  List<dynamic> datamodal = [];

  Future<String> _loadDataModal() async {
    return await rootBundle.loadString('assets/jason/app_jason.json');
  }

  Future loadDataModal() async {
    String jsonString = await _loadDataModal();
    final jsonResponse = json.decode(jsonString);
    datalist = DataList.fromJson(jsonResponse);
    //DataModal.addAll(jsonResponse.map((i)=>DataModal.fromJson(i)).toList());
    datamodal = (jsonResponse.map((i) => DataModal.fromJson(i)).toList());
    isReady = true;
    print(datalist!.dataModal.length);
    notifyListeners();
  }

}







