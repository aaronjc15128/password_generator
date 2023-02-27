import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'dart:math';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  
  int navBarIndex = 0;

  void navBarTap(int index) {
    setState(() {
      navBarIndex = index;
    });
  }

  
  String password = "password will generate here";

  List lowercase = const ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
  List uppercase = const ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
  List numbers = const ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
  List symbols = const ["!", "#", "%", "&", '"', "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "]", "^", "_", "'", "{", "|", "}", "~"];

  void generatePassword(int numberCharacters, bool allowedCapitals, bool allowedNumbers, bool allowedSymbols){
    List allowedCharacters = [];
    allowedCharacters += lowercase;
    if (allowedCapitals) {allowedCharacters += uppercase;}
    if (allowedNumbers) {allowedCharacters += numbers;}
    if (allowedSymbols) {allowedCharacters += symbols;}

    password = "";
    for (var i = 0; i < numberCharacters; i++) {
      final random = Random();
      setState(() {
        password += allowedCharacters[random.nextInt(allowedCharacters.length)];
      });  
    }
  }

  double lengthSliderValue = 20;
  bool capitalsSwitchValue = true;
  bool numbersSwitchValue = true;
  bool symbolsSwitchValue = true;


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
          backgroundColor: Colors.teal,
        ),

        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.get_app_rounded),
              label: "Generator",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.check_circle_outline_rounded),
              label: "Strength Checker",
            ),
          ],
          currentIndex: navBarIndex,
          onTap: navBarTap,
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: <Widget>[
            /* Box     */ Container(
              margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
              padding: const EdgeInsets.all(30),
              decoration: BoxDecoration(
                border: Border.all(color: const Color.fromARGB(255, 128, 128, 128))
              ),
              child: Text(password, textAlign: TextAlign.center, style: const TextStyle(fontSize: 18)),
            ),
            /* Button  */ Container(
              margin: const EdgeInsets.fromLTRB(90, 20, 90, 60),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  textStyle: const TextStyle(fontSize: 16)
                ),
                onPressed: () {
                  Clipboard.setData(ClipboardData(text: password));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const <Widget>[
                    Icon(Icons.copy_all),
                    Text(" Copy to Clipboard")
                  ]
                ),
              ),
            ),
            /* Slider  */ Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.arrow_forward, size: 36,),
                const Text(" Length", style: TextStyle(fontSize: 18)),
                Slider(
                  value: lengthSliderValue,
                  min: 1,
                  max: 30,
                  divisions: 29,
                  label: lengthSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      lengthSliderValue = value;
                    });
                  },
                  inactiveColor: const Color.fromARGB(255, 128, 128, 128),
                  activeColor: Colors.tealAccent,
                  thumbColor: Colors.teal,
                ),
              ]
            ),
            /* Toggle  */ Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.abc, size: 42),
                const Text(" Capitals", style: TextStyle(fontSize: 18)),
                Switch(
                  value: capitalsSwitchValue,
                  onChanged: (value) {
                    setState(() {
                      capitalsSwitchValue = value;
                    });
                  },
                  activeTrackColor: Colors.tealAccent,
                  activeColor: Colors.teal,
                )
              ]
            ),
            /* Toggle  */ Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.numbers, size: 36),
                const Text(" Numbers", style: TextStyle(fontSize: 18)),
                Switch(
                  value: numbersSwitchValue,
                  onChanged: (value) {
                    setState(() {
                      numbersSwitchValue = value;
                    });
                  },
                  activeTrackColor: Colors.tealAccent,
                  activeColor: Colors.teal,
                )
              ]
            ),
            /* Toggle  */ Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Icon(Icons.emoji_symbols, size: 32),
                const Text(" Symbols", style: TextStyle(fontSize: 18)),
                Switch(
                  value: symbolsSwitchValue,
                  onChanged: (value) {
                    setState(() {
                      symbolsSwitchValue = value;
                    });
                  },
                  activeTrackColor: Colors.tealAccent,
                  activeColor: Colors.teal,
                )
              ]
            ),
            /* Button  */ Container(
              margin: const EdgeInsets.fromLTRB(90, 20, 90, 20),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  textStyle: const TextStyle(fontSize: 16)
                ),
                onPressed: () {
                  generatePassword(lengthSliderValue.toInt(), capitalsSwitchValue, numbersSwitchValue, symbolsSwitchValue);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.get_app_rounded),
                    Text(" Generate")
                  ],
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}
