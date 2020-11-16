import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

void main() {
  runApp(Myshimmer());
}

class Myshimmer extends StatelessWidget {
  Widget build(BuildContext context) {
    return Container();
  }

  Icon modul2(int y) {
    if (y % 2 == 0) {
      return Icon(
        IconData(0xe900, fontFamily: 'MyfontIcon'),
        color: Colors.grey[200],
      );
    }
    return Icon(
      IconData(0xe900, fontFamily: 'madina'),
      color: Colors.grey[200],
    );
  }

//MyShimmer

  Widget myShimmer(int i) {
    return Shimmer.fromColors(
      baseColor: Colors.grey,
      highlightColor: Colors.white,
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.only(left: 20),
            child: modul2(i),
          )),
          Expanded(
            flex: 2,
            child: Center(
              child: ListTile(
                title: Text(
                  '_________',
                  style: TextStyle(
                      fontFamily: 'Amiri',
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                leading: Text('________',
                    style: TextStyle(fontWeight: FontWeight.w400)),
                dense: true,
              ),
            ),
          ),
          Expanded(
              child: Center(
            child: Text(
              ' ______________',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ))
        ],
      ),
    );
  }
//End myShimmer

}
