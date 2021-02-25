import 'package:bingo/bingo/bingo.dart';
import 'package:bingo/bingo/models/chart.dart';
import 'package:bingo/common/admob.dart';
import 'package:bingo/common/models/square.dart';
import 'package:bingo/common/strings.dart';
import 'package:bingo/draw/draw.dart';
import 'package:bingo/draw/models/drawn.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(ChartAdapter());
  Hive.registerAdapter(SquareAdapter());
  Hive.registerAdapter(DrawnAdapter());

  runApp(SimpleBingo());
}

class SimpleBingo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.amber,
            buttonColor: Colors.amber,
            textTheme: TextTheme(bodyText2: TextStyle(color: Colors.black87))),
        darkTheme: ThemeData(
            brightness: Brightness.dark,
            primarySwatch: Colors.amber,
            toggleableActiveColor: Colors.amber,
            accentColor: Colors.amber),
        home: BottomNavigation());
  }
}

class BottomNavigation extends StatefulWidget {
  @override
  _BottomNavigationState createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _index = 0;
  final _widgets = [Bingo(), Draw()];

  void _onTap(int index) => setState(() => this._index = index);

  // iniStateではcontextにアクセスできない
  @override
  void didChangeDependencies() {
    Admob.setup(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(
      context: context,
      removeBottom: true,
      child: Scaffold(
        appBar: AppBar(title: Text(Strings.bingo)),
        body: _widgets.elementAt(_index),
        bottomNavigationBar: Wrap(
          children: [
            BottomNavigationBar(
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.event),
                  label: Strings.bingo,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.confirmation_number),
                  label: Strings.draw,
                ),
              ],
              currentIndex: _index,
              onTap: _onTap,
              type: BottomNavigationBarType.fixed,
            ),
            Container(
                height: Admob.banner.size.height.toDouble() +
                    MediaQuery.of(context).padding.bottom,
                color: Theme.of(context).scaffoldBackgroundColor),
          ],
        ),
      ),
    );
  }
}
