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
    SystemChrome.setPreferredOrientations([
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ]);
    return const MaterialApp(
      home: App(),
    );
  }
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  
  // pages() => THEMES
  Map themeColors = {};

  Map darkThemeColors = {
    "Black"               : const Color(0xFF000000),
    "White"               : const Color(0xFFFFFFFF),
    "Text"                : const Color(0xFFFFFFFF),
    "OffToggleHead"       : const Color(0xFF888888),
    "GreyedIcon"          : const Color(0xFF666666),
    "InputPlaceholder"    : const Color(0xFF666666),
    "Box"                 : const Color(0x33555555),
    "SliderBG"            : const Color(0xFF303030),
    "OffToggleBG"         : const Color(0xFF303030),
    "MeterBG"             : const Color(0xFF303030),
    "DrawerOverlay"       : const Color(0x66000000),
    "StrongText"          : const Color(0xFF0DB8A7),
    "GoodText"            : const Color(0xFF9EFF8E),
    "FairText"            : const Color(0xFFFCA015),
    "PoorText"            : const Color(0xFFFF8E8E),
    "NavBarSelectedItem"  : const Color(0xFF1DE2BF),
    "SilderFG"            : const Color(0xFF1DE2BF),
    "OnToggleBG"          : const Color(0xFF1DE2BF),
    "FocusedInput"        : const Color(0xFF1DE2BF),
    "Button"              : const Color(0xFF009688),
    "EnabledInput"        : const Color(0xFF009688),
    "SliderHead"          : const Color(0xFF009688),
    "OnToggleHead"        : const Color(0xFF009688),
    "DrawerBG"            : const Color(0xFF17201F),
    "BG"                  : const Color(0xFF0B1817),

    "Gradient"            : const <Color>[Color(0x00333333), Color(0xFF009688)],

    "StrongMeterGlow"     : const <Color>[Color(0xFF0DB8A7), Color(0x007BFFF2)],
    "StrongMeterFG"       : const <Color>[Color(0xFF7BFFF2), Color(0xFF0DB8A7)],
    "GoodMeterGlow"       : const <Color>[Color(0xFF9EFF8E), Color(0x00CAFFC2)],
    "GoodMeterFG"         : const <Color>[Color(0xFFCAFFC2), Color(0xFF9EFF8E)],
    "FairMeterGlow"       : const <Color>[Color(0x80FCA015), Color(0x00FFD381)],
    "FairMeterFG"         : const <Color>[Color(0xFFFFD381), Color(0xFFFCA015)],
    "PoorMeterGlow"       : const <Color>[Color(0x80FF3535), Color(0x00FD7777)],
    "PoorMeterFG"         : const <Color>[Color(0xFFFD7777), Color(0xFFFF3535)],
  };

  Map lightThemeColors = {
    "Black"               : const Color(0xFF000000),
    "White"               : const Color(0xFFFFFFFF),
    "Text"                : const Color(0xFF000000),
    "OffToggleHead"       : const Color(0xFF888888),
    "GreyedIcon"          : const Color(0xFFA8A8A8),
    "InputPlaceholder"    : const Color(0xFF999999),
    "Box"                 : const Color(0x33999999),
    "SliderBG"            : const Color(0xFFCCCCCC),
    "OffToggleBG"         : const Color(0xFFCCCCCC),
    "MeterBG"             : const Color(0xFFCCCCCC),
    "DrawerOverlay"       : const Color(0x66000000),
    "StrongText"          : const Color(0xFF0BAF9F),
    "GoodText"            : const Color(0xFF3DB92A),
    "FairText"            : const Color(0xFFC07607),
    "PoorText"            : const Color(0xFFFF4747),
    "NavBarSelectedItem"  : const Color(0xFF1DE2BF),
    "SilderFG"            : const Color(0xFF008878),
    "OnToggleBG"          : const Color(0xFF008878),
    "FocusedInput"        : const Color(0xFF008878),
    "Button"              : const Color(0xFF00B2A2),
    "EnabledInput"        : const Color(0xFF00B2A2),
    "SliderHead"          : const Color(0xFF00B2A2),
    "OnToggleHead"        : const Color(0xFF00B2A2),
    "DrawerBG"            : const Color(0xFFDEE7E7),
    "BG"                  : const Color(0xFFDCEFED),

    "Gradient"            : const <Color>[Color(0x00CCCCCC), Color(0xFF009688)],

    "StrongMeterGlow"     : const <Color>[Color(0xFF0BAF9F), Color(0x0032DDCC)],
    "StrongMeterFG"       : const <Color>[Color(0xFF32DDCC), Color(0xFF0BAF9F)],
    "GoodMeterGlow"       : const <Color>[Color(0xFF3DB92A), Color(0x0081F56F)],
    "GoodMeterFG"         : const <Color>[Color(0xFF81F56F), Color(0xFF3DB92A)],
    "FairMeterGlow"       : const <Color>[Color(0x80C07607), Color(0x00ECA130)],
    "FairMeterFG"         : const <Color>[Color(0xFFECA130), Color(0xFFC07607)],
    "PoorMeterGlow"       : const <Color>[Color(0x80FF4747), Color(0x00FF7B7B)],
    "PoorMeterFG"         : const <Color>[Color(0xFFFF7B7B), Color(0xFFFF4747)],
  };
  

  // changeTheme()
  Icon themeIcon = const Icon(Icons.nightlight_outlined, color: Color(0xFFFFFFFF));
  String themeString = "Dark";

  // navBarTap()
  int navbarIndex = 0;
  
  // generatePassword()
  String password = "password will generate here";
  String numberCharactersInt = " 0";
  String allowedCapitalsIcon = "GreyedIcon";
  String allowedNumbersIcon = "GreyedIcon";
  String allowedSymbolsIcon = "GreyedIcon";

  // generatePassword()  ~  checkPassword()
  List lowercaseList = const ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
  List capitalsList = const ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
  List numbersList = const ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
  List symbolsList = const ["!", "#", "%", "&", '"', "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "]", "^", "_", "'", "{", "|", "}", "~"];

  // getPasswordTime()
  String passwordTimeFull = "no time at all";
  late double passwordTimeInSeconds;
  late double passwordTimeInUnits;
  late String passwordTimeUnits;
  Map<double, String> secondsToUnits = {
    3153600000 : "centuries",
    315360000 : "decades",
    31536000 : "years",
    2592000 : "months",
    604800 : "weeks",
    86400 : "days",
    3600 : "hours",
    60 : "minutes",
    1 : "seconds",
    0.001 : "milliseconds",
    0.000001 : "nanoseconds",
  };


  // pages() => Generator
  double lengthSliderValue = 20;
  bool capitalsSwitchValue = true;
  bool numbersSwitchValue = true;
  bool symbolsSwitchValue = true;

  // pages() => Strength Checker
  String passwordInput = "Password";
  late double passwordScoreNumber;
  late String passwordScoreRounded;
  late String passwordScoreRank;
  late Color passwordScoreTextColor;
  late List<Color> passwordScoreGlowColor;
  late List<Color> passwordScoreIndicatorColor;
  double passwordScoreMeterValue = 25;

  // pages() => History
  List history = [];
  List defaultHistory = List.filled(10, "-");
  List historyParameters = [];
  List defaultHistoryParameters = [
    [" ""0"" ", "GreyedIcon", "GreyedIcon", "GreyedIcon"], [" ""0"" ", "GreyedIcon", "GreyedIcon", "GreyedIcon"], [" ""0"" ", "GreyedIcon", "GreyedIcon", "GreyedIcon"],
    [" ""0"" ", "GreyedIcon", "GreyedIcon", "GreyedIcon"], [" ""0"" ", "GreyedIcon", "GreyedIcon", "GreyedIcon"], [" ""0"" ", "GreyedIcon", "GreyedIcon", "GreyedIcon"],
    [" ""0"" ", "GreyedIcon", "GreyedIcon", "GreyedIcon"], [" ""0"" ", "GreyedIcon", "GreyedIcon", "GreyedIcon"], [" ""0"" ", "GreyedIcon", "GreyedIcon", "GreyedIcon"],
    [" ""0"" ", "GreyedIcon", "GreyedIcon", "GreyedIcon"]
  ];

  // build()
  ThemeMode currentTheme = ThemeMode.dark;
  ThemeData darkTheme = ThemeData(
    fontFamily: "Inter",
    scaffoldBackgroundColor: const Color(0xFF0B1817),
  );
  ThemeData lightTheme = ThemeData(
    fontFamily: "Inter",
    scaffoldBackgroundColor: const Color(0xFFDCEFED),
  );


  void changeTheme() {
      if (currentTheme == ThemeMode.dark) {
        setState(() {
          currentTheme = ThemeMode.light;
          themeIcon = const Icon(Icons.wb_sunny_outlined, color: Color(0xFF000000));
          themeString = "Light";
          themeColors.clear();
          themeColors.addAll(lightThemeColors);
        });
      }
      else if (currentTheme == ThemeMode.light) {
        setState(() {
          currentTheme = ThemeMode.dark;
          themeIcon = const Icon(Icons.nightlight_outlined, color: Color(0xFFFFFFFF));
          themeString = "Dark";
          themeColors.clear();
          themeColors.addAll(darkThemeColors);
        });
      }
  }

  void navBarTap(int index) {
    setState(() {
      checkPassword("");
      navbarIndex = index;
    });
  }

  void generatePassword(int numberCharacters, bool allowedCapitals, bool allowedNumbers, bool allowedSymbols){
    List allowedCharacters = [];
    allowedCharacters += lowercaseList;
    
    if (allowedCapitals) {
      allowedCharacters += capitalsList;
      allowedCapitalsIcon = "Text";
    } 
    else {
      allowedCapitalsIcon = "GreyedIcon";
    }
   
    if (allowedNumbers) {
      allowedCharacters += numbersList;
      allowedNumbersIcon = "Text";
    }
    else {
      allowedNumbersIcon = "GreyedIcon";
    }
    
    if (allowedSymbols) {
      allowedCharacters += symbolsList;
      allowedSymbolsIcon = "Text";
    } 
    else {
      allowedSymbolsIcon = "GreyedIcon";
    }

    if (numberCharacters.toString().length == 1) {
      numberCharactersInt = " ""$numberCharacters"" ";
    } 
    else {
      numberCharactersInt = "$numberCharacters";
    }

    password = "";
    final random = Random();

    setState(() {
      for (var i = 0; i < numberCharacters; i++) {
        password += allowedCharacters[random.nextInt(allowedCharacters.length)];
      }

      history.insert(0, password);
      history.removeLast();

      historyParameters.insert(0, [numberCharactersInt, allowedCapitalsIcon, allowedNumbersIcon, allowedSymbolsIcon]);
      historyParameters.removeLast();
    });
  }

  void checkPassword(String userpassword) {
    /*
      - Password score is calculated out of 3.0
      - You gain +0.10 score for every character no matter the type (lcns)
      - You gain +0.15 score for every captial (c)
      - You gain +0.20 score for every number (n)
      - You gain +0.25 score for every symbol (s)
      - You lose -0.05 score for consectitive types (cns)
      - You lose -0.10 score for consectitive characters

      - The score is then multiplied by 33.33 and rounded to an integer


      Then the time it takes to crack the password is calculated using the formula:
      timeInSeconds = (possibleCharacters ^ passwordLength) / attemptsPerSecond
    */
    
    passwordScoreNumber = 0;

    passwordScoreNumber += (userpassword.length) / 10;    // Length

    String prevChar = "";
    for (var i = 0; i < userpassword.length; i++) {
      String char = userpassword[i];

      if (capitalsList.contains(char)) {passwordScoreNumber += 0.15;}
      else if (numbersList.contains(char)) {passwordScoreNumber += 0.2;}
      else if (symbolsList.contains(char)) {passwordScoreNumber += 0.25;}
      
      if (char == prevChar) {passwordScoreNumber -= 0.1;}
      else if ((capitalsList.contains(char) & capitalsList.contains(char)) | (numbersList.contains(char) & numbersList.contains(char)) | (symbolsList.contains(char) & symbolsList.contains(char))) {
        passwordScoreNumber -= 0.05;
      }

      prevChar = char;
    }
    
    setState(() {
      if (passwordScoreNumber >= 3) {
        passwordScoreRank = "Strong";
        passwordScoreTextColor = themeColors["StrongText"];
        passwordScoreGlowColor = themeColors["StrongMeterGlow"];
        passwordScoreIndicatorColor = themeColors["StrongMeterFG"];
        passwordScoreMeterValue = 100;
      }
      else if (passwordScoreNumber >= 2) {
        passwordScoreRank = "Good";
        passwordScoreTextColor = themeColors["GoodText"];
        passwordScoreGlowColor = themeColors["GoodMeterGlow"];
        passwordScoreIndicatorColor = themeColors["GoodMeterFG"];
        passwordScoreMeterValue = 75;
      }
      else if (passwordScoreNumber >= 1) {
        passwordScoreRank = "Fair";
        passwordScoreTextColor = themeColors["FairText"];
        passwordScoreGlowColor = themeColors["FairMeterGlow"];
        passwordScoreIndicatorColor = themeColors["FairMeterFG"];
        passwordScoreMeterValue = 50;
      }
      else if (passwordScoreNumber >= 0) {
        passwordScoreRank = "Poor";
        passwordScoreTextColor = themeColors["PoorText"];
        passwordScoreGlowColor = themeColors["PoorMeterGlow"];
        passwordScoreIndicatorColor = themeColors["PoorMeterFG"];
        passwordScoreMeterValue = 25;
      }

      if (passwordScoreNumber > 3) {passwordScoreNumber = 3;}
      passwordScoreNumber *= 33.33;
      passwordScoreRounded = passwordScoreNumber.toStringAsFixed(0);
    });
  }

  void getPasswordTime(double score) {
    passwordTimeInSeconds = pow(1.22, score).toDouble();
    
    for (var i = 0; i < secondsToUnits.keys.toList().length; i++) {
      double key = secondsToUnits.keys.toList()[i];

      if (passwordTimeInSeconds >= key) {
        passwordTimeUnits = secondsToUnits.values.toList()[i].toString();
        passwordTimeInUnits = passwordTimeInSeconds.round() / key;
        break;
      }
    }

    passwordTimeFull = "${passwordTimeInUnits.round()} $passwordTimeUnits";
  }

  void clearHistory() {
    setState(() {
      history.clear();
      historyParameters.clear();
      history.addAll(defaultHistory);
      historyParameters.addAll(defaultHistoryParameters);
    });
  }

  List<Widget> pages() => <Widget>[
    // Generator
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        const SizedBox(height: 120),
        Container(height: 100,
          margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
          padding: const EdgeInsets.all(30),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: themeColors["Box"],
            borderRadius: const BorderRadius.all(Radius.circular(25))
          ),
          child: Text(password, style: TextStyle(fontSize: 16, color: themeColors["Text"])),
        ),
        Container(height: 80,
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(95, 0, 95, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: themeColors["Button"],
              textStyle: const TextStyle(fontSize: 16)
            ),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: password));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.copy_rounded, color: themeColors["White"]),
                Text("  Copy to Clipboard", style: TextStyle(color: themeColors["White"]))
              ]
            ),
          ),
        ),
        const SizedBox(height: 24),
        Container(
          height: 192,
          alignment: Alignment.center,
          child: Column(
            children: <SizedBox>[
              SizedBox(height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Length", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
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
                      inactiveColor: themeColors["SliderBG"],
                      activeColor: themeColors["SilderFG"],
                      thumbColor: themeColors["SliderHead"],
                    ),
                  ]
                )
              ),
              SizedBox(height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Capitals", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                    Switch(
                      value: capitalsSwitchValue,
                      onChanged: (value) {
                        setState(() {
                          capitalsSwitchValue = value;
                        });
                      },
                      activeTrackColor: themeColors["OnToggleBG"],
                      activeColor: themeColors["OnToggleHead"],
                      inactiveTrackColor: themeColors["OffToggleBG"],
                      inactiveThumbColor: themeColors["OffToggleHead"],
                    ),
                  ]
                )
              ),
              SizedBox(height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Numbers", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                    Switch(
                      value: numbersSwitchValue,
                      onChanged: (value) {
                        setState(() {
                          numbersSwitchValue = value;
                        });
                      },
                      activeTrackColor: themeColors["OnToggleBG"],
                      activeColor: themeColors["OnToggleHead"],
                      inactiveTrackColor: themeColors["OffToggleBG"],
                      inactiveThumbColor: themeColors["OffToggleHead"],
                    ),
                  ]
                )
              ),
              SizedBox(height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text("Symbols", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                    Switch(
                      value: symbolsSwitchValue,
                      onChanged: (value) {
                        setState(() {
                          symbolsSwitchValue = value;
                        });
                      },
                      activeTrackColor: themeColors["OnToggleBG"],
                      activeColor: themeColors["OnToggleHead"],
                      inactiveTrackColor: themeColors["OffToggleBG"],
                      inactiveThumbColor: themeColors["OffToggleHead"],
                    ),
                  ]
                )
              ),
            ]
          )
        ),
        const SizedBox(height: 24),
        Container(height: 80,
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(95, 0, 95, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: themeColors["Button"],
              textStyle: const TextStyle(fontSize: 16)
            ),
            onPressed: () {
              generatePassword(lengthSliderValue.toInt(), capitalsSwitchValue, numbersSwitchValue, symbolsSwitchValue);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.file_download_outlined, color: themeColors["White"]),
                Text("  Generate", style: TextStyle(color: themeColors["White"]))
              ],
            )
          ),
        ),
        const SizedBox(height: 80),
      ],
    ),

    // Strength Checker
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        const SizedBox(height: 110),
        Container(height: 100,
          margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Column(
            children: <SizedBox>[
              SizedBox(height: 35,
                child: Text(passwordScoreRank, style: TextStyle(color: passwordScoreTextColor, fontSize: 28))
              ),
              const SizedBox(height: 10),
              SizedBox(height: 11,
                width: 280,
                child: AJCMeter(
                  value: passwordScoreMeterValue,
                  minValue: 0,
                  maxValue: 100,
                  themeColors: themeColors,
                  passwordScoreGlowColor: passwordScoreGlowColor,
                  passwordScoreIndicatorColor: passwordScoreIndicatorColor,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" Score: ", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                    Text(passwordScoreRounded, style: TextStyle(fontSize: 16, color: themeColors["Text"]))
                  ]
                ),
              ),
            ],
          )
        ),
        const SizedBox(height: 55),
        Container(height: 50,
          margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),

          child: TextField(
            autocorrect: false,
            textAlign: TextAlign.center,
            cursorColor: themeColors["Text"],

            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r"\s"))
            ],

            style: TextStyle(color: themeColors["Text"]),

            decoration: InputDecoration(
              alignLabelWithHint: true,
              label: const Center(child: Text("Password")),
              labelStyle: TextStyle(color: themeColors["InputPlaceholder"]),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: themeColors["EnabledInput"])),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: themeColors["FocusedInput"])),
            ),

            onChanged: (text) {
              passwordInput = text;
              checkPassword(passwordInput);
              getPasswordTime(passwordScoreNumber);
            },
          )
        ),
        const SizedBox(height: 75),
        Container(height: 100,
          margin: const EdgeInsets.fromLTRB(60, 0, 60, 0),
          padding: const EdgeInsets.all(6),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: themeColors["Box"],
            borderRadius: const BorderRadius.all(Radius.circular(25))
          ),
          child: Column(
            children: <Container>[
              Container(height: 26,
                alignment: Alignment.center,
                child: Text("it would take", style: TextStyle(fontSize: 15, color: themeColors["Text"]))
              ),
              Container(height: 36,
                alignment: Alignment.center,
                child: Text(passwordTimeFull, style: TextStyle(fontSize: 23, color: themeColors["Text"]))
              ),
              Container(height: 26,
                alignment: Alignment.center,
                child: Text("to crack this password", style: TextStyle(fontSize: 15, color: themeColors["Text"]))
              ),
            ],
          ),
        ),
        const SizedBox(height: 15),
        Container(height: 80,
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(95, 0, 95, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: themeColors["Button"],
              textStyle: const TextStyle(fontSize: 16)
            ),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: password));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.copy_rounded, color: themeColors["White"]),
                Text("  Copy to Clipboard", style: TextStyle(color: themeColors["White"]))
              ]
            ),
          ),
        ),
        const SizedBox(height: 80),
      ],
    ),
  
    // History
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        const SizedBox(height: 75),

        SizedBox(height: 510,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,

            children: <Container>[
              Container(
                width: 110,
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30,
                      child: Text("Parameters", style: TextStyle(fontSize: 18, color: themeColors["Text"]))
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Text(historyParameters[0][0].toString(), style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                          Icon(Icons.keyboard_capslock_rounded, size: 30, color: themeColors[historyParameters[0][1]]),
                          Icon(Icons.numbers_rounded, size: 28, color: themeColors[historyParameters[0][2]]),
                          Icon(Icons.emoji_symbols_rounded, size: 26, color: themeColors[historyParameters[0][3]]),
                        ]
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Text(historyParameters[1][0].toString(), style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                          Icon(Icons.keyboard_capslock_rounded, size: 30, color: themeColors[historyParameters[1][1]]),
                          Icon(Icons.numbers_rounded, size: 28, color: themeColors[historyParameters[1][2]]),
                          Icon(Icons.emoji_symbols_rounded, size: 26, color: themeColors[historyParameters[1][3]]),
                        ]
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Text(historyParameters[2][0].toString(), style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                          Icon(Icons.keyboard_capslock_rounded, size: 30, color: themeColors[historyParameters[2][1]]),
                          Icon(Icons.numbers_rounded, size: 28, color: themeColors[historyParameters[2][2]]),
                          Icon(Icons.emoji_symbols_rounded, size: 26, color: themeColors[historyParameters[2][3]]),
                        ]
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Text(historyParameters[3][0].toString(), style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                          Icon(Icons.keyboard_capslock_rounded, size: 30, color: themeColors[historyParameters[3][1]]),
                          Icon(Icons.numbers_rounded, size: 28, color: themeColors[historyParameters[3][2]]),
                          Icon(Icons.emoji_symbols_rounded, size: 26, color: themeColors[historyParameters[3][3]]),
                        ]
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Text(historyParameters[4][0].toString(), style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                          Icon(Icons.keyboard_capslock_rounded, size: 30, color: themeColors[historyParameters[4][1]]),
                          Icon(Icons.numbers_rounded, size: 28, color: themeColors[historyParameters[4][2]]),
                          Icon(Icons.emoji_symbols_rounded, size: 26, color: themeColors[historyParameters[4][3]]),
                        ]
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Text(historyParameters[5][0].toString(), style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                          Icon(Icons.keyboard_capslock_rounded, size: 30, color: themeColors[historyParameters[5][1]]),
                          Icon(Icons.numbers_rounded, size: 28, color: themeColors[historyParameters[5][2]]),
                          Icon(Icons.emoji_symbols_rounded, size: 26, color: themeColors[historyParameters[5][3]]),
                        ]
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Text(historyParameters[6][0].toString(), style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                          Icon(Icons.keyboard_capslock_rounded, size: 30, color: themeColors[historyParameters[6][1]]),
                          Icon(Icons.numbers_rounded, size: 28, color: themeColors[historyParameters[6][2]]),
                          Icon(Icons.emoji_symbols_rounded, size: 26, color: themeColors[historyParameters[6][3]]),
                        ]
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Text(historyParameters[7][0].toString(), style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                          Icon(Icons.keyboard_capslock_rounded, size: 30, color: themeColors[historyParameters[7][1]]),
                          Icon(Icons.numbers_rounded, size: 28, color: themeColors[historyParameters[7][2]]),
                          Icon(Icons.emoji_symbols_rounded, size: 26, color: themeColors[historyParameters[7][3]]),
                        ]
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Text(historyParameters[8][0].toString(), style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                          Icon(Icons.keyboard_capslock_rounded, size: 30, color: themeColors[historyParameters[8][1]]),
                          Icon(Icons.numbers_rounded, size: 28, color: themeColors[historyParameters[8][2]]),
                          Icon(Icons.emoji_symbols_rounded, size: 26, color: themeColors[historyParameters[8][3]]),
                        ]
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      child: Row(
                        children: <Widget>[
                          Text(historyParameters[8][0].toString(), style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                          Icon(Icons.keyboard_capslock_rounded, size: 30, color: themeColors[historyParameters[8][1]]),
                          Icon(Icons.numbers_rounded, size: 28, color: themeColors[historyParameters[8][2]]),
                          Icon(Icons.emoji_symbols_rounded, size: 26, color: themeColors[historyParameters[8][3]]),
                        ]
                      ),
                    ),
                  ],
                )
              ),
              Container(
                width: 220,
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30,
                      child: Text("Password", style: TextStyle(fontSize: 18, color: themeColors["Text"]))
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Text("${history[0]}", style: TextStyle(fontSize: 12, color: themeColors["Text"]))
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Text("${history[1]}", style: TextStyle(fontSize: 12, color: themeColors["Text"]))
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Text("${history[2]}", style: TextStyle(fontSize: 12, color: themeColors["Text"]))
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Text("${history[3]}", style: TextStyle(fontSize: 12, color: themeColors["Text"]))
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Text("${history[4]}", style: TextStyle(fontSize: 12, color: themeColors["Text"]))
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Text("${history[5]}", style: TextStyle(fontSize: 12, color: themeColors["Text"]))
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Text("${history[6]}", style: TextStyle(fontSize: 12, color: themeColors["Text"]))
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Text("${history[7]}", style: TextStyle(fontSize: 12, color: themeColors["Text"]))
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Text("${history[8]}", style: TextStyle(fontSize: 12, color: themeColors["Text"]))
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.fromLTRB(10, 2, 10, 2),
                      child: Text("${history[9]}", style: TextStyle(fontSize: 12, color: themeColors["Text"]))
                    ),
                  ],
                )
              ),
              Container(
                width: 50,
                alignment: Alignment.center,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 30,
                      child: Text("Copy", style: TextStyle(fontSize: 18, color: themeColors["Text"]))
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColors["Button"],
                          padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                          alignment: Alignment.center,
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: history[0]));
                        },
                        child: Icon(Icons.copy_rounded, color: themeColors["White"]),
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColors["Button"],
                          padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                          alignment: Alignment.center,
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: history[1]));
                        },
                        child: Icon(Icons.copy_rounded, color: themeColors["White"]),
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColors["Button"],
                          padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                          alignment: Alignment.center,
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: history[2]));
                        },
                        child: Icon(Icons.copy_rounded, color: themeColors["White"]),
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColors["Button"],
                          padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                          alignment: Alignment.center,
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: history[3]));
                        },
                        child: Icon(Icons.copy_rounded, color: themeColors["White"]),
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColors["Button"],
                          padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                          alignment: Alignment.center,
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: history[4]));
                        },
                        child: Icon(Icons.copy_rounded, color: themeColors["White"]),
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColors["Button"],
                          padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                          alignment: Alignment.center,
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: history[5]));
                        },
                        child: Icon(Icons.copy_rounded, color: themeColors["White"]),
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColors["Button"],
                          padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                          alignment: Alignment.center,
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: history[6]));
                        },
                        child: Icon(Icons.copy_rounded, color: themeColors["White"]),
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColors["Button"],
                          padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                          alignment: Alignment.center,
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: history[7]));
                        },
                        child: Icon(Icons.copy_rounded, color: themeColors["White"]),
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColors["Button"],
                          padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                          alignment: Alignment.center,
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: history[8]));
                        },
                        child: Icon(Icons.copy_rounded, color: themeColors["White"]),
                      ),
                    ),
                    Container(height: 48,
                      alignment: Alignment.center,
                      margin: const EdgeInsets.fromLTRB(2, 0, 2, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColors["Button"],
                          padding: const EdgeInsets.fromLTRB(0, 3, 0, 3),
                          alignment: Alignment.center,
                        ),
                        onPressed: () {
                          Clipboard.setData(ClipboardData(text: history[9]));
                        },
                        child: Icon(Icons.copy_rounded, color: themeColors["White"]),
                      ),
                    ),
                    
                  ],
                )
              ),
            ]
          )
        ),

        const SizedBox(height: 30),

        Container(height: 40,
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(95, 0, 95, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: themeColors["Button"],
              textStyle: const TextStyle(fontSize: 16)
            ),
            onPressed: () {
              clearHistory();
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.delete_forever_rounded, color: themeColors["White"]),
                Text("  Clear", style: TextStyle(color: themeColors["White"]))
              ],
            )
          ),
        ),

        const SizedBox(height: 35),
      ],
    ),
  ];


  @override
  void initState() {
    super.initState();

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Color(0xFF009688),
        systemNavigationBarIconBrightness: Brightness.light,
      )
    );
    
    setState(() {
      themeIcon = const Icon(Icons.nightlight_outlined, color: Color(0xFFFFFFFF));
      themeString = "Dark";
      themeColors.addAll(darkThemeColors);
      history.addAll(defaultHistory);
      historyParameters.addAll(defaultHistoryParameters);
      checkPassword("password");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Password Utilities",
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: currentTheme,
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        resizeToAvoidBottomInset: false,
        
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            elevation: 0,
            backgroundColor: themeColors["BG"],
            iconTheme: IconThemeData(color: themeColors["Text"]),
            title: Text("Simple Password Utilities", style: TextStyle(fontSize: 22, color: themeColors["Text"])),
            centerTitle: true,
          ),
        ),
        
        drawer: Drawer(
          backgroundColor: themeColors["DrawerBG"],
          child: Column(
            children: <Widget>[
              DrawerHeader(
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 12),
                    Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: const Image(
                          image: AssetImage("assets/images/solid_icon_512.png"),
                          height: 48,
                          width: 48,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text("Simple Password Utilities", style: TextStyle(fontSize: 22, color: themeColors["Text"])),
                    const SizedBox(height: 3),
                    Text("Created by Aaron Chauhan", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                  ],
                ),
              ),
              const Spacer(),
              ListTile(
                leading: themeIcon,
                title: Text("$themeString Theme", style: TextStyle(color: themeColors["Text"])),
                onTap: changeTheme,
              ),
              ListTile(
                leading: Icon(Icons.info_outline_rounded, color: themeColors["Text"]),
                title: Text("About", style: TextStyle(color: themeColors["Text"])),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage(currentTheme: currentTheme, darkTheme: darkTheme, lightTheme: lightTheme, themeColors: themeColors)));
                },
              ),
            ],
          ),
        ),

        bottomNavigationBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.transparent,
            selectedItemColor: themeColors["NavBarSelectedItem"],
            unselectedItemColor: themeColors["White"],
            selectedFontSize: 16,
            unselectedFontSize: 14,
            iconSize: 32,
            
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.file_download_outlined),
                label: "Generator",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.check_circle_outline_rounded),
                label: "Strength Checker",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.history_outlined),
                label: "History",
              ),
            ],

            currentIndex: navbarIndex,
            onTap: navBarTap,
          ),
        ),

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: themeColors["Gradient"],
              begin: Alignment.center,
              end: Alignment.bottomCenter,
            )
          ),
          child: pages()[navbarIndex]
        )
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  final ThemeMode currentTheme;
  final ThemeData darkTheme;
  final ThemeData lightTheme;
  final Map themeColors;
  const AboutPage({Key? key, required this.currentTheme, required this.darkTheme, required this.lightTheme, required this.themeColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Password Utilities",
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: currentTheme,
      debugShowCheckedModeBanner: false,
      
      home: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: themeColors["BG"],
          iconTheme: IconThemeData(color: themeColors["Text"]),
          title: Text("About", style: TextStyle(fontSize: 22, color: themeColors["Text"])),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            icon: const Icon(Icons.arrow_back_rounded)
          ),
        ),

        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: themeColors["Gradient"],
              begin: Alignment.center,
              end: Alignment.bottomCenter,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                      child: const Image(
                        image: AssetImage("assets/images/solid_icon_512.png"),
                        height: 48,
                        width: 48,
                      ),
                  ),
                  const SizedBox(width: 12),
                  Column(
                    children: <Widget>[
                      Text("Simple Password Utilities", style: TextStyle(fontSize: 22, color: themeColors["Text"])),
                      const SizedBox(height: 3),
                      Text("Created by Aaron Chauhan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300, color: themeColors["Text"])),
                    ]
                  )
                ],
              ),
              const SizedBox(height: 50),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  "Simple Password Utilities offers a password generator with customizable parameters for length, capitals, numbersList, and symbolsList",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15,  color: themeColors["Text"])
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  "It also includes a strength checker with a visual strength meter and a brute force time-to-crack calculator",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: themeColors["Text"])
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 10),
                child: Text(
                  "The app keeps a history of the last 10 generated passwords, displaying relevant parameters for each password",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: themeColors["Text"])
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
                child: Text(
                  "It's a convenient tool for creating strong passwords, evaluating their strength, and managing your password history",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: themeColors["Text"])
                ),
              ),
              const SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("App:", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.store_mall_directory_rounded, color: themeColors["Text"])),
                      IconButton(onPressed: (){}, icon: Icon(Icons.store_mall_directory_rounded, color: themeColors["Text"]))
                    ],
                  )
                ]
              ),
              const SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Socials:", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.phone_android_rounded, color: themeColors["Text"])),
                      IconButton(onPressed: (){}, icon: Icon(Icons.phone_android_rounded, color: themeColors["Text"])),
                      IconButton(onPressed: (){}, icon: Icon(Icons.phone_android_rounded, color: themeColors["Text"]))
                    ],
                  )
                ]
              ),
              const SizedBox(height: 70),
              Text("v0.0.0", style: TextStyle(fontSize: 12, color: themeColors["Text"])),
            ],
          ),
        ),
      ),
    );
  }
}


