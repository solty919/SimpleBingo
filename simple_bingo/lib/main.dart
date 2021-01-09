import 'package:bingo/bingo/bingo.dart';
import 'package:bingo/bingo/models/models.dart';
import 'package:bingo/common/strings.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ChartAdapter());
  Hive.registerAdapter(SquareAdapter());

  runApp(SimpleBingo());
}

class SimpleBingo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: Colors.amber),
        darkTheme: ThemeData.dark(),
        home: BottomNavigation());
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _index = 0;
  final _widgets = [Bingo(), Bingo()];

  void _onTap(int index) => setState(() => this._index = index);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.bingo,
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: _widgets.elementAt(_index),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.event), label: Strings.bingo),
          BottomNavigationBarItem(
              icon: Icon(Icons.confirmation_number), label: Strings.draw),
        ],
        currentIndex: _index,
        fixedColor: Theme.of(context).accentColor,
        onTap: _onTap,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
