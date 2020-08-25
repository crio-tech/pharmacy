import 'package:flutter/material.dart';
import 'package:pharmacy/bloc/expiry_item/expiryitem_bloc.dart';
import 'package:pharmacy/screens/screens.dart';

class ExpiryPageProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ExpiryitemBloc(),
      child: ExpiryPage(),
    );
  }
}

class ExpiryPage extends StatefulWidget {
  @override
  _ExpiryPageState createState() => _ExpiryPageState();
}

class _ExpiryPageState extends State<ExpiryPage> {
  TextEditingController _fromDateController;
  TextEditingController _toDateController;

  ExpiryitemBloc _expiryitemBloc;
  @override
  void initState() {
    _expiryitemBloc = BlocProvider.of<ExpiryitemBloc>(context)
      ..add(FetchExpiryitemEvent());
    super.initState();
    _fromDateController =
        TextEditingController(text: DateTime.now().toString());
    _toDateController = TextEditingController(
        text: DateTime.now().add(Duration(days: 30)).toString());
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('Check Expiry'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              height: size.height * 0.2,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        width: 150.0,
                        child: DateTimePicker(
                          type: DateTimePickerType.date,
                          dateMask: 'yyyy/MM/dd',
                          controller: _fromDateController,
                          //initialValue: _initialValue,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          icon: Icon(Icons.event),
                          dateLabelText: 'From',
                        ),
                      ),
                      Text('-',
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          )),
                      Container(
                        margin: const EdgeInsets.all(8.0),
                        width: 150.0,
                        child: DateTimePicker(
                          type: DateTimePickerType.date,
                          dateMask: 'yyyy/MM/dd',
                          controller: _toDateController,
                          //initialValue: _initialValue,
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2100),
                          icon: Icon(Icons.event),
                          dateLabelText: 'To',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(8.0),
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0)),
                      splashColor: Colors.yellow,
                      color: Colors.green,
                      onPressed: () {
                        print(_fromDateController.text);
                        print(_toDateController.text);
                      },
                      child: Text(
                        'Get',
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
            // TODO: show expiry product
            Expanded(
              child: BlocBuilder<ExpiryitemBloc, ExpiryitemState>(
                builder: (context, state) {
                  if (state is FetchExpiryitemState)
                    return Container(
                      child: HorizontalDataTable(
                        leftHandSideColumnWidth: 100,
                        rightHandSideColumnWidth: 600,
                        isFixedHeader: true,
                        headerWidgets: _getTitleWidget(),
                        leftSideItemBuilder: _generateFirstColumnRow,
                        rightSideItemBuilder: _generateRightHandSideColumnRow,
                        itemCount: state.expiryItems.length,
                        rowSeparatorWidget: const Divider(
                          color: Colors.black54,
                          height: 1.0,
                          thickness: 0.0,
                        ),
                        leftHandSideColBackgroundColor: Color(0xFF2A2A2A),
                        rightHandSideColBackgroundColor: Color(0xFFFFFFFF),
                      ),
                      height: MediaQuery.of(context).size.height,
                    );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<Widget> _getTitleWidget() {
    return [
      _getTitleItemWidget('Name', 200),
      _getTitleItemWidget('Rack No', 100),
      _getTitleItemWidget('Box No', 100),
      _getTitleItemWidget('Exp date', 200),
      _getTitleItemWidget('Pharma', 200),
    ];
  }

  Widget _getTitleItemWidget(String label, double width) {
    return Container(
      child: Text(label, style: TextStyle(fontWeight: FontWeight.bold)),
      width: width,
      height: 56,
      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
      alignment: Alignment.centerLeft,
    );
  }

  Widget _generateFirstColumnRow(BuildContext context, int index) {
    return BlocBuilder<ExpiryitemBloc, ExpiryitemState>(
      builder: (context, state) {
        if (state is FetchExpiryitemState)
          return Container(
            child: Text(state.expiryItems[index].name),
            width: 100,
            height: 52,
            padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
            alignment: Alignment.centerLeft,
          );
      },
    );
  }

  Widget _generateRightHandSideColumnRow(BuildContext context, int index) {
    return BlocBuilder<ExpiryitemBloc, ExpiryitemState>(
      builder: (context, state) {
        if (state is FetchExpiryitemState)
          return Row(
            children: <Widget>[
              Container(
                child: Text(state.expiryItems[index].rackNo.toString()),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(state.expiryItems[index].boxNo.toString()),
                width: 200,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(state.expiryItems[index].expDate),
                width: 100,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
              Container(
                child: Text(state.expiryItems[index].pharma),
                width: 200,
                height: 52,
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                alignment: Alignment.centerLeft,
              ),
            ],
          );
      },
    );
  }
}
