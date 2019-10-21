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

const bitcoinAverageURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker';

class CoinData {
  Future getCoinData(String currency) async {
    Map<String, String> cryptoPrices = {};

    for (String crypto in cryptoList) {
      String req = '$bitcoinAverageURL/$crypto$currency';

      http.Response response = await http.get(req);

      if (response.statusCode == 200) {
        var messageBody = jsonDecode(response.body);
        double currentPrice = messageBody['last'];

        cryptoPrices[crypto] = currentPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Error in call getCoinData()';
      }
    }

    return cryptoPrices;
  }
}
