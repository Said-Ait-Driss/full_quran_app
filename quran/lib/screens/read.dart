import 'package:flutter/material.dart';

class Read extends StatefulWidget {
  final _surah;
  final _i;
  Read(this._surah, this._i);
  State<StatefulWidget> createState() {
    return _Read(_surah, _i);
  }
}

class _Read extends State<Read> with SingleTickerProviderStateMixin {
//data
  final _surah;
  var _i;
  _Read(this._surah, this._i);
//endData

  var fonts = ["الأميري", "القلم", "الكوفي", "الديوان", "إفتراضي"];
  var selectedFont = 'إفتراضي';
  String realFont = 'Roboto';
//End controller & drop items

  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: appBarRead(),
        body: mybody2(),
      ),
    );
  }

//set fontfamily
  setFont(String h) {
    setState(() {
      selectedFont = h;
      switch (h) {
        case 'الديوان':
          realFont = "divani-mazar";
          break;
        case 'الكوفي':
          realFont = "Reem Kufi";
          break;
        case 'الأميري':
          realFont = "Amiri";
          break;
        case "القلم":
          realFont = "Al_Qalam_Quran_2";
          break;
        default:
          realFont = "Roboto";
          break;
      }
    });
  }

// End setting font family
  double sliderAmount = 15;
  double toolbarheight = 55;
  double posistion = 1;
  ScrollController _listviewController;
  @override
  void initState() {
    super.initState();
    _listviewController = ScrollController();
    _listviewController.addListener(() {
      if (_listviewController.position.pixels < posistion) {
        setState(() {
          toolbarheight = 55;
        });
      } else {
        setState(() {
          toolbarheight = 0;
          posistion = _listviewController.position.pixels;
        });
      }
    });
  }

  void dispose() {
    super.dispose();
  }

  AppBar appBarRead() {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          Expanded(
            child: DropdownButton<String>(
              items: fonts.map((String selected) {
                return DropdownMenuItem<String>(
                  child: Center(
                    child: Text(selected,style: TextStyle(fontSize: 12,fontWeight: FontWeight.bold),),
                  ),
                  value: selected,
                );
              }).toList(),
              onChanged: (selectedItem) {
                setFont(selectedItem);
              },
              value: selectedFont,
              autofocus: true,
              dropdownColor: Colors.green[200],
              icon: Icon(
                Icons.text_format,
                color: Colors.green[200],
                size: 24,
              ),
              style: TextStyle(fontSize: 15),
              isExpanded: true,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
              flex: 4,
              child: Slider(
                value: sliderAmount,
                onChanged: (v) {
                  setState(() {
                    sliderAmount = v;
                  });
                },
                max: 30,
                min: 15,
                divisions: 5,
                activeColor: Colors.green[300],
                inactiveColor: Colors.green[300],
              )),
        ],
      ),
      centerTitle: true,
      backgroundColor: Colors.green,
      elevation: 2,
      toolbarHeight: toolbarheight,
    );
  }

  mybody2() {
    return Container(
        color: Colors.green[200],
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            Container(
              height: 49,
              alignment: Alignment.topCenter,
              child: Card(
                elevation: 2,
                color: Colors.green[300],
                child: ListTile(
                  leading:
                      Text("﴿ " + _surah['ayahs'].length.toString() + " ﴾"),
                  title: Text(
                    "﴿" + _surah["name"] + "﴾      \b",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    "﴿ " + (_i + 1).toString() + " ﴾",
                    style: TextStyle(
                        fontFamily: 'Amiri', fontWeight: FontWeight.w300),
                  ),
                  dense: true,
                ),
              ),
            ),
            Flexible(
              child: ListView.builder(
                controller: _listviewController,
                itemBuilder: (BuildContext context, int i) {
                  return readSheet(_surah["ayahs"], i);
                },
                itemCount: _surah['ayahs'].length,
              ),
            )
          ],
        ));
  }

//ayahs,
  String getPage(ayahs, int i) {
    if (i > 0) {
      if (ayahs[i]["page"] > ayahs[i - 1]["page"])
        return ayahs[i]['page'].toString();
    } else if (i == 0) return ayahs[i]['page'].toString();
    return "";
  }

  Widget readSheet(_ayahs, ii) {
    Divider _bodyDivider = new Divider(
      color: Colors.black,
      height: 60,
      endIndent: 10,
    );
    return Column(
      children: [
        Row(
          children: [
            _bodyDivider,
            Expanded(
              child: Center(
                  child: Text(
                getPage(_ayahs, ii),
                    style: TextStyle(fontSize: 12),
              )),
            ),
            _bodyDivider,
            Expanded(
              flex: 10,
              child: Center(
                child: Text(
                  _ayahs[ii]['text'] + '\n'.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: sliderAmount,
                      fontWeight: FontWeight.w700,
                      fontFamily: realFont),
                ),
              ),
            ),
            _bodyDivider,
            Expanded(
              flex: 2,
              child: Center(
                child: Text(
                  "﴿" + (ii + 1).toString() + "﴾",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.green[900],
                      fontWeight: FontWeight.w900),
                ),
              ),
            ),
            _bodyDivider,
            Expanded(
              child: Center(
                child: Text(
                  _ayahs[ii]["number"].toString(),
                  style: TextStyle(fontSize: 9),
                ),
              ),
            ),
            _bodyDivider,
          ],
        )
      ],
    );
  }
}
