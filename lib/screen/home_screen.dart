import 'package:flutter/material.dart';

import '../services/doviz_service.dart';
import '../widgets/market_card.dart';
import '../widgets/portfolio_summary.dart';

import 'dolar_screen.dart';
import 'portfoy_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final DovizService dovizService = DovizService();

  bool yukleniyor = true;

  double? usdTry;
  double? eurTry;

  @override
  void initState() {
    super.initState();
    verileriGetir();
  }

 Future<void> verileriGetir() async {
  try {
    final data = await dovizService.kurlariGetir();

    setState(() {
      usdTry = data["USD"];
      eurTry = data["EUR"];
      yukleniyor = false;
    });
  } catch (e) {
    debugPrint(e.toString());

    setState(() {
      yukleniyor = false;
    });
  }
}

  Widget investmentCard(
    String title,
    IconData icon,
    Color color,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 28,
              backgroundColor: color.withOpacity(.12),
              child: Icon(
                icon,
                color: color,
                size: 30,
              ),
            ),

            const SizedBox(height: 15),

            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF4F6FA),

      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        title: const Text(
          "Hangi Yatırım",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: yukleniyor
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView(
              padding: const EdgeInsets.all(16),

              children: [

                /// PORTFÖY
                const PortfolioSummary(
                  total: 0,
                ),

                const SizedBox(height: 30),

                const Text(
                  "📈 Piyasalar",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [

                      MarketCard(
                        icon: Icons.attach_money,
                        color: Colors.green,
                        title: "USD / TRY",
                        value: usdTry?.toStringAsFixed(2) ?? "--",
                      ),

                      const Divider(height: 1),

                      MarketCard(
                        icon: Icons.euro,
                        color: Colors.blue,
                        title: "EUR / TRY",
                        value: eurTry?.toStringAsFixed(2) ?? "--",
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "🧮 Araçlar",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 15),

                GridView.count(
                  crossAxisCount: 2,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  children: [

                    investmentCard(
                      "Dolar",
                      Icons.attach_money,
                      Colors.green,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const DolarScreen(),
                          ),
                        );
                      },
                    ),

                    investmentCard(
                      "Portföy",
                      Icons.pie_chart,
                      Colors.deepPurple,
                      () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const PortfoyScreen(),
                          ),
                        );
                      },
                    ),

                    investmentCard(
                      "Faiz",
                      Icons.account_balance,
                      Colors.orange,
                      () {},
                    ),

                    investmentCard(
                      "Altın",
                      Icons.workspace_premium,
                      Colors.amber,
                      () {},
                    ),
                  ],
                ),
              ],
            ),
    );
  }
}