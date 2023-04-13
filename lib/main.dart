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
  Map<String, Color> themeColors = {};

  Map<String, Color> darkThemeColors = {
    "Text" : const Color(0xFFFFFFFF)
  };

  Map<String, Color> lightThemeColors = {
    "Text" : const Color(0xFF000000)
  };
  

  // changeTheme()
  Icon iconThemeMode = const Icon(Icons.wb_cloudy_outlined, color: Color(0xFFFFFFFF));
  String stringThemeMode = "System";

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
  double passwordScore = 0;
  String roundedScore = "0";
  String rankScore = "Poor";
  MaterialColor colorScore = Colors.red;

  // build()
  ThemeMode currentThemeMode = ThemeMode.system;
  ThemeData darkTheme = ThemeData(
    fontFamily: "Inter",
    scaffoldBackgroundColor: const Color(0xFF0B1817),
  );
  ThemeData lightTheme = ThemeData(
    fontFamily: "Inter",
    scaffoldBackgroundColor: const Color(0xFFDCEFED),
  );



  void changeTheme() {
    setState(() {
      if (currentThemeMode == ThemeMode.system) {
        currentThemeMode = ThemeMode.dark;
        iconThemeMode = const Icon(Icons.nightlight_outlined, color: Color(0xFFFFFFFF));
        stringThemeMode = "Dark";
        themeColors = darkThemeColors;
      }
      else if (currentThemeMode == ThemeMode.dark) {
        currentThemeMode = ThemeMode.light;
        iconThemeMode = const Icon(Icons.wb_sunny_outlined, color: Color(0xFFFFFFFF));
        stringThemeMode = "Light";
        themeColors = lightThemeColors;
      }
      else if (currentThemeMode == ThemeMode.light) {
        currentThemeMode = ThemeMode.system;
        iconThemeMode = const Icon(Icons.wb_cloudy_outlined, color: Color(0xFFFFFFFF));
        stringThemeMode = "System";
        themeColors = darkThemeColors;
      }
    });
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
      - You lose -0.15 score for consectitive types (cns)
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
        passwordScore -= 0.15;
      }

      prevChar = char;
    }
    
    if (passwordScore >= 3) {
      rankScore = "Strong";
      colorScore = Colors.teal;
    }
    else if (passwordScore >= 2) {
      rankScore = "Good";
      colorScore = Colors.green;
    }
    else if (passwordScore >= 1) {
      rankScore = "Fair";
      colorScore = Colors.orange;
    }
    else if (passwordScore >= 0) {
      rankScore = "Poor";
      colorScore = Colors.red;
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
          decoration: const BoxDecoration(
            color: Color(0x33555555),
            borderRadius: BorderRadius.all(Radius.circular(25))
          ),
          child: Text(password, style: const TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
        ),
        Container(height: 80,
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(95, 0, 95, 0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF009688),
              textStyle: const TextStyle(fontSize: 16)
            ),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: password));
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                Icon(Icons.copy_rounded),
                Text("  Copy to Clipboard")
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
                    const Text("Length", style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
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
                      inactiveColor: const Color(0xFF303030),
                      activeColor: const Color(0xFF1DE2BF),
                      thumbColor: const Color(0xFF009688),
                    ),
                  ]
                )
              ),
              SizedBox(height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Capitals", style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
                    Switch(
                      value: capitalsSwitchValue,
                      onChanged: (value) {
                        setState(() {
                          capitalsSwitchValue = value;
                        });
                      },
                      activeTrackColor: const Color(0xFF1DE2BF),
                      activeColor: const Color(0xFF009688),
                      inactiveTrackColor: const Color(0xFF303030),
                      inactiveThumbColor: const Color(0xFF888888),
                    ),
                  ]
                )
              ),
              SizedBox(height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Numbers", style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
                    Switch(
                      value: numbersSwitchValue,
                      onChanged: (value) {
                        setState(() {
                          numbersSwitchValue = value;
                        });
                      },
                      activeTrackColor: const Color(0xFF1DE2BF),
                      activeColor: const Color(0xFF009688),
                      inactiveTrackColor: const Color(0xFF303030),
                      inactiveThumbColor: const Color(0xFF888888),
                    ),
                  ]
                )
              ),
              SizedBox(height: 48,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text("Symbols", style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
                    Switch(
                      value: symbolsSwitchValue,
                      onChanged: (value) {
                        setState(() {
                          symbolsSwitchValue = value;
                        });
                      },
                      activeTrackColor: const Color(0xFF1DE2BF),
                      activeColor: const Color(0xFF009688),
                      inactiveTrackColor: const Color(0xFF303030),
                      inactiveThumbColor: const Color(0xFF888888),
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
              backgroundColor: const Color(0xFF009688),
              textStyle: const TextStyle(fontSize: 16)
            ),
            onPressed: () {
              generatePassword(lengthSliderValue.toInt(), capitalsSwitchValue, numbersSwitchValue, symbolsSwitchValue);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(Icons.file_download_outlined),
                Text("  Generate")
              ],
            )
          ),
        ),
        const SizedBox(height: 80),
      ],
    )
  ];


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Password Utilities",
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: currentThemeMode,
      
      home: Scaffold(
        extendBodyBehindAppBar: true,
        extendBody: true,
        
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            elevation: 0,
            backgroundColor: const Color(0xFF0B1817),
            title: const Text("Simple Password Utilities", style: TextStyle(fontSize: 22)),
            centerTitle: true,
          ),
        ),
        
        drawer: Drawer(
          backgroundColor: const Color(0xFF17201F),
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
                    const Text("Simple Password Utilities", style: TextStyle(fontSize: 22, color: Color(0xFFFFFFFF))),
                    const SizedBox(height: 3),
                    const Text("Created by Aaron Chauhan", style: TextStyle(fontSize: 16, color: Color(0xFFFFFFFF))),
                  ],
                ),
              ),
              const ListTile(
                leading: Icon(Icons.trending_up_rounded, color: Color(0xFFFFFFFF)),
                title: Text("Get PRO", style: TextStyle(color: Color(0xFFFFFFFF))),
                //onTap: ,
              ),
              const Spacer(),
              ListTile(
                leading: iconThemeMode,
                title: Text("$stringThemeMode Theme", style: TextStyle(color: themeColors["Text"])),
                onTap: changeTheme,
              ),
              ListTile(
                leading: const Icon(Icons.question_mark_rounded, color: Color(0xFFFFFFFF)),
                title: const Text("How It Works", style: TextStyle(color: Color(0xFFFFFFFF))),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => HowItWorksPage(currentThemeMode: currentThemeMode, darkTheme: darkTheme, lightTheme: lightTheme)));
                },
              ),
              ListTile(
                leading: const Icon(Icons.info_outline_rounded, color: Color(0xFFFFFFFF)),
                title: const Text("About", style: TextStyle(color: Color(0xFFFFFFFF))),
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => AboutPage(currentThemeMode: currentThemeMode, darkTheme: darkTheme, lightTheme: lightTheme)));
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
            selectedItemColor: const Color(0xFF1DE2BF),
            unselectedItemColor: const Color(0xFFFFFFFF),
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

