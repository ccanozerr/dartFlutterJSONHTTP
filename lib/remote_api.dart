import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'models/Post.dart';
import 'dart:convert';
import 'dart:async';

class RemoteApiUsage extends StatefulWidget {
  @override
  _RemoteApiUsageState createState() => _RemoteApiUsageState();
}

class _RemoteApiUsageState extends State<RemoteApiUsage> {
  Post post;

  Future<List<Post>> _getPost() async {
    var response =
    await http.get("https://jsonplaceholder.typicode.com/posts");
    if (response.statusCode == 200) {
      //return Post.fromJsonMap(json.decode(response.body)); This is single response example
      return (json.decode(response.body) as List).map((singlePostMap) =>
          Post.fromJsonMap(singlePostMap)).toList();
    } else {
      throw Exception(
          "An error occurred while trying to get response. Status code is: ${response
              .statusCode}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    /*_getPost().then((response) {
      post = response;
      debugPrint("response: " + response.body);
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Remote API Usage"),
      ),
      body: FutureBuilder(
        future: _getPost(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) {
              return ListTile(
                  title: Text(snapshot.data[index].title),
                  subtitle: Text(snapshot.data[index].body),
                  leading: CircleAvatar(child: Text(snapshot.data[index].id.
                  toString(),),
              ),
              );
            });
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
