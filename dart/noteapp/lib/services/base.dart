import 'package:advanced_icon/advanced_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/services/note_template.dart';

Widget noNote(String displayText) {
  return Container(
    margin: const EdgeInsets.only(bottom: 56),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        /*Center(
          child: Image.asset(
            'assets/Images/iceCoffee.png',
            scale: 12,
          ),
        ),*/
        Center(
          child: Material(
            borderRadius: BorderRadius.circular(20),
            elevation: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                color: Colors.white,
                width: 150,
                height: 150,
                child: Column(
                  children: <Widget>[
                    const SizedBox(height: 5),
                    CustomIcon().pinIcon(),
                    const SizedBox(height: 35),
                    Text(
                      displayText,
                      style: const TextStyle(fontSize: 20, letterSpacing: 1),
                    ),
                  ],
                ),
              ),
            ),
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
      backgroundColor: isFav ? Colors.orange[200] : Colors.blue[200],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      //behavior: SnackBarBehavior.floating,
    );
  }

  SnackBar saveNoti() {
    return SnackBar(
      duration: const Duration(milliseconds: 800),
      content: const Text(
        'Saved',
        style: TextStyle(letterSpacing: 1),
      ),
      backgroundColor: Colors.blue[200],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      behavior: SnackBarBehavior.floating,
      elevation: 1,
    );
  }
}

Future<void> deleteAlert(context, int id) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: const <Widget>[
              Text("Delete this note?"),
              Divider(height: 20),
            ],
          ),
          //content: Divider(height: 20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          actions: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Cancel',
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                Expanded(
                  child: TextButton(
                      onPressed: () async {
                        try {
                          await NoteTemplate().delete(id);
                          //goBack once cause deleteData has goBack function.
                        } catch (e) {
                          //Do nothing.
                        }
                        Navigator.pop(context);
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'OK',
                        style: TextStyle(color: Colors.black),
                      )),
                ),
              ],
            )
          ],
        );
      });
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

  Widget pinIcon() {
    return const Icon(
      Icons.push_pin,
      color: Colors.red,
    );
  }
}
