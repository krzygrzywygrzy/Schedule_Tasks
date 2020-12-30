import 'package:schedule_tasks/models/task_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String LOCAL_DATA_SOURCE = "LOCAL_DATA_SOURCE";

class LocalDataSource {
  SharedPreferences _sharedPreferences;

  void cacheData(){
    //_sharedPreferences.setString(LOCAL_DATA_SOURCE, );
  }

  List<Task> getTasks(){
    final jsonString = _sharedPreferences.getString(LOCAL_DATA_SOURCE);
    if(jsonString != null){
      //LIST OF TASKS
    }else {
      throw CacheException();
    }
  }

}

class CacheException implements Exception {}

