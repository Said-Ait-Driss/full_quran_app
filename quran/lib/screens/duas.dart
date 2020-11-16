import 'package:flutter/material.dart';
import 'package:quran/Components/myDrawer.dart';
import 'package:quran/screens/duaReader.dart';
import '../Components/redsheet.dart';

void main() => runApp(Dua());

class Dua extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _Dua();
  }
}

class _Dua extends State<Dua> {
  var quranDua = getQuranDuas();
  var adkarsaba7 = getAdkarDay();
  var adkarmasa2 = getAdkarnight();
  var nabesDuas = getNabesdua();
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green,
            ),
            drawer: MyDrawer(),
            body: ListView(
              children: [
                Container(
                  color: Colors.green[200],
                  child: ListTile(
                    title: Text(
                      'قـائمة الأذكار والأدعية',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w900),
                    ),
                    contentPadding: EdgeInsets.only(right: 20),
                  ),
                ),
                getContainer(
                  'الأدعية التي ذكرت في القران',
                  quranDua,
                  Icons.book,
                ),
                getContainer(
                  'أدعية الأنبياء',
                  nabesDuas,
                  Icons.accessibility,
                ),
                getContainer('أذكار الصباح', adkarsaba7, Icons.brightness_5),
                getContainer('أذكار المساء', adkarmasa2, Icons.brightness_3)
              ],
            )));
  }
//

  getContainer(String text, var data, IconData iconData) {
    return Container(
      color: Colors.green[200],
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        leading: Icon(
          iconData,
          color: Colors.green[900],
        ),
        contentPadding: EdgeInsets.only(right: 20),
        onTap: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => DuaReader(data, text)));
        },
      ),
      margin: EdgeInsets.only(bottom: 20, right: 10, left: 10, top: 10),
    );
  }
}
