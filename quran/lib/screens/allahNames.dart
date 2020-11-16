import 'package:flutter/material.dart';
import '../Components/myDrawer.dart';
import '../Components/redsheet.dart';

void main() => runApp(AllhNames());

class AllhNames extends StatefulWidget {
  State<StatefulWidget> createState() {
    return _AllhNames();
  }
}

// 'أسماء الله الحسنى'       ﴿
class _AllhNames extends State<AllhNames> {
  List<String> names = getNames();

  double toolbarheight = 55;
  Color headercolor = Colors.green;
  double posistion = 10;
  ScrollController _listviewController;
  @override
  void initState() {
    super.initState();
    _listviewController = ScrollController();
    _listviewController.addListener(() {
      if (_listviewController.position.pixels < posistion) {
        setState(() {
          toolbarheight = 55;
          headercolor = Colors.green;
        });
      } else {
        setState(() {
          toolbarheight = 0;
          headercolor = Colors.green[200];
          posistion = _listviewController.position.pixels;
        });
      }
    });
  }

  void dispose() {
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            appBar: AppBar(
              title: Text(
                '',
              ),
              backgroundColor: Colors.green,
              elevation: 0,
              toolbarHeight: toolbarheight,
            ),
            drawer: MyDrawer(),
            body: Column(
              children: [
                getHeader(),
                Flexible(
                    child: GridView.builder(
                  addAutomaticKeepAlives: true,
                  addRepaintBoundaries: true,
                  shrinkWrap: true,
                  addSemanticIndexes: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4,
                      crossAxisSpacing: 19,
                      mainAxisSpacing: 0),
                  controller: _listviewController,
                  itemCount: names.length,
                  itemBuilder: (BuildContext context, int i) {
                    return getWrap(names[i]);
                  },
                ))
              ],
            )));
  }

  // ScrollController _controller;

  getHeader() {
    return Container(
      color: headercolor,
      width: MediaQuery.of(context).size.width,
      child: Text(
        '﴿أسماء الله الحسنى ﴾',
        style: TextStyle(
            fontFamily: 'Amiri', fontSize: 24, fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
      ),
    );
  }

  getWrap(String name) {
    return Padding(
        padding: EdgeInsets.only(top: 15),
        child: Card(
            color: Colors.green[200],
            borderOnForeground: true,
            shape: BeveledRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                name,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                    fontFamily: 'Amiri'),
                textAlign: TextAlign.center,
              ),
            )));
  }
}
