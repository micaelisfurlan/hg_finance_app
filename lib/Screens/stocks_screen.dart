import 'package:flutter/material.dart';
import 'package:hg_finance_app/api_service.dart';

class StocksScreen extends StatefulWidget {
  @override
  _StocksScreenState createState() => _StocksScreenState();
}

class _StocksScreenState extends State<StocksScreen> {
  List<String> stocks = [
    "IBOVESPA",
    "IFIX",
    "NASDAQ",
    "DOW JONES",
    "CAC",
    "NIKKEI"
  ];
  Map<String, double> stockPrices = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    ApiService apiService = ApiService();
    for (String stock in stocks) {
      double price = await apiService.getStockPrice(stock);
      setState(() {
        stockPrices[stock] = price;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cotações de Ações'),
      ),
      body: ListView.builder(
        itemCount: stocks.length,
        itemBuilder: (context, index) {
          final stock = stocks[index];
          final price = stockPrices[stock] ?? 0.0;
          return ListTile(
            title: Text('$stock: $price'),
          );
        },
      ),
    );
  }
}
