import 'package:flutter/material.dart';
import './redsheet.dart';
import 'package:url_launcher/url_launcher.dart';

class MyDrawer extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _MyDrawer();
  }
}

class _MyDrawer extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(children: [
      Container(
        color: Colors.green[200],
        child: DrawerHeader(
          child: Image.asset(
            "images/logo.png",
            fit: BoxFit.contain,
          ),
        ),
      ),
      drawerInkWell("الرئـسية", "الذهاب إلى الرئـيسية", Icons.home, 1),
      Divider(
        color: Colors.green,
      ),
      drawerInkWell("أسماء الله الحسنى", " قائـمة أسماء الله الحسنى",
          IconData(0xe901, fontFamily: 'allah-names'), 2),
      Divider(
        color: Colors.green,
      ),
      drawerInkWell("الأدعـية", "الذهاب إلى الأدعـية",
          IconData(0xe901, fontFamily: 'dua-hands'), 3),
      Divider(
        color: Colors.green,
      ),
      drawerInkWell("حول", "حول التطـبيق", Icons.info, 4),
      Divider(
        color: Colors.green,
      ),
      drawerInkWell('تطبيقاتنا', 'التعرف علئ  تطبيقاتنا', Icons.apps, 5),
    ]));
  }

  InkWell drawerInkWell(
      String text, String subtitle, IconData icon, int nbrePage) {
    return InkWell(
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
        ),
        subtitle: Text(
          subtitle,
          style: TextStyle(fontSize: 10),
        ),
        leading: Icon(
          icon,
          color: Colors.green[900],
        ),
        dense: true,
        hoverColor: Colors.green[200],
      ),
      onTap: () {
        if (nbrePage == 5) {
          _lunchUrl();
        } else {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => pagesNavigate(nbrePage)));
        }
      },
    );
  }

  _lunchUrl() async {
    const url = 'https://www.facebook.com/said.aitdriss/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
