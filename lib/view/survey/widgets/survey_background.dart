import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../provider/survey_provider.dart';

class SurveyBackground extends StatelessWidget {
  const SurveyBackground({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SurveyProvider>(builder: (ctx, surveyProvider, _) {
      final welcomeScreen = surveyProvider.survey?.welcomeScreen;
      return welcomeScreen?.attachment?.link != null
          ? Stack(
              children: [
                Image.network(
                  welcomeScreen?.attachment?.link,
                  fit: BoxFit.cover,
                  height: double.infinity,
                ),
                Container(
                  color: !surveyProvider.surveyStarted ||
                          surveyProvider.surveyCompleted
                      ? Colors.white54
                      : Colors.white,
                  height: double.infinity,
                  width: double.infinity,
                )
              ],
            )
          : Container();
    });
  }
}
