import 'package:flutter/material.dart';

class BillCheckPage extends StatefulWidget {
  @override
  _BillCheckPageState createState() => _BillCheckPageState();
}

class _BillCheckPageState extends State<BillCheckPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bills'),
      ),
    );
  }
}
