import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class InfinityScroll extends StatefulWidget {
  @override
  _InfinityScrollState createState() => _InfinityScrollState();
}

class _InfinityScrollState extends State<InfinityScroll> {
  List<String> dogImages = [];
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    super.initState();
    fetchFive();

    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        fetchFive();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Uri url = new Uri.https('dog.ceo', '/api/breeds/image/random');

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dogImages.length,
      controller: _scrollController,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          constraints: BoxConstraints.tightFor(height: 250.0),
          child: Image.network(dogImages[index], fit: BoxFit.fitWidth),
        );
      },
    );
  }

  fetch() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      setState(() {
        dogImages.add(json.decode(response.body)['message']);
      });
    } else {
      throw Exception('Failed to load images');
    }
  }

  fetchFive() {
    for (int i = 0; i < 5; i++) {
      fetch();
    }
  }
}
