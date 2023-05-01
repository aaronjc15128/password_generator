import 'package:flutter/material.dart';
// ignore: unnecessary_import
import 'package:flutter/services.dart';

import 'dart:math';


void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
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
    "GoodText"            : const Color(0xFF9EFF8E),
    "PoorText"            : const Color(0xFFFF8E8E),
    "NavBarSelectedItem"  : const Color(0xFF1DE2BF),
    "SilderFG"            : const Color(0xFF1DE2BF),
    "OnToggleBG"          : const Color(0xFF1DE2BF),
    "Button"              : const Color(0xFF009688),
    "Input"               : const Color(0xFF009688),
    "SliderHead"          : const Color(0xFF009688),
    "OnToggleHead"        : const Color(0xFF009688),
    "DrawerBG"            : const Color(0xFF17201F),
    "BG"                  : const Color(0xFF0B1817),
  };

  Map lightThemeColors = {
    "Black"               : const Color(0xFF000000),
    "White"               : const Color(0xFFFFFFFF),
    "Text"                : const Color(0xFF000000),
    "OffToggleHead"       : const Color(0xFF888888),
    "GreyedIcon"          : const Color(0xFF999999),
    "InputPlaceholder"    : const Color(0xFF999999),
    "Box"                 : const Color(0x33999999),
    "SliderBG"            : const Color(0xFFCCCCCC),
    "OffToggleBG"         : const Color(0xFFCCCCCC),
    "MeterBG"             : const Color(0xFFCCCCCC),
    "DrawerOverlay"       : const Color(0x66000000),
    "GoodText"            : const Color(0xFF17A300),
    "PoorText"            : const Color(0xFFFF5C5C),
    "NavBarSelectedItem"  : const Color(0xFF1DE2BF),
    "SilderFG"            : const Color(0xFF008878),
    "OnToggleBG"          : const Color(0xFF008878),
    "Button"              : const Color(0xFF00B2A2),
    "Input"               : const Color(0xFF00B2A2),
    "SliderHead"          : const Color(0xFF00B2A2),
    "OnToggleHead"        : const Color(0xFF00B2A2),
    "DrawerBG"            : const Color(0xFFDEE7E7),
    "BG"                  : const Color(0xFFDCEFED),
  };
  

  // changeTheme()
  Icon iconThemeMode = const Icon(Icons.nightlight_outlined, color: Color(0xFFFFFFFF));
  String stringThemeMode = "Dark";

  // navBarTap()
  int navBarIndex = 0;
  
  // generatePassword()
  String password = "password will generate here";

  // generatePassword() checkPassword()
  List lowercase = const ["a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"];
  List uppercase = const ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
  List numbers = const ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9"];
  List symbols = const ["!", "#", "%", "&", '"', "(", ")", "*", "+", ",", "-", ".", "/", ":", ";", "<", "=", ">", "?", "@", "[", "]", "^", "_", "'", "{", "|", "}", "~"];

  // pages() => Generator
  double lengthSliderValue = 20;
  bool capitalsSwitchValue = true;
  bool numbersSwitchValue = true;
  bool symbolsSwitchValue = true;

  // pages() => Strength Checker
  String passwordInput = "Password";
  late double passwordScore;
  late String roundedScore;
  late String rankScore;
  late Color colorScore;
  double meterSliderValue = 1;

  // build()
  ThemeMode currentThemeMode = ThemeMode.dark;
  ThemeData darkTheme = ThemeData(
    fontFamily: "Inter",
    scaffoldBackgroundColor: const Color(0xFF0B1817),
  );
  ThemeData lightTheme = ThemeData(
    fontFamily: "Inter",
    scaffoldBackgroundColor: const Color(0xFFDCEFED),
  );


  void changeTheme() {
      if (currentThemeMode == ThemeMode.dark) {
        setState(() {
          currentThemeMode = ThemeMode.light;
          iconThemeMode = const Icon(Icons.wb_sunny_outlined, color: Color(0xFF000000));
          stringThemeMode = "Light";
          themeColors.clear();
          themeColors.addAll(lightThemeColors);
        });
      }
      else if (currentThemeMode == ThemeMode.light) {
        setState(() {
          currentThemeMode = ThemeMode.dark;
          iconThemeMode = const Icon(Icons.nightlight_outlined, color: Color(0xFFFFFFFF));
          stringThemeMode = "Dark";
          themeColors.clear();
          themeColors.addAll(darkThemeColors);
        });
      }
  }

  void navBarTap(int index) {
    setState(() {
      navBarIndex = index;
    });
  }

  void generatePassword(int numberCharacters, bool allowedCapitals, bool allowedNumbers, bool allowedSymbols){
    List allowedCharacters = [];
    allowedCharacters += lowercase;
    if (allowedCapitals) {allowedCharacters += uppercase;}
    if (allowedNumbers) {allowedCharacters += numbers;}
    if (allowedSymbols) {allowedCharacters += symbols;}

    password = "";
    final random = Random();

    setState(() {
      for (var i = 0; i < numberCharacters; i++) {
        password += allowedCharacters[random.nextInt(allowedCharacters.length)];
      }
    });
  }

  void checkPassword(String userpassword) {
    /*
      - Password score is calculated out of 3.0
      - You gain +0.10 score for every character no matter the type (lcns)
      - You gain +0.15 score for every captial (c)
      - You gain +0.20 score for every number (n)
      - You gain +0.25 score for every symbol (s)
      - You lose -0.10 score for consectitive types (cns)
      - You lose -0.20 score for consectitive characters

      - The score is then multiplied by 33.33 and rounded to an integer
    */
    
    passwordScore = 0;

    passwordScore += (userpassword.length) / 10;    // Length

    String prevChar = "";
    for (var i = 0; i < userpassword.length; i++) {
      String char = userpassword[i];

      if (uppercase.contains(char)) {passwordScore += 0.15;}
      else if (numbers.contains(char)) {passwordScore += 0.2;}
      else if (symbols.contains(char)) {passwordScore += 0.25;}
      
      if (char == prevChar) {passwordScore -= 0.2;}
      else if ((uppercase.contains(char) & uppercase.contains(char)) | (numbers.contains(char) & numbers.contains(char)) | (symbols.contains(char) & symbols.contains(char))) {
        passwordScore -= 0.1;
      }

      prevChar = char;
    }
    
    if (passwordScore >= 3) {
      rankScore = "Strong";
      colorScore = Colors.teal;
    }
    else if (passwordScore >= 2) {
      rankScore = "Good";
      colorScore = themeColors["GoodText"];
    }
    else if (passwordScore >= 1) {
      rankScore = "Fair";
      colorScore = Colors.orange;
    }
    else if (passwordScore >= 0) {
      rankScore = "Poor";
      colorScore = themeColors["PoorText"];
    }

    setState(() {
      if (passwordScore > 3) {passwordScore = 3;}
      passwordScore *= 33.33;
      roundedScore = passwordScore.toStringAsFixed(0);
    });
  }


  List<Widget> pages() => <Widget>[
    /*
    /* Generator        */ Column(
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
    /* Strength Checker */ Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        /* Score */ Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: <Widget>[
            Container(
              margin: const EdgeInsets.fromLTRB(60, 10, 60, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(" Score: ", style: TextStyle(fontSize: 22, fontWeight: FontWeight.w300)),
                  Text(roundedScore, style: const TextStyle(fontSize: 22))
                ]
              )
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(60, 10, 60, 20),
              child: Text(rankScore, style: TextStyle(color: colorScore, fontSize: 22))
            ),
          ],
        ),
        /* Input */ Container(
          margin: const EdgeInsets.fromLTRB(60, 50, 60, 0),

          child: TextField(
            autocorrect: false,
            textAlign: TextAlign.center,
            cursorColor: Colors.white,

            inputFormatters: [
              FilteringTextInputFormatter.deny(RegExp(r"\s"))
            ],

            decoration: const InputDecoration(
              label: Center(child: Text("Password")),
              labelStyle: TextStyle(color: Color.fromARGB(255, 240, 240, 240)),
              enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.teal)),
              focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.tealAccent)),
            ),

            onChanged: (text) {
              passwordInput = text;
              checkPassword(passwordInput);
            },
          )
        ),
        /* Button  */ Container(
          margin: const EdgeInsets.fromLTRB(90, 20, 90, 60),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.teal,
              textStyle: const TextStyle(fontSize: 16)
            ),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: passwordInput));
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
      ],
    ),
    /* History          */ const Text("History"),
    */
  
    // Generator
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,

      children: <Widget>[
        const SizedBox(height: 130),
        Container(height: 80,
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
        const SizedBox(height: 130),
        Container(height: 80,
          margin: const EdgeInsets.fromLTRB(50, 0, 50, 0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 30,
                child: Text(rankScore, style: TextStyle(color: colorScore, fontSize: 26))
              ),
              SizedBox(height: 30,
                child: Slider(
                  value: meterSliderValue,
                  min: 0,
                  max: 4,
                  divisions: 4,
                  label: meterSliderValue.round().toString(),
                  onChanged: (double value) {
                    setState(() {
                      meterSliderValue = value;
                    });
                  },
                  inactiveColor: themeColors["SliderBG"],
                  activeColor: themeColors["SilderFG"],
                  thumbColor: themeColors["SliderHead"],
                ),
              ),
              SizedBox(height: 20,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(" Score: ", style: TextStyle(fontSize: 18, color: themeColors["Text"])),
                    Text(roundedScore, style: TextStyle(fontSize: 18, color: themeColors["Text"]))
                  ]
                ),
              ),
            ],
          )
        ),
        Container(height: 200,
        
        ),
        Container(height: 120,
        
        ),
        Container(height: 80,
        
        ),
        const SizedBox(height: 80),
      ],
    )
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
      iconThemeMode = const Icon(Icons.nightlight_outlined, color: Color(0xFFFFFFFF));
      stringThemeMode = "Dark";
      themeColors.addAll(darkThemeColors);
      checkPassword("Password");
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Password Utilities",
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: currentThemeMode,
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
              ListTile(
                leading: Icon(Icons.trending_up_rounded, color: themeColors["Text"]),
                title: Text("Get PRO", style: TextStyle(color: themeColors["Text"])),
                //onTap: ,
              ),
              const Spacer(),
              ListTile(
                leading: iconThemeMode,
                title: Text("$stringThemeMode Theme", style: TextStyle(color: themeColors["Text"])),
                onTap: changeTheme,
              ),
              ListTile(
                leading: Icon(Icons.info_outline_rounded, color: themeColors["Text"]),
                title: Text("About", style: TextStyle(color: themeColors["Text"])),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage(currentThemeMode: currentThemeMode, darkTheme: darkTheme, lightTheme: lightTheme, themeColors: themeColors)));
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
            unselectedFontSize: 12,
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

            currentIndex: navBarIndex,
            onTap: navBarTap,
          ),
        ),

        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x00333333), Color(0xFF009688)],
              begin: Alignment.center,
              end: Alignment.bottomCenter,
            )
          ),
          child: pages()[navBarIndex]
        )
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  final ThemeMode currentThemeMode;
  final ThemeData darkTheme;
  final ThemeData lightTheme;
  final Map themeColors;
  const AboutPage({Key? key, required this.currentThemeMode, required this.darkTheme, required this.lightTheme, required this.themeColors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Password Utilities",
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: currentThemeMode,
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
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0x00333333), Color(0xFF009688)],
              begin: Alignment.center,
              end: Alignment.bottomCenter,
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
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
              ), const SizedBox(height: 50),
              Text(
                "Description",
                style: TextStyle(fontSize: 18, color: themeColors["Text"])
              ), const SizedBox(height: 50),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("App:", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.one_k_rounded, color: themeColors["Text"])),
                      IconButton(onPressed: (){}, icon: Icon(Icons.two_k_rounded, color: themeColors["Text"]))
                    ],
                  )
                ]
              ), const SizedBox(height: 30),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Socials:", style: TextStyle(fontSize: 16, color: themeColors["Text"])),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(onPressed: (){}, icon: Icon(Icons.one_k_rounded, color: themeColors["Text"])),
                      IconButton(onPressed: (){}, icon: Icon(Icons.two_k_rounded, color: themeColors["Text"])),
                      IconButton(onPressed: (){}, icon: Icon(Icons.three_k_rounded, color: themeColors["Text"]))
                    ],
                  )
                ]
              )
            ],
          ),
        ),
      ),
    );
  }
}