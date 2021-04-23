import 'package:flutter/material.dart';

import '../../../model/survey.dart';
import '../widgets/question_header.dart';

class OpinionScaleType extends StatefulWidget {
  const OpinionScaleType({
    Key key,
    @required this.field,
  }) : super(key: key);

  final Fields field;

  @override
  _OpinionScaleTypeState createState() => _OpinionScaleTypeState();
}

class _OpinionScaleTypeState extends State<OpinionScaleType> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        QuestionHeader(field: widget.field),
        SizedBox(height: 15),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Slider(
            value: _currentSliderValue,
            min: widget.field.properties?.startAtOne ?? false ? 1 : 0,
            max: widget.field.properties?.steps?.toDouble() ?? 100,
            divisions: 5,
            label: _currentSliderValue.round().toString(),
            onChanged: (double value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
