import 'package:flutter/material.dart';

import '../../../model/survey.dart';

class LongTextType extends StatefulWidget {
  const LongTextType({
    Key key,
    @required this.field,
  }) : super(key: key);

  final Fields field;

  @override
  _LongTextTypeState createState() => _LongTextTypeState();
}

class _LongTextTypeState extends State<LongTextType> {
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
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          margin: EdgeInsets.symmetric(horizontal: 25),
          height: 300,
          decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(Radius.circular(20))),
          child: TextField(
            minLines: 6,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            decoration:
                InputDecoration.collapsed(hintText: "Write something here..."),
          ),
        ),
      ],
    );
  }
}
