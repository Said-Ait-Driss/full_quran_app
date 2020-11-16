import 'package:flutter/material.dart';
import '../screens/read.dart';

class MyCard extends StatelessWidget {
  final i;
  final surah;
//Set my Icon
  Icon setIcon(String t) {
    if (t == "Meccan")
      return Icon(
        IconData(0xe900, fontFamily: 'MyfontIcon'),
        color: iconColor(),
      );
    return Icon(
      // IconData(0xe900, fontFamily: 'dua-hands'),
      IconData(0xe900, fontFamily: 'madina'),
      color: iconColor(),
    );
  }

  Color iconColor() {
    return Colors.green[900];
  }

  MyCard(this.i, this.surah);
  Widget build(BuildContext context) {
    return Card(
      color: Colors.green[200],
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: setIcon(surah['revelationType']),
          )),
          Expanded(
            flex: 2,
            child: Center(
              child: ListTile(
                title: Text(
                  surah["name"],
                  style: TextStyle(
                      fontFamily: 'Amiri',
                      fontSize: 15,
                      fontWeight: FontWeight.w900),
                ),
                leading: Text(surah['ayahs'].length.toString(),
                    style: TextStyle(fontWeight: FontWeight.w400)),
                dense: true,
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Read(surah, i)));
                },
                trailing: getSajda(surah["ayahs"]),
              ),
            ),
          ),
          Expanded(
              child: Center(
            child: Text(
              (i + 1).toString(),
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ))
        ],
      ),
    );
  }

  Widget getSajda(var y) {
    for (int p = 0; p < y.length; p++) {
      if (surah["ayahs"][p]['sajda'] != false) {
        return Text('۩',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w900, color: iconColor()));
      }
    }
    return Text('');
  }
}
