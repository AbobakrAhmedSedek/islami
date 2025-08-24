import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/shared_prefs_utils.dart';

class MostRecentListProvider extends ChangeNotifier {
  List<int> mostRecentList = [];

  void refreshMostRecentIndicesList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndicesList =
        prefs.getStringList(PrefKeys.mostRecentKey) ?? [];

    mostRecentList = mostRecentIndicesList.map((e) => int.parse(e)).toList();
    notifyListeners();
  }

  void saveMostRecentIndicesList(int suraIndex) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> mostRecentIndicesList =
        prefs.getStringList(PrefKeys.mostRecentKey) ?? [];
    if (mostRecentIndicesList.contains("$suraIndex")) {
      mostRecentIndicesList.remove("$suraIndex");
      mostRecentIndicesList.insert(0, "$suraIndex");
    } else {
      mostRecentIndicesList.insert(0, "$suraIndex");
    }
    if (mostRecentIndicesList.length > 5) {
      mostRecentIndicesList.removeLast();
    }
    await prefs.setStringList(PrefKeys.mostRecentKey, mostRecentIndicesList);
  }
}
