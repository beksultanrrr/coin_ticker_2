import 'services/networking.dart';

class CoinModel {
   Future  getCurrentPrice(selectedCurrency) async {
    NetworkingHelper networkingHelper = NetworkingHelper(
        Url:
            "https://rest.coinapi.io/v1/exchangerate/BTC/$selectedCurrency?apikey=EA5AECBE-E283-4A30-A34A-1EC8D4143017");
    var decodeData = await networkingHelper.getData();
    return decodeData["rate"];
  }
}

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

class CoinData {}
