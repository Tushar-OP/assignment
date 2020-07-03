

import 'package:assignment/models/post.dart';
import 'package:flutter/foundation.dart';

class DataNotifier extends ChangeNotifier{
  List<Post> _postList = [];

  //For any errors
  bool _error = true;
  bool get error => _error;

  bool _loading = true;
  bool get loading => _loading;

  //List of result
  List<Post> get postList => _postList;

  set postList(List<Post> postList) {
    _postList = postList;
    notifyListeners();
  }

  set error(bool error) {
    _error = error;
    notifyListeners();
  }

  set loading(bool loading) {
    _loading = loading;
    notifyListeners();
  }
}