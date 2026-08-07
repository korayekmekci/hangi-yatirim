import 'dart:convert';
import 'package:http/http.dart' as http;

class DovizService {
  static const String _apiKey = "db91bed0bb5948fd8809bc42e3036041";

  Future<Map<String, double>> kurlariGetir() async {
    final usdUrl = Uri.parse(
      "https://api.twelvedata.com/exchange_rate?symbol=USD/TRY&apikey=$_apiKey",
    );

    final eurUrl = Uri.parse(
      "https://api.twelvedata.com/exchange_rate?symbol=EUR/TRY&apikey=$_apiKey",
    );

    final goldUrl = Uri.parse(
      "https://api.twelvedata.com/exchange_rate?symbol=XAU/USD&apikey=$_apiKey",
    );

    final usdResponse = await http.get(usdUrl);
    final eurResponse = await http.get(eurUrl);
    final goldResponse = await http.get(goldUrl);

    if (usdResponse.statusCode != 200 ||
        eurResponse.statusCode != 200 ||
        goldResponse.statusCode != 200) {
      throw Exception("API bağlantı hatası");
    }

    final usdJson = jsonDecode(usdResponse.body);
    final eurJson = jsonDecode(eurResponse.body);
    final goldJson = jsonDecode(goldResponse.body);

    final usd = double.parse(usdJson["rate"].toString());
    final eur = double.parse(eurJson["rate"].toString());
    final ons = double.parse(goldJson["rate"].toString());

    // 1 ons = 31.1035 gram
    final gram = (ons * usd) / 31.1035;

    return {
      "USD": usd,
      "EUR": eur,
      "ONS": ons,
      "GRAM": gram,
    };
  }
}