import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:note_app/services/note_template.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    refresh();
  }

  List<Note> notes = [];
  Future<void> refresh() async {
    notes = await NoteTemplate.instance.readAllNotes();

    Navigator.pushReplacementNamed(context, '/home', arguments: notes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitFadingCube(
          size: 50.0,
          color: Colors.blue[300],
        ),
      ),
    );
  }
}
