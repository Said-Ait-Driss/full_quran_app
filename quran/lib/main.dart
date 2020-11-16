import 'package:flutter/material.dart';
import 'Components/myDrawer.dart';
import 'Components/myCard.dart';
import 'dart:convert';
import 'dart:async';
import 'package:flutter/services.dart';
import 'Components/shimmer.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(Quran());
}

var data;
var surahs;

class Quran extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _Quran();
  }
}

class _Quran extends State<Quran> {
  Future getquranData() async {
    String path = "assets/quran-uthmani.json";
    var showData = await rootBundle.loadString(path);

    setState(() {
      var data1 = json.decode(showData);
      data = data1;
      surahs = data["data"]["surahs"];
    });
  }

  void initState() {
    super.initState();
    if (data == null) {
      getquranData();
    }
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SplashScreen(
          seconds: 7,
          backgroundColor: Colors.green,
          navigateAfterSeconds: MyApp(),
          image: Image.asset("images/logo.png"),
          loadingText: Text(
            'Loading',
            style: TextStyle(color: Colors.green[900]),
          ),
          photoSize: 130,
          loaderColor: Colors.green[900],
        )));
  }

  @override
  void dispose() {
    super.dispose();
  }
}

class MyApp extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  //start= fetch data from the local file
  var filltred = [];
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    // if (data == null) {
    //   getquranData();
    // }
    searchController.addListener(() {
      fillter();
    });
  }

  fillter() {
    List<Object> sur = [];
    filltred = [];
    if (searchController.text.isNotEmpty) {
      for (int i = 0; i < surahs.length; i++) {
        if (surahs[i]["name"].contains(searchController.text)) {
          sur.add(surahs[i]);
        }
      }
      setState(() {
        filltred = sur;
      });
    } else {
      setState(() {
        sur = filltred;
        filltred = [];
      });
    }
  }

//end data feching

  Brightness darkMode = Brightness.light;
  Color darkColor = Colors.white;
  final TextStyle myStyle =
      TextStyle(fontWeight: FontWeight.bold, fontSize: 16.5);
  bool numb = false;
  @override
  Widget build(BuildContext context) {
    bool isEmpty = searchController.text.isEmpty;
    return MaterialApp(
        theme: ThemeData(
          brightness: darkMode,
        ),
        title: 'quran',
        debugShowCheckedModeBanner: false,
        home: Directionality(
            textDirection: TextDirection.rtl,
            child: Scaffold(
              appBar: myAppBar(),
              drawer: MyDrawer(),
              drawerScrimColor: Colors.green.withOpacity(0.3),
              body: ListView.builder(
                itemCount: isEmpty == false ? filltred.length : 114,
                itemBuilder: (BuildContext context, int i) {
                  if (data != null) {
                    if (isEmpty == true) {
                      return MyCard(i, surahs[i]);
                    } else {
                      return MyCard(i, filltred[i]);
                    }
                  }
                  return Myshimmer().myShimmer(i);
                },
              ),
            )));
  }
//        IconData(0xe900, fontFamily: 'MyfontIcon'),

//         AppBar
  AppBar myAppBar() {
    return AppBar(
      toolbarHeight: 67,
      title: Row(
        children: [
          Expanded(
              flex: 7,
              child: TextField(
                controller: searchController,
                cursorColor: Colors.white,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    filled: true,
                    border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.green[200],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'ابحت عن سورة',
                    prefixIcon: Icon(
                      Icons.search,
                      color: Colors.green[200],
                    ),
                    hintStyle: TextStyle(color: Colors.green[200])),
              )),
          IconButton(
            padding: EdgeInsets.only(right: 20),
            icon: Icon(Icons.brightness_3, color: darkColor),
            onPressed: () {
              setState(() {
                darkMode == Brightness.light
                    ? darkMode = Brightness.dark
                    : darkMode = Brightness.light;
                darkColor == Colors.white
                    ? darkColor = Colors.blueGrey[800]
                    : darkColor = Colors.white;
              });
            },
          )
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.green,
      elevation: 8,
    );
  }
}
