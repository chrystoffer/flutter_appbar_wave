import 'package:flutter/material.dart';
import 'package:jumping_bottom_nav_bar/jumping_bottom_nav_bar.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedIndex = 1;

  Color _color = Colors.purple;

  final iconList = [
    TabItemIcon(iconData: Icons.home, curveColor: Colors.purple),
    TabItemIcon(iconData: Icons.healing, curveColor: Colors.orange),
    TabItemIcon(iconData: Icons.location_on, curveColor: Colors.green),
    TabItemIcon(iconData: Icons.notifications, curveColor: Colors.blue),
    TabItemIcon(iconData: Icons.supervised_user_circle, curveColor: Colors.red),
  ];
  void onChangeTab(int index) {
    if (index == 1)
      _color = Colors.purple;
    else if (index == 2)
      _color = Colors.orange;
    else if (index == 3)
      _color = Colors.green;
    else if (index == 4)
      _color = Colors.blue;
    else if (index == 5) _color = Colors.red;

    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        flexibleSpace: RotatedBox(
          quarterTurns: 2,
          child: WaveWidget(
            config: CustomConfig(
              gradients: [
                [_color, _color],
                [_color, _color],
              ],
              durations: [19440, 10800],
              heightPercentages: [0.20, 1.25],
              gradientBegin: Alignment.bottomLeft,
              gradientEnd: Alignment.topRight,
            ),
            size: Size(double.infinity, 670),
            waveAmplitude: 0,
          ),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(140.0),
          child: JumpingTabBar(
            onChangeTab: onChangeTab,
            circleGradient: LinearGradient(
              colors: [
                _color,
                _color,
              ],
              begin: Alignment.topCenter,
              end: Alignment.topRight,
            ),
            items: iconList,
            selectedIndex: selectedIndex,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Tab selected $selectedIndex',
            ),
          ],
        ),
      ),
    );
  }
}
