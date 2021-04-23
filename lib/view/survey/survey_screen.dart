import 'package:flutter/material.dart';
import 'package:oodles/view/survey/question/opinion_scale_type.dart';
import 'package:provider/provider.dart';

import '../../model/survey.dart';
import '../../provider/survey_provider.dart';
import 'question/long_text_type.dart';
import 'question/multiple_choice_type.dart';
import 'question/picture_choice_type.dart';
import 'question/ranking_type.dart';
import 'question/yes_no_type.dart';
import 'widgets/survey_background.dart';
import 'widgets/survey_bottom_bar.dart';
import 'widgets/survey_close_button.dart';
import 'widgets/survey_success_widget.dart';
import 'widgets/survey_welcome_widget.dart';

class SurveyScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SurveyScreenState();
}

class _SurveyScreenState extends State<SurveyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        SurveyBackground(),
        SingleChildScrollView(
          child: Column(children: [
            SizedBox(height: 42),
            SurveyCloseButton(),
            _getCurrentSurveyScreenWidget()
          ]),
        ),
        SurveyBottomBar()
      ],
    ));
  }

  Widget _getCurrentSurveyScreenWidget() {
    return Consumer<SurveyProvider>(builder: (ctx, surveyProvider, _) {
      final fields = surveyProvider.survey?.fields;
      return !surveyProvider.surveyStarted
          ? SurveyWelcomeWidget()
          : surveyProvider.surveyCompleted
              ? SurveySuccessWidget()
              : _getSurveyQuestionWidget(
                  fields[surveyProvider.currentQuestion]);
    });
  }

  Widget _getSurveyQuestionWidget(Fields field) {
    Widget surveyQuestionWidget;
    switch (field.type) {
      case 'picture_choice':
        surveyQuestionWidget = PictureChoiceType(field: field);
        break;
      case 'multiple_choice':
        surveyQuestionWidget = MultipleChoiceType(field: field);
        break;
      case 'ranking':
        surveyQuestionWidget = RankingType(field: field);
        break;
      case 'yes_no':
        surveyQuestionWidget = YesNoType(field: field);
        break;
      case 'long_text':
      case 'email':
        surveyQuestionWidget = LongTextType(field: field);
        break;
      case 'opinion_scale':
        surveyQuestionWidget = OpinionScaleType(field: field);
        break;
      default:
        surveyQuestionWidget = Container(
          child: Text('NOT IMPLEMENTED YET'),
        );
    }
    return surveyQuestionWidget;
  }
}
