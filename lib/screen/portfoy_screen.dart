import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class PortfoyScreen extends StatefulWidget {
  const PortfoyScreen({super.key});

  @override
  State<PortfoyScreen> createState() => _PortfoyScreenState();
}

class _PortfoyScreenState extends State<PortfoyScreen> {
  final TextEditingController dolarController = TextEditingController();
  final TextEditingController kurController = TextEditingController();

  double toplam = 0;

  final NumberFormat tlFormatter = NumberFormat.currency(
    locale: 'tr_TR',
    symbol: '₺',
    decimalDigits: 2,
  );

  void hesapla() {
    final double dolar = double.tryParse(
          dolarController.text.replaceAll(',', '.'),
        ) ??
        0;

    final double kur = double.tryParse(
          kurController.text.replaceAll(',', '.'),
        ) ??
        0;

    setState(() {
      toplam = dolar * kur;
    });
  }

  @override
  void dispose() {
    dolarController.dispose();
    kurController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Portföyüm",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const Icon(
              Icons.pie_chart,
              size: 80,
              color: Colors.purple,
            ),

            const SizedBox(height: 20),

            TextField(
              controller: dolarController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Dolar miktarı",
                prefixIcon: const Icon(Icons.attach_money),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 20),

            TextField(
              controller: kurController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: InputDecoration(
                labelText: "Dolar kuru",
                prefixIcon: const Icon(Icons.currency_exchange),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),

            const SizedBox(height: 25),

            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: hesapla,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                child: const Text(
                  "PORTFÖYÜ HESAPLA",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 35),

            Card(
              elevation: 8,
              color: Colors.purple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 25,
                ),
                child: Column(
                  children: [
                    const Text(
                      "Toplam Varlık",
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 20,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      tlFormatter.format(toplam),
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 34,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}