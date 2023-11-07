import 'package:flutter/material.dart';
import 'package:hg_finance_app/api_service.dart';

class BitcoinScreen extends StatefulWidget {
  @override
  _BitcoinScreenState createState() => _BitcoinScreenState();
}

class _BitcoinScreenState extends State<BitcoinScreen> {
  Map<String, dynamic> bitcoinInfo = {};

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  Future<void> fetchData() async {
    ApiService apiService = ApiService();
    Map<String, dynamic> info = await apiService.getBitcoin();
    setState(() {
      bitcoinInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mercado de Bitcoins'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Blockchain.info: ${bitcoinInfo["blockchain_info"]}'),
            Text('Coinbase: ${bitcoinInfo["coinbase"]}'),
            Text('Bitstamp: ${bitcoinInfo["bitstamp"]}'),
            Text('Foxbit: ${bitcoinInfo["foxbit"]}'),
            Text('Mercado Bitcoin: ${bitcoinInfo["mercado_bitcoin"]}'),
          ],
        ),
      ),
    );
  }
}
