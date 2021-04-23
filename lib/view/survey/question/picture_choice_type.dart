import 'package:flutter/material.dart';
import 'package:oodles/model/survey.dart';

class PictureChoiceType extends StatelessWidget {
  const PictureChoiceType({
    Key key,
    @required this.field,
  }) : super(key: key);

  final Fields field;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 500,
          child: GridView.builder(
            itemCount: field.properties.choices.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index) {
              final choice = field.properties.choices[index];
              return Container(
                height: 500,
                child: Stack(
                  children: [
                    Image.network(
                      choice.attachment?.link ?? choice.attachment?.href,
                      fit: BoxFit.cover,
                      height: 500,
                      width: double.infinity,
                    ),
                    Center(
                      child: Container(
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(
                            color: Colors.black45,
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Text(
                          choice.label,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Tap to choose.',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              SizedBox(height: 15),
              Text(
                field.title,
                style: TextStyle(fontWeight: FontWeight.w300, fontSize: 20),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
