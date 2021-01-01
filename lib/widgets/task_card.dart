import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({
    Key key,
    @required this.title,
    @required this.time,
    this.description,
  }) : super(key: key);

  final String title;
  final String description;
  final TimeOfDay time;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              offset: Offset(1, 1),
              spreadRadius: 0.4,
              blurRadius: 6,
              color: Theme.of(context).primaryColor,
            ),
          ],
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
                  Text("Duration: 4h"),
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
