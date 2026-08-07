import 'package:flutter/material.dart';
import '../services/portfolio_service.dart';

class PortfoyScreen extends StatefulWidget {
  const PortfoyScreen({super.key});

  @override
  State<PortfoyScreen> createState() => _PortfoyScreenState();
}

class _PortfoyScreenState extends State<PortfoyScreen> {
  final service = PortfolioService();

  final usdController = TextEditingController();
  final eurController = TextEditingController();
  final gramController = TextEditingController();
  final tlController = TextEditingController();

  @override
  void initState() {
    super.initState();
    yukle();
  }

  Future<void> yukle() async {
    final data = await service.oku();

    usdController.text = data["usd"].toString();
    eurController.text = data["eur"].toString();
    gramController.text = data["gramAltin"].toString();
    tlController.text = data["tl"].toString();

    setState(() {});
  }

  Future<void> kaydet() async {
    await service.kaydet(
      usd: double.tryParse(usdController.text) ?? 0,
      eur: double.tryParse(eurController.text) ?? 0,
      gramAltin: double.tryParse(gramController.text) ?? 0,
      tl: double.tryParse(tlController.text) ?? 0,
    );

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Portföy kaydedildi."),
      ),
    );
  }

  Widget alan(String baslik, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 18),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: baslik,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Portföy"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [

            alan("USD", usdController),

            alan("EUR", eurController),

            alan("Gram Altın", gramController),

            alan("TL", tlController),

            const SizedBox(height: 20),

            ElevatedButton(
              onPressed: kaydet,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 55),
              ),
              child: const Text(
                "KAYDET",
                style: TextStyle(fontSize: 18),
              ),
            ),

          ],
        ),
      ),
    );
  }
}