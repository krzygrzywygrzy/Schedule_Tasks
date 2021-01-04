import 'package:flutter/material.dart';
import 'package:schedule_tasks/const.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key key,
    @required this.title,
    @required this.time,
    @required this.endTime,
    this.description,
  }) : super(key: key);

  final String title;
  final String description;
  final TimeOfDay time;
  final TimeOfDay endTime;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [kShadow],
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$title",
                textAlign: TextAlign.end,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Begins at: ${time.hour}:${time.minute}"),
                  Text("Ends at: ${endTime.hour}:${endTime.minute}"),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: displayDescription(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget displayDescription() {
    if (description != null || description == "") {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("description:"),
          Text('$description'),
        ],
      );
    } else {
      return Container();
    }
  }
}
