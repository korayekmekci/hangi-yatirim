import 'package:shared_preferences/shared_preferences.dart';

class PortfolioService {
  Future<void> kaydet({
    required double usd,
    required double eur,
    required double gramAltin,
    required double tl,
  }) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setDouble("usd", usd);
    await prefs.setDouble("eur", eur);
    await prefs.setDouble("gramAltin", gramAltin);
    await prefs.setDouble("tl", tl);
  }

  Future<Map<String, double>> oku() async {
    final prefs = await SharedPreferences.getInstance();

    return {
      "usd": prefs.getDouble("usd") ?? 0,
      "eur": prefs.getDouble("eur") ?? 0,
      "gramAltin": prefs.getDouble("gramAltin") ?? 0,
      "tl": prefs.getDouble("tl") ?? 0,
    };
  }
}