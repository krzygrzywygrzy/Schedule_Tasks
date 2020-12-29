import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Task extends Equatable {
  final TimeOfDay time; //describes time of day when the task is scheduled
  final List<String> weekDays; //describes days of the week in which task is scheduled
  final String title; //describes title of the task
  final String description;

  Task({this.time, this.weekDays, this.title, this.description});

  factory Task.fromJson(Map<String, dynamic> json){
    List<String> days = [];
    for(int i = 0; i<= json["weekDays"].length -1; i++){
      //TODO: implement
    }
    return Task(
      time: json["time"],
      weekDays: days,
      title: json["title"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson (){
    return {};
  }

  @override
  List<Object> get props => [time, weekDays, title, description];
}