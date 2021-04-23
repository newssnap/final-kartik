import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../model/survey.dart';
import '../widgets/question_header.dart';

class YesNoType extends StatefulWidget {
  const YesNoType({
    Key key,
    @required this.field,
  }) : super(key: key);

  final Fields field;

  @override
  _YesNoTypeState createState() => _YesNoTypeState();
}

class _YesNoTypeState extends State<YesNoType> {
  int value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        QuestionHeader(field: widget.field),
        SizedBox(height: 15),
        Container(
          height: 500,
          child: ListView.builder(
            itemCount: 2,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            itemBuilder: (BuildContext context, int index) {
              return RadioListTile(
                value: index,
                groupValue: value,
                onChanged: (ind) => setState(() => value = ind),
                title: Text(
                  index == 0 ? 'Yes' : 'NO',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: AppColors.dark),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
