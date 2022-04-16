import 'package:advanced_icon/advanced_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget noNote() {
  return Container(
    margin: const EdgeInsets.only(bottom: 56),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const <Widget>[
        /*Center(
          child: Image.asset(
            'assets/Images/iceCoffee.png',
            scale: 12,
          ),
        ),*/
        Center(
          child: Text(
            "No Notes Here! ツ",
            style: TextStyle(fontSize: 20, letterSpacing: 1),
          ),
        )
      ],
    ),
  );
}

//Department of Notifications
class CustomNoti {
  SnackBar favNoti(bool isFav) {
    return SnackBar(
      duration: const Duration(milliseconds: 800),
      content: Text(isFav ? 'Added to Favorite' : 'Remove from Favorite'),
      backgroundColor: isFav ? Colors.orange[200] : Colors.grey[700],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
    );
  }

  SnackBar saveNoti() {
    return SnackBar(
      duration: const Duration(milliseconds: 800),
      content: const Text('Saved'),
      backgroundColor: Colors.blue[100],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      behavior: SnackBarBehavior.floating,
    );
  }

  // void deleteDialog(context) {
  //   showDialog(
  //       context: context,
  //       builder: (BuildContext context) {
  //         return AlertDialog(
  //           content: Text("Delete this Note?"),
  //           actions: <Widget>[
  //             TextButton(
  //                 onPressed: () {
  //                   Navigator.pop(context);
  //                 },
  //                 child: Text('Cancel')),
  //             TextButton(onPressed: () {

  //             }, child: Text('Yes'))
  //           ],
  //         );
  //       });
  // }
}

//Department of Icons
class CustomIcon {
  Widget searchIcon() {
    return const AdvancedIcon(
      icon: Icons.search_rounded,
      gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.green, Colors.blue]),
    );
  }

  Widget todayIcon() {
    return const AdvancedIcon(
      icon: CupertinoIcons.cloud_sun_fill,
      size: 30,
      gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.red, Colors.yellow]),
    );
  }
}
