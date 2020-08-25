import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pharmacy/screens/screens.dart';

class EntryPage extends StatefulWidget {
  EntryPage({Key key}) : super(key: key);

  @override
  _EntryPageState createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  String dropdownValue = 'Nagammai';
  List<String> pharmaList = ['Nagammai', 'Paleppu', 'VMS', 'Kalyani'];

  TextEditingController _dateController;
  TextEditingController _nameController = TextEditingController();
  TextEditingController _batchNoController = TextEditingController();
  TextEditingController _mrpController = TextEditingController();
  TextEditingController _qtyController = TextEditingController();
  TextEditingController _rackNoController = TextEditingController();
  TextEditingController _boxNoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _dateController = TextEditingController(text: DateTime.now().toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Entry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  hintText: "Enter product name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _batchNoController,
                decoration: InputDecoration(
                  hintText: "Enter batch number",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  DropdownButton<String>(
                    hint: Text('Select a Pharma'),
                    value: dropdownValue,
                    icon: Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        dropdownValue = newValue;
                      });
                    },
                    items: pharmaList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                  Spacer(),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    width: 150.0,
                    child: DateTimePicker(
                      type: DateTimePickerType.date,
                      dateMask: 'yyyy/MM/dd',
                      controller: _dateController,
                      //initialValue: _initialValue,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2100),
                      icon: Icon(Icons.event),
                      dateLabelText: 'Expiry Date',
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 150.0,
                    child: TextField(
                      controller: _mrpController,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: "Enter MRP",
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 150.0,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _qtyController,
                      decoration: InputDecoration(
                        hintText: "Enter Qty",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Container(
                    width: 150.0,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _rackNoController,
                      decoration: InputDecoration(
                        hintText: "Rack number",
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    width: 150.0,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      controller: _boxNoController,
                      decoration: InputDecoration(
                        hintText: "Box number",
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: 50.0,
              width: MediaQuery.of(context).size.width,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                splashColor: Colors.yellow,
                color: Colors.green,
                onPressed: () {
                  print(_dateController.text);
                },
                child: Text(
                  'Add',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
