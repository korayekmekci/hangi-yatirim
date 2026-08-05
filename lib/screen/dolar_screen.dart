import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final tlFormatter = NumberFormat.currency(
  locale: 'tr_TR',
  symbol: '₺',
  decimalDigits: 2,
);

class DolarScreen extends StatefulWidget {
  const DolarScreen({super.key});

  @override
    State<DolarScreen> createState() => _DolarScreenState();
  }
  
  class _DolarScreenState extends State<DolarScreen> {
    double sonuc = 0;
  
    final TextEditingController dolarController = TextEditingController();
    final TextEditingController kurController = TextEditingController();
  
    void hesapla() {
      double dolar = double.tryParse(dolarController.text) ?? 0;
      double kur = double.tryParse(kurController.text) ?? 0;
  
      setState(() {
        sonuc = dolar * kur;
      });
    }
  
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Dolar Hesaplama"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: dolarController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Dolar miktarı (\$)',
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: kurController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Dolar kuru (TL)",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  print("BUTONA BASILDI");
                  hesapla();
                },
                child: const Text("Hesapla"),
              ),
              const SizedBox(height: 30),
Text(
  tlFormatter.format(sonuc),
  style: const TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: Colors.green,
  ),
),
            ],
          ),
        ),
      );
    }

    TextStyle newMethod() {
      return const TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.bold,
  color: Colors.green,
);
    }
  }

