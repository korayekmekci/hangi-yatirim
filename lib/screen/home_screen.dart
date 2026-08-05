import 'package:flutter/material.dart';
import 'dolar_screen.dart';
import 'portfoy_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f6fb),

      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.deepPurple,
        title: const Text(
          "Hangi Yatırım",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(22),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.deepPurple,
                    Colors.indigo,
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "Hoş Geldin 👋",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Bugün yatırımını hesaplayalım.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 25),

            const Text(
              "Piyasa Özeti",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(18),
              ),
              child: const ListTile(
                leading: CircleAvatar(
                  radius: 24,
                  backgroundColor: Colors.green,
                  child: Icon(
                    Icons.attach_money,
                    color: Colors.white,
                  ),
                ),
                title: Text(
                  "USD / TRY",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text("46.50"),
                trailing: Text(
                  "+0.35%",
                  style: TextStyle(
                    color: Colors.green,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 30),

            const Text(
              "Araçlar",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 15),

            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: 1.05,
              children: [

                _menuCard(
                  context,
                  "Dolar",
                  Icons.attach_money,
                  Colors.green,
                  const DolarScreen(),
                ),

                _menuCard(
                  context,
                  "Portföy",
                  Icons.pie_chart,
                  Colors.deepPurple,
                  const PortfoyScreen(),
                ),

                _menuCard(
                  context,
                  "Faiz",
                  Icons.account_balance,
                  Colors.orange,
                  const DolarScreen(), // Şimdilik
                ),

                _menuCard(
                  context,
                  "Ev Hesabı",
                  Icons.home,
                  Colors.blue,
                  const DolarScreen(), // Şimdilik
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _menuCard(
    BuildContext context,
    String title,
    IconData icon,
    Color color,
    Widget page,
  ) {
    return InkWell(
      borderRadius: BorderRadius.circular(22),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => page),
        );
      },
      child: Card(
        elevation: 6,
        shadowColor: color.withOpacity(.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(22),
        ),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              CircleAvatar(
                radius: 32,
                backgroundColor: color.withOpacity(.15),
                child: Icon(
                  icon,
                  color: color,
                  size: 34,
                ),
              ),

              const SizedBox(height: 18),

              Text(
                title,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}