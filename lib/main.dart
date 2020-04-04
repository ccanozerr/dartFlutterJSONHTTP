import 'package:dartflutterjsonhttp/local_json.dart';
import 'package:flutter/material.dart';
import 'remote_api.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //home: LocalJSONUsage(),
      home: RemoteApiUsage(),
    );
  }
}

