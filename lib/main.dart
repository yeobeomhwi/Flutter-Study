import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movie Info App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MovieSearchScreen(),
    );
  }
}

class MovieSearchScreen extends StatefulWidget {
  @override
  _MovieSearchScreenState createState() => _MovieSearchScreenState();
}

class _MovieSearchScreenState extends State<MovieSearchScreen> {
  String title = '';
  String year = '';
  String director = '';
  String plot = '';

  final TextEditingController movieController = TextEditingController();

  Future<void> fetchMovie(String title) async {
    // 영화 정보를 가져오는 코드를 작성하세요.
    final response = await http
        .get(Uri.parse('https://www.omdbapi.com/?t=$title&apikey=c90f393e'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      setState(() {
        this.title = data['Title'];
        year = data['Year'];
        director = data['Director'];
        plot = data['Plot'];
      });
    } else {
      throw Exception("Failed to fetch movie data");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Movie Info App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: movieController,
              decoration: InputDecoration(
                labelText: 'Enter Movie Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                fetchMovie(movieController.text);
              },
              child: Text('Search'),
            ),
            SizedBox(height: 32.0),
            if (title.isNotEmpty) ...[
              Text(
                'Title: $title',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8.0),
              Text(
                'Year: $year',
                style: TextStyle(fontSize: 18.0),
              ),
              Text(
                'Director: $director',
                style: TextStyle(fontSize: 18.0),
              ),
              SizedBox(height: 16.0),
              Text(
                'Plot: $plot',
                style: TextStyle(fontSize: 16.0),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
