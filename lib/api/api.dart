import 'dart:convert';
import 'package:assignment/models/post.dart';
import 'package:assignment/notifiers/notifier.dart';
import 'package:http/http.dart' as http;


getDetails(DataNotifier dataNotifier) async {
  String apiUrl = "https://sigmatenant.ml/mobile/tags";
  http.Response response = await http.get(apiUrl);

  List<Post> postList = [];

  if (response.statusCode == 200){
    String body = response.body;
    var decodedData = jsonDecode(body);

    decodedData['tags'].forEach((data){
      Post post = Post(displayName: data['displayName'], desc: data['description'], meta: data['meta']);
      postList.add(post);
    });

    dataNotifier.postList = postList;
    dataNotifier.error = false;
  } else {
    print(response.statusCode);
    dataNotifier.error = true;
  }

  dataNotifier.loading = false;


}