import 'dart:convert';
import 'package:http/http.dart' as http;

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

const apiKey = 'C7A11E2B-41C0-415F-85AD-FE9FC7081D6E';
//3A349FEC-D021-40A0-A18B-AD0F1D4AFA06';

class CoinData {
  var url;
  Map<String, double> priceResults = {};
  double price = 0;

  Future<double> getPriceResponse() async {
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      //success
      var priceData = await jsonDecode(response.body);
      return priceData['rate'];
    } else {
      print(response.statusCode);
      throw 'Problem with the get request';
    }
  }

  Future<Map<String, double>> getCoinData(String selectedCurrency) async {
    for (String crypto in cryptoList) {
      url = Uri.https(
        'rest.coinapi.io',
        'v1/exchangerate/$crypto/$selectedCurrency',
        {'apiKey': '$apiKey'},
      );
      price = await getPriceResponse();
      priceResults[crypto] = price;
    }
    //TODO 5: Return a Map of the results instead of a single value.
    return priceResults;
  }
}
