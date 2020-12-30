import 'package:schedule_tasks/models/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

const String LOCAL_DATA_SOURCE = "LOCAL_DATA_SOURCE";

class LocalDataSource {
  SharedPreferences _sharedPreferences;

  void cacheData(List<Task> tasks) async {
    _sharedPreferences = await SharedPreferences.getInstance();
    List<Map> list = [];
    for (int i = 0; i <= tasks.length - 1; i++) {
      list.add(tasks[i].toJson());
    }
    _sharedPreferences.setString(LOCAL_DATA_SOURCE, json.encode(list));
  }

  Future<List<Task>> getTasks() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    final jsonString = _sharedPreferences.getString(LOCAL_DATA_SOURCE);
    if (jsonString != null) {
      var data = json.decode(jsonString);
      if (data.length != 0) {
        List<Task> list = [];
        for (int i = 0; i <= data.length - 1; i++) {
          list.add(Task.fromJson(data[i]));
          print(list[i].weekDays);
        }

      } else
        return [];
    } else {
      throw CacheException();
    }
  }
}

class CacheException implements Exception {}
