import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://api.hgbrasil.com/';

  Future<double> getCurrencyRate(String currency) async {
    final response = await http.get(Uri.parse('$baseUrl/finance?key=59458058'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final currencyData = data['results']['currencies'][currency];
      return currencyData['buy'];
    } else {
      throw Exception('Erro ao buscar cotação da moeda $currency');
    }
  }

  Future<double> getStockPrice(String stock) async {
    final response = await http.get(Uri.parse('$baseUrl/finance?key=59458058'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final stockData = data['results']['stocks'][stock];
      return stockData['price'];
    } else {
      throw Exception('Erro ao buscar cotação da ação $stock');
    }
  }

  Future<Map<String, dynamic>> getBitcoin() async {
    final response = await http.get(Uri.parse('$baseUrl/finance?key=59458058'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results']['bitcoin'];
    } else {
      throw Exception('Erro ao buscar informações de bitcoins');
    }
  }
}
