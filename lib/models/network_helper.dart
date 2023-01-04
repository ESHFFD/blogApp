import 'dart:convert';

import 'package:arz/models/currency.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:developer' as developer;

class NetworkHelper extends ChangeNotifier {
  final List<Currency> currency = [];
  Future getCurrency() async {
    var url = Uri.parse(
        'https://sasansafari.com/flutter/api.php?access_key=flutter123456');
    await http.get(url).then((value) {
      if (value.statusCode == 200) {
        developer.log(value.body, name: 'getCurrency');
        List jsonList = jsonDecode(value.body);
        if (jsonList.length > 0) {
          for (int i = 0; i < jsonList.length; i++) {
            currency.add(Currency(
              id: jsonList[i]['id'],
              title: jsonList[i]['title'],
              status: jsonList[i]['status'],
              price: jsonList[i]['price'],
              changes: jsonList[i]['changes'],
            ));
          }
        }
      }
      notifyListeners();
    });
  }
}
