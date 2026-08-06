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

    final usdResponse = await http.get(usdUrl);
    final eurResponse = await http.get(eurUrl);

    if (usdResponse.statusCode != 200 ||
        eurResponse.statusCode != 200) {
      throw Exception("API bağlantı hatası");
    }

    final usdJson = jsonDecode(usdResponse.body);
    print("USD Response: ${usdResponse.body}");

    final eurJson = jsonDecode(eurResponse.body);
    print("EUR Response: ${eurResponse.body}");

    if (usdJson["rate"] == null || eurJson["rate"] == null) {
      throw Exception("Kur bilgisi alınamadı.");
    }

    return {
      "USD": double.parse(usdJson["rate"].toString()),
      "EUR": double.parse(eurJson["rate"].toString()),
    };
  }
}