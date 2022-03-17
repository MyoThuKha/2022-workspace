import 'package:flutter/material.dart';
import 'book.dart';

class BookCard extends StatelessWidget {
  final Book argBook;
  final VoidCallback delete;

  const BookCard({required this.argBook, required this.delete});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.fromLTRB(15.0, 30.0, 15.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Center(
              child: Text(
                argBook.title,
                style: const TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Center(
              child: Text(argBook.author),
            ),
            const SizedBox(height: 5.0),
            TextButton.icon(
              onPressed: delete,
              icon: const Icon(Icons.delete),
              label: const Text("Remove"),
            )
          ],
        ),
      ),
    );
  }
}

