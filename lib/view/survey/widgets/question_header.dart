import 'package:flutter/material.dart';

import '../../../model/survey.dart';

class QuestionHeader extends StatelessWidget {
  const QuestionHeader({
    Key key,
    @required this.field,
    this.info,
  }) : super(key: key);

  final Fields field;
  final String info;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            field.title,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
          ),
          Text(
            field.properties.description,
            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
          ),
          SizedBox(height: 15),
          if (info != null)
            Text(
              info,
              style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
            ),
        ],
      ),
    );
  }
}
