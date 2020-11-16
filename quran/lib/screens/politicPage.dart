import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PoliticPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.green,
            title: Text('سياسة الخصوصية'),
            leading: Icon(
              Icons.verified_user,
              color: Colors.green[900],
            ),
          ),
          body:Container(
            child:
          Image.asset("images/pliciy.png",fit: BoxFit.cover,),
          )
        ));


  }
}
