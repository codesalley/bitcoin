import 'dart:convert';

import 'package:http/http.dart' as http;

class NetworkData {
  final currency;
  final crypto;
  NetworkData({this.currency, this.crypto});

  Future getData() async {
    String apIurl =
        'https://rest.coinapi.io/v1/exchangerate/${crypto}/${currency}?apikey=2C409533-8D3E-4EB1-9530-4BA99A5D4180';
    http.Response response = await http.get(apIurl);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      print('error bitch');
    }
  }
}
