import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:note_app/services/base.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({Key? key}) : super(key: key);

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        toolbarHeight: MediaQuery.of(context).size.height / 5,
        backgroundColor: Colors.amber,
        flexibleSpace: SizedBox(
          child: Center(
              child: Text(
            'Action Menu',
            style: TextStyle(
                color: Colors.white,
                letterSpacing: 1,
                fontSize: 25,
                fontWeight: FontWeight.w600,
                fontFamily: defaultAppFont),
          )),
        ),
      ),
      body: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        child: Container(
          //height: MediaQuery.of(context).size.height / 5 * 4,
          color: lightAppColor,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: ListView(
            children: <Widget>[
              drawerMember(
                title: 'Home',
                icon: const Icon(Icons.home_rounded),
                onTouch: () {
                  Navigator.pop(context, {
                    'favorite': false,
                    'today': false,
                  });
                },
              ),
              const SizedBox(height: 15),
              drawerMember(
                title: 'Search',
                icon: CustomIcon().searchIcon(),
                onTouch: () => Navigator.pushNamed(context, '/search'),
              ),
              const SizedBox(height: 15),
              drawerMember(
                title: 'Favorite',
                icon: const Icon(Icons.star_outlined, color: Colors.yellow),
                onTouch: () =>
                    Navigator.pop(context, {'favorite': true, 'today': false}),
              ),
              const SizedBox(height: 15),
              drawerMember(
                title: 'Today',
                icon: CustomIcon().todayIcon(),
                onTouch: () =>
                    Navigator.pop(context, {'favorite': false, 'today': true}),
              ),
              const SizedBox(height: 15),
              drawerMember(
                  title: 'Sort',
                  icon: CustomIcon().sortIcon(),
                  onTouch: () {
                    setState(() {
                      isASC = !isASC;
                      orderBy = isASC ? 'ASC' : 'DESC';
                    });
                    Navigator.pop(context);
                  }),
              const SizedBox(height: 15),
              drawerMember(
                  title: 'Settings',
                  icon: Icon(CupertinoIcons.settings, color: Colors.grey[800]),
                  onTouch: () async {
                    await Navigator.pushNamed(context, '/setting');
                    //.then((_) => setState(() {}));
                    setState(() {});
                  }),
              const SizedBox(height: 15),
            ],
          ),
        ),
      ),
    );
  }

  Widget drawerMember({
    required String title,
    required Widget icon,
    VoidCallback? onTouch,
  }) {
    return Material(
      elevation: 5,
      borderRadius: BorderRadius.circular(15),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          color: Colors.white,
          child: ListTile(
            leading: icon,
            title: Text(
              title,
              style: TextStyle(fontFamily: defaultAppFont),
            ),
            onTap: onTouch,
          ),
        ),
      ),
    );
  }
}
