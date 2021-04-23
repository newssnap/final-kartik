import 'package:flutter/material.dart';
import 'package:oodles/constants/app_colors.dart';
import 'package:oodles/model/survey.dart';

class RankingType extends StatefulWidget {
  const RankingType({
    Key key,
    @required this.field,
  }) : super(key: key);

  final Fields field;

  @override
  _RankingTypeState createState() => _RankingTypeState();
}

class _RankingTypeState extends State<RankingType> {
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
              Text(
                widget.field.properties.description,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
              SizedBox(height: 15),
              Text(
                'Drag and drop to rank options',
                style: TextStyle(fontWeight: FontWeight.normal, fontSize: 16),
              ),
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
          height: 500,
          child: ReorderableListView(
            padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
            children: <Widget>[
              for (int index = 0;
                  index < widget.field.properties.choices.length;
                  index++)
                Card(
                  key: Key('$index'),
                  child: ListTile(
                    key: Key('$index'),
                    title: Text(
                      widget.field.properties.choices[index].label,
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 20,
                          color: AppColors.dark),
                    ),
                    trailing: Icon(
                      Icons.reorder_rounded,
                      color: AppColors.blue,
                    ),
                  ),
                )
            ],
            onReorder: (int oldIndex, int newIndex) {
              setState(() {
                if (oldIndex < newIndex) newIndex -= 1;
                final item = widget.field.properties.choices.removeAt(oldIndex);
                widget.field.properties.choices.insert(newIndex, item);
              });
            },
          ),
        ),
      ],
    );
  }
}
