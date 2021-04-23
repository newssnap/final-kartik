import 'package:flutter/material.dart';
import 'package:oodles/constants/app_colors.dart';
import 'package:oodles/model/survey.dart';

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
        Container(
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
            ],
          ),
        ),
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
