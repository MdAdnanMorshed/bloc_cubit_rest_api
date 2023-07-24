import 'dart:convert';

import 'package:http/http.dart' as https;

import '../models/get_post_model.dart';

class Repo {
  Future<List<GetPostModel>> fetchData() async {
    final response = await https
        .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;

      return json.map((e) {
        return GetPostModel(
            id: e['id'],
            userId: e['userId'],
            title: e['title'],
            body: e['title']);
      }).toList();
    } else {
      throw 'something is wrong ${response.statusCode}';
    }
  }
}
