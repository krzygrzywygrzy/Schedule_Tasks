import 'package:flutter/material.dart';

class DayButton extends StatefulWidget {
  const DayButton({
    Key key,
    this.label,
    this.id,
    this.toogle,
  }) : super(key: key);

  final String label;
  final int id;
  final Function toogle;

  @override
  _DayButtonState createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  bool _selected = false;

  _toogle() {
    setState(() {
      _selected = !_selected;
    });
    widget.toogle(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2),
      child: GestureDetector(
        onTap: _toogle,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: _selected ? Colors.white54 : Theme.of(context).primaryColor,
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Text(
              "${widget.label}",
              textAlign: TextAlign.center,
              style: TextStyle(
                color:
                    _selected ? Theme.of(context).primaryColor : Colors.white54,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
