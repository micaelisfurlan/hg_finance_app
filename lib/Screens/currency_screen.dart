import 'package:flutter/material.dart';
import 'package:hg_finance_app/api_service.dart';

class CurrencyScreen extends StatefulWidget {
  @override
  _CurrencyScreenState createState() => _CurrencyScreenState();
}

class _CurrencyScreenState extends State<CurrencyScreen> {
  List<String> currencies = ["USD", "EUR", "ARS", "JPY"];
  Map<String, double> exchangeRates = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    ApiService apiService = ApiService();
    for (String currency in currencies) {
      double rate = await apiService.getCurrencyRate(currency);
      setState(() {
        exchangeRates[currency] = rate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cotações de Moedas'),
      ),
      body: ListView.builder(
        itemCount: currencies.length,
        itemBuilder: (context, index) {
          final currency = currencies[index];
          final rate = exchangeRates[currency] ?? 0.0;
          return ListTile(
            title: Text('1 $currency = $rate USD'),
          );
        },
      ),
    );
  }
}
