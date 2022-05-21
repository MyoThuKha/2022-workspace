import 'package:advanced_icon/advanced_icon.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/services/note_template.dart';

String defaultAppFont = "Roboto";
String chooseFont = "Roboto";
Color? lightAppColor = Colors.grey[200];
Color? darkAppColor = const Color(0x00312944);
Color? darkAppBar = Colors.grey[900];
bool isDarkMode = false;
int selectedValue = 0;
bool isAutoCorrect = false;
String orderBy = 'ASC';
bool isASC = false;

List<String> fonts = [
  'Roboto',
  'Abel',
  'Lobster',
  'NotoSerif',
  'Rubik',
  'ShadowsIntoLight',
  'SourceCodePro',
];
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

class FontAlert extends StatefulWidget {
  const FontAlert({Key? key}) : super(key: key);

  @override
  State<FontAlert> createState() => _FontAlertState();
}

class _FontAlertState extends State<FontAlert> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      title: Column(
        children: const <Widget>[
          Text("Choose Font"),
          Divider(),
        ],
      ),
      content: Container(
        height: 200,
        child: ListView.builder(
            itemCount: fonts.length,
            itemBuilder: (BuildContext context, int index) {
              return RadioListTile<int>(
                activeColor: Colors.green,
                value: index,
                title:
                    Text(fonts[index] == 'Roboto' ? 'Default' : fonts[index]),
                groupValue: selectedValue,
                onChanged: (value) => setState(() {
                  selectedValue = index;
                  chooseFont = fonts[index];
                }),
              );
            }),
      ),
      actions: <Widget>[
        const Divider(),
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
                  onPressed: () {
                    defaultAppFont = chooseFont;
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
  }
}

//Department of Notifications
class CustomNoti {
  SnackBar favNoti(bool isFav) {
    return SnackBar(
      duration: const Duration(milliseconds: 800),
      content: Text(isFav ? 'Added to Favorite' : 'Remove from Favorite'),
      backgroundColor: isFav ? Colors.amber : Colors.blue[200],
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

  SnackBar duplicateNoti() {
    return SnackBar(
      duration: const Duration(milliseconds: 800),
      content: const Text(
        'Duplicated',
        style: TextStyle(letterSpacing: 1),
      ),
      backgroundColor: Colors.blue[200],
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10))),
      elevation: 1,
    );
  }
}

Future<void> deleteAlert(context,
    {required dynamic id,
    required String displayText,
    required bool goMenu}) async {
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Column(
            children: <Widget>[
              Text(displayText),
              const Divider(height: 20),
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
                          id == "All"
                              ? await NoteTemplate().deleteAll()
                              : await NoteTemplate().delete(id);
                          //goBack once cause deleteData has goBack function.
                        } catch (e) {
                          //Do nothing.
                        }
                        if (goMenu) {
                          Navigator.pop(context);
                        }

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
          colors: [Colors.yellow, Colors.amber, Colors.red]),
    );
  }

  Widget pinIcon() {
    return const Icon(
      Icons.push_pin,
      color: Colors.red,
    );
  }

  Widget nightIcon() {
    return const AdvancedIcon(
      icon: CupertinoIcons.moon_fill,
      gradient: LinearGradient(colors: [Colors.amber, Colors.orange]),
    );
  }

  Widget textIcon() {
    return const AdvancedIcon(
      icon: CupertinoIcons.textformat,
      gradient: LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [Colors.red, Colors.blue]),
    );
  }

  Widget penIcon() {
    return const AdvancedIcon(
      icon: CupertinoIcons.pen,
      size: 28,
      gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.blue, Colors.green],
      ),
    );
  }

  Widget explanIcon() {
    return const AdvancedIcon(
      icon: CupertinoIcons.exclamationmark_circle,
      size: 28,
      gradient: LinearGradient(
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
        colors: [Colors.red, Colors.amber],
      ),
    );
  }

  Widget sortIcon() {
    return AdvancedIcon(
      icon: isASC ? CupertinoIcons.sort_down : CupertinoIcons.sort_up,
      size: 28,
      gradient: const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.centerRight,
        colors: [Colors.purple, Colors.green],
      ),
    );
  }
}
