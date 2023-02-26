import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class News extends StatefulWidget {
  const News({Key? key}) : super(key: key);

  @override
  State<News> createState() => _NewsState();
}

class _NewsState extends State<News> {

  List articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchNews();
  }

  Future<void> fetchNews() async {
    setState(() {
      isLoading = true;
    });

    final response = await http.get(Uri.parse(
        'https://newsapi.org/v2/top-headlines?country=id&apiKey=a8a43d328b3842468cf86f0ebb58596d'));

    setState(() {
      isLoading = false;
      articles = json.decode(response.body)['articles'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: articles.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: InkWell(
              onTap: () {},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.0),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            articles[index]['urlToImage'] != null && articles[index]['urlToImage'] != ''
                                ? articles[index]['urlToImage']
                                : 'https://via.placeholder.com/150'),
                      ),
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    articles[index]['title'] ?? '',
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    articles[index]['description'] ?? '',
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    articles[index]['publishedAt'] ?? '',
                    style: const TextStyle(
                      fontSize: 14.0,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
