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
          border: Border.all(color: Theme.of(context).primaryColor, width: 3),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(
                    "$title",
                    textAlign: TextAlign.end,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text("Begins at: ${time.hour}:${time.minute}"),
                      Text("Duration: 4h"),
                    ],
                  ),
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
    if (description != null) {
      return Text('$description');
    } else {
      return Container();
    }
  }
}
