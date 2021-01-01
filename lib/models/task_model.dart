import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

class Task extends Equatable {
  final TimeOfDay time; //describes time of day when the task is scheduled
  final TimeOfDay endTime; //describes time when task is finished
  final List<dynamic>
      weekDays; //describes days of the week in which task is scheduled
  final String title; //describes title of the task
  final String description;

  Task({
    @required this.time,
    @required this.weekDays,
    @required this.title,
    this.description,
    @required this.endTime,
  });

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      time: TimeOfDay(hour: json["hour"], minute: json["minute"]),
      endTime: TimeOfDay(hour: json["endHour"], minute: json["endMinute"]),
      weekDays: json["weekDays"],
      title: json["title"],
      description: json["description"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "hour": time.hour,
      "minute": time.minute,
      "endHour": endTime.hour,
      "endMinute": endTime.minute,
      "weekDays": weekDays,
      "title": title,
      "description": description != null ? description : "",
    };
  }

  @override
  List<Object> get props => [time, endTime, weekDays, title, description];
}
