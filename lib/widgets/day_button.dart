import 'package:flutter/material.dart';

class DayButton extends StatelessWidget {
  const DayButton({
    Key key,
    this.label,
    this.selected,
    this.toogle,
  }) : super(key: key);

  final String label;
  final bool selected;
  final Function toogle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: toogle(),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: selected ? Colors.white54 : Theme.of(context).primaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              "$label",
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                    selected ? Theme.of(context).primaryColor : Colors.white54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
