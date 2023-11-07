import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:hg_finance_app/screens/currency_screen.dart';
import 'package:hg_finance_app/screens/stocks_screen.dart';
import 'package:hg_finance_app/screens/bitcoin_screen.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    CurrencyScreen(),
    StocksScreen(),
    BitcoinScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.attach_money),
            title: Text('Moedas'),
            activeColor: Colors.blue,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.trending_up),
            title: Text('Ações'),
            activeColor: Colors.green,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.money),
            title: Text('Bitcoins'),
            activeColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
