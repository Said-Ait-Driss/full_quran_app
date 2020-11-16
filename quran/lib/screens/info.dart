import 'package:flutter/material.dart';
import 'politicPage.dart';

void main() => runApp(Info());

class Info extends StatelessWidget {
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              'عن التطـبيق',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
            ),
            leading: Icon(
              Icons.info_outline,
              size: 30,
            ),
            backgroundColor: Colors.green,
          ),
          body: ListView(
            children: [
              Container(
                margin: EdgeInsets.only(top: 20, bottom: 20),
                height: 120,
                child: Image.asset(
                  'images/logo.png',
                  fit: BoxFit.contain,
                ),
              ),
              Divider(
                color: Colors.green[200],
              ),
              ListTile(
                title: Text(
                  'الاِصـدار : ' + "1.0.1",
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 19),
                ),
                leading: Icon(
                  Icons.android,
                  color: Colors.green[900],
                ),
                subtitle: Text(
                  'لديك أخـر اٍصـدار مـن التـطبيق',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                dense: true,
                trailing: Icon(
                  Icons.check_circle,
                  color: Colors.green[300],
                ),
              ),
              Divider(
                color: Colors.green[200],
              ),
              ListTile(
                title: Text(
                  "سياسة الخصوصية",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 19),
                ),
                leading: Icon(
                  Icons.verified_user,
                  color: Colors.green[900],
                ),
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => PoliticPage()));
                },
              ),
              Divider(
                color: Colors.green[200],
              ),
              ListTile(
                title: Text('تـواصل معـنا'),
              ),
              ListTile(
                title: Text(
                  'راسلنا عبر البريد الاٍلكتروني',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                leading: Icon(
                  Icons.mail,
                  color: Colors.green[900],
                ),
              ),
              ListTile(
                title: Text(
                  'قيم التطبيق على Google play ',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
                ),
                leading: Icon(
                  Icons.play_arrow,
                  color: Colors.green[900],
                ),
              )
            ],
          ),
        ));
  }
}
