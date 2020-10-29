import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _search;
  int _offset;

  Future<Map> _getGifs() async {
    http.Response response;
    if (_search = null) {
      response = await http.get(
          'https://api.giphy.com/v1/gifs/trending?api_key=D0fxKV5LFFXFaV3wpa9BTyRfok0aTJqn&limit=25&rating=g');
    } else {
      response = await http.get(
          'https://api.giphy.com/v1/gifs/search?api_key=D0fxKV5LFFXFaV3wpa9BTyRfok0aTJqn&q=$_search&limit=25&offset=$_offset&rating=g&lang=en');
    }

    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.network(
            'https://developers.giphy.com/static/img/dev-logo-lg.7404c00322a8.gif'),
        centerTitle: true,
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              decoration: InputDecoration(
                  labelText: 'Search Here!',
                  labelStyle: TextStyle(color:
                  ),
                  border: OutlineInputBorder()),
              style: TextStyle(color: Colors.white, fontSize: 18.0),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}

