import 'package:flutter/material.dart';

class TimePicker extends StatelessWidget {
  const TimePicker({
    Key key,
    @required this.time,
    this.save,
    this.label,
  }) : super(key: key);

  final TimeOfDay time;
  final Function save;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "$label",
          style: TextStyle(color: Colors.white54),
        ),
        Container(
          child: GestureDetector(
            onTap: () async {
              TimeOfDay newTime =
                  await showTimePicker(context: context, initialTime: time);
              save(newTime);
            },
            child: Text(
              "${_formatTime(time.hour)}:${_formatTime(time.minute)}",
              style: TextStyle(color: Colors.white54, fontSize: 100),
            ),
          ),
        ),
      ],
    );
  }

  String _formatTime(int value) {
    if (value < 10)
      return "0$value";
    else
      return "$value";
  }
}
