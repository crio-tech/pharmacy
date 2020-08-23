import 'package:flutter/material.dart';

class EntryPage extends StatefulWidget {
  EntryPage({Key key}) : super(key: key);

  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Entry'),
      ),
    );
  }
}
