import 'package:flutter/material.dart';

void main() {
  runApp(
    const MaterialApp(
      home: FirstPage(),
    ),
  );
}

class FirstPage extends StatefulWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  int levelValue = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Account Info"),
        centerTitle: true,
        backgroundColor: Colors.blue[200],
        elevation: 0.0,
      ),

      //
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30.0, 20.0, 30.0, 0.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Center(
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/thumb.jpg'),
                radius: 100.0,
              ),
            ),
            const Divider(
              height: 60.0,
              color: Colors.grey,
            ),
            const Text(
              "NAME",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 10.0),
            const Text(
              "Sam",
              style: TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 5.0),
            const Text(
              "Current Level",
              style: TextStyle(
                color: Colors.grey,
                letterSpacing: 1.0,
              ),
            ),
            const SizedBox(height: 10.0),
            Text(
              '$levelValue',
              style: const TextStyle(
                fontSize: 25.0,
                color: Colors.black,
                letterSpacing: 2.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10.0),

            //
            Row(
              children: const <Widget>[
                Icon(
                  Icons.mail_rounded,
                ),
                SizedBox(width: 10.0),
                Text(
                  "sam247@gmail.com",
                  style: TextStyle(
                    letterSpacing: 1.0,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: Container(
          height: 50.0,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            levelValue++;
          });
        },
        backgroundColor: Colors.blue[200],
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}

