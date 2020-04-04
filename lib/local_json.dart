import 'package:flutter/material.dart';
import 'dart:convert';
import 'models/Car.dart';

class LocalJSONUsage extends StatefulWidget {
  @override
  _LocalJSONUsageState createState() => _LocalJSONUsageState();
}

class _LocalJSONUsageState extends State<LocalJSONUsage> {
  List<Car> allCars;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    debugPrint("initState called");
    /*readDataFromJson().then((carList) {
      setState(() {
        allCars = carList;
      });
    });*/
  }

  // Or we can use a FutureBuilder. This widget wait a future object or method
  @override
  Widget build(BuildContext context) {
    debugPrint("build called");
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json Usage"),
      ),
      body: Container(
        child: FutureBuilder(
          future: readDataFromJson(),
          builder: (context, result) {
            if (result.hasData) {
              allCars = result.data;
              return ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(allCars[index].car_name),
                    subtitle: Text(allCars[index].country),
                  );
                },
                itemCount: allCars.length,
              );
            }else{
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }

  // We can use a control before the container load
  /*@override
  Widget build(BuildContext context) {
    debugPrint("build called");
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Json Usage"),
      ),
      body: allCars != null ? Container(
        child: ListView.builder(itemBuilder: (context,index){
          return ListTile(
            title: Text(allCars[index]["car_name"]),
            subtitle: Text(allCars[index]["country"]),
          );
        },itemCount: allCars.length,),
      ) : Center(child: CircularProgressIndicator(),),
    );
  }*/

  Future<List<Car>> readDataFromJson() async {
    // Way 1 to read local JSON data
    Future<String> readJSON =
        DefaultAssetBundle.of(context).loadString("assets/data/car.json");
    readJSON.then((readedJSON) {
      debugPrint("JSON data is: " + readedJSON);
      return readJSON;
    });

    // Way 2 to read local JSON data
    var importedJson =
        await DefaultAssetBundle.of(context).loadString("assets/data/car.json");
    debugPrint(importedJson);

    // Way 3 to read local JSON data like list
    List<Car> carList = (json.decode(importedJson) as List).map((mapStruct) => Car.fromJsonMap(mapStruct)).toList();
    debugPrint("Total car: " + carList.length.toString());

    for (int i = 0; i < carList.length; i++) {
      debugPrint("Car name: " + carList[i].car_name.toString());
    }

    return carList;
  }
}
