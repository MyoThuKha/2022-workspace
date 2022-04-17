import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/services/base.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  //
  Widget switchButton(Color? switchColor) {
    // Transform.scale(
    //   scale: 0.7,
    //   child: )
    return Switch.adaptive(
      activeColor: Colors.white,
      activeTrackColor: switchColor,
      value: isDarkMode,
      onChanged: (value) => setState(() {
        isDarkMode = value;
        //isDarkMode = !isDarkMode;
      }),
    );
  }

  Widget autoCorrectButton(Color? switchColor) {
    // Transform.scale(
    //   scale: 0.7,
    //   child: )
    return Switch.adaptive(
      activeColor: Colors.white,
      activeTrackColor: switchColor,
      value: isAutoCorrect,
      onChanged: (value) => setState(() {
        isAutoCorrect = value;
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        toolbarHeight: 130,
        backgroundColor: Colors.blue[200],
        elevation: 0,
        flexibleSpace: Center(
            child: Text(
          "Settings",
          style: TextStyle(
              color: Colors.white,
              letterSpacing: 1,
              fontSize: 30,
              fontFamily: defaultAppFont),
        )),
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: Container(
          width: MediaQuery.of(context).size.width,
          color: lightAppColor,
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //Dark Mode
                ListTile(
                  leading: CustomIcon().nightIcon(),
                  title: const Text(
                    "Dark Mode",
                    //style: TextStyle(fontFamily: defaultAppFont),
                  ),
                  trailing: switchButton(Colors.amber),
                ),
                const Divider(height: 2),

                //Font
                GestureDetector(
                  child: ListTile(
                    leading: CustomIcon().textIcon(),
                    title: const Text("Font"),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    ),
                  ),
                  onTap: (() async {
                    await showDialog(
                      context: context,
                      builder: (BuildContext builder) => const FontAlert(),
                    );
                    //to rebuild after pop up
                    setState(() {});
                  }),
                ),
                const Divider(height: 2),

                //Auto Correct
                ListTile(
                  leading: CustomIcon().penIcon(),
                  title: const Text(
                    "Auto Correct",
                    //style: TextStyle(fontFamily: defaultAppFont),
                  ),
                  trailing: autoCorrectButton(Colors.green),
                ),
                const Divider(height: 2),

                //Delete all notes
                GestureDetector(
                  onTap: () {
                    deleteAlert(context,
                        id: "All",
                        displayText: "Delete All Notes?",
                        goMenu: false);
                  },
                  child: const ListTile(
                    leading: Icon(CupertinoIcons.delete),
                    title: Text("Delete All Notes"),
                    trailing: Icon(
                      Icons.arrow_forward_ios_rounded,
                      size: 20,
                    ),
                  ),
                ),
                const Divider(height: 2),
                const ListTile(
                  leading: Icon(CupertinoIcons.exclamationmark_circle),
                  title: Text("Contact Me"),
                  trailing: Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 20,
                  ),
                ),
                const Divider(height: 2),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