class AJCMeter extends StatelessWidget {
  final double value;
  final double minValue;
  final double maxValue;
  final Map themeColors;
  final List<Color> passwordScoreGlowColor;
  final List<Color> passwordScoreIndicatorColor;  

  const AJCMeter({super.key, required this.value, required this.minValue, required this.maxValue, required this.themeColors, required this.passwordScoreGlowColor, required this.passwordScoreIndicatorColor});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 200,
      height: double.infinity,
      child: CustomPaint(
        painter: AJCMeterPainter(value: value, minValue: minValue, maxValue: maxValue, themeColors: themeColors, passwordScoreGlowColor: passwordScoreGlowColor, passwordScoreIndicatorColor: passwordScoreIndicatorColor),
      ),
    );
  }
}

class AJCMeterPainter extends CustomPainter {
  final double value;
  final double minValue;
  final double maxValue;
  final Map themeColors;
  final List<Color> passwordScoreGlowColor;
  final List<Color> passwordScoreIndicatorColor; 

  AJCMeterPainter({required this.value, required this.minValue, required this.maxValue, required this.themeColors, required this.passwordScoreGlowColor, required this.passwordScoreIndicatorColor});

  @override
  void paint(Canvas canvas, Size size) {
    final double width = size.width;
    final double height = size.height;

    // Create the meter glow gradient
    final glowGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: passwordScoreGlowColor, // Adjust the colors as needed
    );

    // Create the meter indicator gradient
    final indicatorGradient = LinearGradient(
      begin: Alignment.centerLeft,
      end: Alignment.centerRight,
      colors: passwordScoreIndicatorColor, // Adjust the colors as needed
    );
    
    // Calculate the percentage of the value within the range
    final double percentage = (value - minValue) / (maxValue - minValue);
    
    // Calculate the indicator position based on the percentage
    final double indicatorX = width * percentage;

    // Draw the meter background
    final backgroundPaint = Paint()..color = themeColors["MeterBG"];
    canvas.drawRRect(RRect.fromLTRBR(0, 0, width, height, const Radius.circular(10)), backgroundPaint);

    // Draw the meter glow
    final glowPaint = Paint()..shader = glowGradient.createShader(Rect.fromLTRB(0, 0, width, height));
    canvas.drawRRect(RRect.fromLTRBR(0, 0, width, height, const Radius.circular(10)), glowPaint);

    // Draw the meter indicator
    final indicatorPaint = Paint()..shader = indicatorGradient.createShader(Rect.fromLTRB(0, 0, indicatorX, height));
    canvas.drawRRect(RRect.fromLTRBR(0, 0, indicatorX, height, const Radius.circular(10)), indicatorPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

