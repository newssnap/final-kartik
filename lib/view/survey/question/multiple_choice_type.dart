import 'package:flutter/material.dart';

import '../../../constants/app_colors.dart';
import '../../../model/survey.dart';
import '../widgets/question_header.dart';

class MultipleChoiceType extends StatelessWidget {
  const MultipleChoiceType({
    Key key,
    @required this.field,
  }) : super(key: key);

  final Fields field;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 15),
        QuestionHeader(field: field),
        SizedBox(height: 15),
        Container(
          height: 500,
          child: ListView.builder(
            itemCount: field.properties.choices.length,
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            itemBuilder: (BuildContext context, int index) {
              final choice = field.properties.choices[index];
              return Card(
                child: ListTile(
                  leading: Checkbox(value: false, onChanged: (value) {}),
                  title: Text(
                    choice.label,
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: AppColors.dark),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
