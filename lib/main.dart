import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  
  double _lengthSliderValue = 20;
  bool _capitalsSwitchValue = true;
  bool _numbersSwitchValue = true;
  bool _symbolsSwitchValue = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Password Generator",

      darkTheme: ThemeData(brightness: Brightness.dark),
      theme: ThemeData(brightness: Brightness.light),
      themeMode: ThemeMode.system,

      home: Scaffold(
        appBar: AppBar(
          title: const Text("Password Generator"),
          centerTitle: true,
          backgroundColor: Colors.red,
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: <Widget>[
            Container(
              margin: const EdgeInsets.all(60.0),
              padding: const EdgeInsets.all(30.0),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 128, 128, 128))
              ),
              child: const Text("PASSWORD", textAlign: TextAlign.center),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.arrow_forward, size: 36,),
                const Text(" Length", style: TextStyle(fontSize: 18)),
                Slider(
                  value: _lengthSliderValue,
                  min: 1,
                  max: 30,
                  divisions: 29,
                  label: _lengthSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      _lengthSliderValue = value;
                    });
                  },
                  activeColor: Colors.red,
                ),
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.abc, size: 42),
                const Text(" Capitals", style: TextStyle(fontSize: 18)),
                Switch(
                  value: _capitalsSwitchValue,
                  onChanged: (value) {
                    setState(() {
                      _capitalsSwitchValue = value;
                    });
                  },
                  activeTrackColor: Colors.redAccent,
                  activeColor: Colors.red,
                )
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.numbers, size: 36),
                const Text(" Numbers", style: TextStyle(fontSize: 18)),
                Switch(
                  value: _numbersSwitchValue,
                  onChanged: (value) {
                    setState(() {
                      _numbersSwitchValue = value;
                    });
                  },
                  activeTrackColor: Colors.redAccent,
                  activeColor: Colors.red,
                )
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.emoji_symbols, size: 32),
                const Text(" Symbols", style: TextStyle(fontSize: 18)),
                Switch(
                  value: _symbolsSwitchValue,
                  onChanged: (value) {
                    setState(() {
                      _symbolsSwitchValue = value;
                    });
                  },
                  activeTrackColor: Colors.redAccent,
                  activeColor: Colors.red,
                )
              ]
            ),
          ],
        ),
      ),
    );
  }
}
