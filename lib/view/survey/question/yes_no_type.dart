import 'package:flutter/material.dart';
import 'package:oodles/constants/app_colors.dart';
import 'package:oodles/model/survey.dart';

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
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.field.title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: 5),
              Text(
                widget.field.properties.description,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
              SizedBox(height: 15),
            ],
          ),
        ),
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
