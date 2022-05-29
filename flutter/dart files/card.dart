import 'package:flutter/material.dart';
import 'book.dart';

void main() {
  runApp(const MaterialApp(
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Book> books = [
    Book(author: "J.K. Rowling", title: "Harry Potter"),
    Book(title: "Charlotte Web", author: "E. B. White"),
    Book(author: "Lucy Maud Montgomery", title: "Anne of Green Gables"),
  ];

  Widget bookInCard(book) {
    return Card(
      margin: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
                child: Text(
              book.title,
              style: const TextStyle(
                fontSize: 18.0,
              ),
            )),
            const SizedBox(height: 10.0),
            Center(child: Text(book.author)),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Hello world"),
        centerTitle: true,
      ),
      body: Column(
        children: books.map((book) => bookInCard(book)).toList(),
      ),
    );
  }
}

