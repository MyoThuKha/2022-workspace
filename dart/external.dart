//I will not add external dart file. This is main.dart code.
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: const Text("Hello world"),
        centerTitle: true,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: books.map((book) => Text('${book.author} ')).toList(),
      ),
    );
  }
}

