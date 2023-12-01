import 'package:flutter/cupertino.dart';

class MainProvider with ChangeNotifier{
  bool darkTheme = false;

  toggleTheme(){
    darkTheme = !darkTheme;
    notifyListeners();
  }

}