class HowItWorksPage extends StatelessWidget {
  final ThemeMode currentThemeMode;
  final ThemeData darkTheme;
  final ThemeData lightTheme;
  const HowItWorksPage({Key? key, required this.currentThemeMode, required this.darkTheme, required this.lightTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Password Utilities",
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: currentThemeMode,
      
      home: Scaffold(
        appBar: AppBar(
          title: const Text("How It Works"),
          centerTitle: true,
          backgroundColor: Colors.teal,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            icon: const Icon(Icons.arrow_back_rounded)
          ),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            /* Desc    */ Text(
              "Description",
              style: TextStyle(fontSize: 18)
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  final ThemeMode currentThemeMode;
  final ThemeData darkTheme;
  final ThemeData lightTheme;
  const AboutPage({Key? key, required this.currentThemeMode, required this.darkTheme, required this.lightTheme}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Simple Password Utilities",
      darkTheme: darkTheme,
      theme: lightTheme,
      themeMode: currentThemeMode,
      
      home: Scaffold(
        appBar: AppBar(
          title: const Text("About"),
          centerTitle: true,
          backgroundColor: Colors.teal,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            }, 
            icon: const Icon(Icons.arrow_back_rounded)
          ),
        ),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /* Title   */ Row(
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
                  children: const <Widget>[
                    Text("Simple Password Utilities", style: TextStyle(fontSize: 22)),
                    SizedBox(height: 3),
                    Text("Created by Aaron Chauhan", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300)),
                  ]
                )
              ],
            ), const SizedBox(height: 50),
            /* Desc    */ const Text(
              "Description",
              style: TextStyle(fontSize: 18)
            ), const SizedBox(height: 50),
            /* App     */ Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("App:", style: TextStyle(fontSize: 16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.one_k_rounded)),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.two_k_rounded))
                  ],
                )
              ]
            ), const SizedBox(height: 30),
            /* Socials */ Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text("Socials:", style: TextStyle(fontSize: 16)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(onPressed: (){}, icon: const Icon(Icons.one_k_rounded)),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.two_k_rounded)),
                    IconButton(onPressed: (){}, icon: const Icon(Icons.three_k_rounded))
                  ],
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}