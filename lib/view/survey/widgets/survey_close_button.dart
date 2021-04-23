import 'package:flutter/material.dart';

class SurveyCloseButton extends StatelessWidget {
  const SurveyCloseButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: IconButton(
          padding: EdgeInsets.only(right: 40),
          icon: Icon(Icons.arrow_drop_down_circle_outlined,
              size: 42, color: Colors.black),
          onPressed: () => Navigator.of(context).pop()),
    );
  }
}
