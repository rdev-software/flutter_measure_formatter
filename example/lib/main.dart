import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter_measure_formatter/flutter_measure_formatter.dart';
import 'package:flutter_measure_formatter/method_channel_flutter_measure_formatter.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  FlutterMeasureFormatterUnit _selectedUnit = FlutterMeasureFormatterUnit.METER;
  String _conversionResult = "<unknown>";
  String _formattingResult = "5m";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Widget getListTile(FlutterMeasureFormatterUnit unit) {
    return ListTile(
      title: Text(unit.toString()),
      trailing: unit == _selectedUnit ? Icon(Icons.check) : null,
      onTap: () async {
        _selectedUnit = unit;
        loadData();
      },
    );
  }

  Future<void> loadData() async {
    try {
      _formattingResult =
      await FlutterMeasureFormatter.formatLength(_selectedUnit, 5);
      _conversionResult =
      await FlutterMeasureFormatter.convertLength(_selectedUnit, 5);
    } on PlatformException {
      _conversionResult = "<unknown>";
      _formattingResult = "5m";
      _selectedUnit = FlutterMeasureFormatterUnit.METER;
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
          bottom: PreferredSize(
              child: Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        _formattingResult,
                        style: TextStyle(color: Colors.white),
                      ),
                      Icon(Icons.keyboard_arrow_right, color: Colors.white),
                      Text(
                        _conversionResult,
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )),
              preferredSize: Size(0, 20.0)),
        ),
        body: ListView(children: [
          getListTile(FlutterMeasureFormatterUnit.ASTRONOMICAL_UNIT),
          getListTile(FlutterMeasureFormatterUnit.CENTIMETER),
          getListTile(FlutterMeasureFormatterUnit.DECIMETER),
          getListTile(FlutterMeasureFormatterUnit.FATHOM),
          getListTile(FlutterMeasureFormatterUnit.FOOT),
          getListTile(FlutterMeasureFormatterUnit.FURLONG),
          getListTile(FlutterMeasureFormatterUnit.INCH),
          getListTile(FlutterMeasureFormatterUnit.KILOMETER),
          getListTile(FlutterMeasureFormatterUnit.LIGHT_YEAR),
          getListTile(FlutterMeasureFormatterUnit.METER),
          getListTile(FlutterMeasureFormatterUnit.MICROMETER),
          getListTile(FlutterMeasureFormatterUnit.MILE),
          getListTile(FlutterMeasureFormatterUnit.MILE_SCANDINAVIAN),
          getListTile(FlutterMeasureFormatterUnit.MILLIMETER),
          getListTile(FlutterMeasureFormatterUnit.NANOMETER),
          getListTile(FlutterMeasureFormatterUnit.NAUTICAL_MILE),
          getListTile(FlutterMeasureFormatterUnit.PARSEC),
          getListTile(FlutterMeasureFormatterUnit.PICOMETER),
          getListTile(FlutterMeasureFormatterUnit.YARD),
        ]),
      ),
    );
  }
}
