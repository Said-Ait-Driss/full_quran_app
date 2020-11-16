import 'package:flutter/material.dart';

class DuaReader extends StatefulWidget {
  final _duas;
  final _appBarTitle;
  DuaReader(this._duas, this._appBarTitle);
  State<StatefulWidget> createState() {
    return _DuaReader(_duas, _appBarTitle);
  }
}

class _DuaReader extends State<DuaReader> {
  var _duas;
  final _appBarTitle;
  _DuaReader(this._duas, this._appBarTitle);

  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
              "﴿ " + _appBarTitle + " ﴾",
              style: TextStyle(
                  fontFamily: "Amiri", fontSize: 22, color: Colors.green[100]),
              textAlign: TextAlign.center,
            ),
            backgroundColor: Colors.green,
            automaticallyImplyLeading: false,
          ),
          body: Container(
            child: ListView.builder(
              itemBuilder: (context, int i) {
                return _container(i);
              },
              itemCount: _duas.length,
            ),
          ),
        ));
  }

  Container _container(int i) {
    return Container(
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.only(top: 10),
      color: Colors.green[200],
      child: ListTile(
        title: Text(
          _duas[i]['dua'],
          style: TextStyle(fontSize: 27, fontFamily: "Amiri"),
        ),
        leading: Text(
          _duas[i]['name'].toString(),
          style: TextStyle(
              fontWeight: FontWeight.w900,
              fontSize: 15,
              color: Colors.green[900]),
        ),
        dense: true,
        onTap: () {
          print(_duas);
        },
      ),
    );
  }
}
