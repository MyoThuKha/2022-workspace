import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    String bgImage = data['isDay'] ? 'light.jpg' : 'dark.jpg';
    Color? cardColor = data['isDay'] ? Colors.white70 : Colors.black54;
    Color? fontColor = data['isDay'] ? Colors.black : Colors.grey[200];
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/$bgImage'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 150.0, 30, 200.0),
          child: Card(
            elevation: 10.0,
            color: cardColor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');

                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDay': result['isDay'],
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: fontColor,
                  ),
                  label: Text(
                    "Edit Location",
                    style: TextStyle(color: fontColor),
                  ),
                  style: const ButtonStyle(),
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 40.0,
                        color: fontColor,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 60.0,
                    color: fontColor,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
