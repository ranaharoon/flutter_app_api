import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() {
  runApp(
    MaterialApp(
      home: API(),
    ),
  );
}

class API extends StatefulWidget {
  @override
  _APIState createState() => _APIState();
}

class _APIState extends State<API> {
  var url = "https://jsonplaceholder.typicode.com/albums/1/photos";
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async{
    // use if http dependency version is > 0.12.0 in .yaml
    // get(Uri.parse(url));
    var res = await get(url);
    data = jsonDecode(res.body);
    setState(() {

    });
    //print(res.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API REQUEST"),
      ),
      body:  data != null ? Card(
        child: ListView.builder(
         itemCount: data.length,
          itemBuilder: (context, index){
            return ListTile(
              title: Text(data[index]["title"]),
              subtitle: Text("ID: ${data[index]["id"]}"),
              leading: Image.network(data[index]["thumbnailUrl"]),
            );
          },
        ),
      ) :
      Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
