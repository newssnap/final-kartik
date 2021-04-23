import 'package:flutter/material.dart';
import 'package:oodles/constants/app_colors.dart';
import 'package:oodles/provider/survey_provider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class SurveyBottomBar extends StatelessWidget {
  const SurveyBottomBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<SurveyProvider>(builder: (ctx, surveyProvider, _) {
      final percentage = ((surveyProvider.currentQuestion + 1) /
              surveyProvider.survey?.fields?.length) *
          100;
      return !surveyProvider.surveyStarted || surveyProvider.surveyCompleted
          ? Container(height: 1)
          : Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 6, bottom: 3),
                            child: Text(
                              '${percentage.toInt()}% completed',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.grey),
                            ),
                          ),
                          LinearPercentIndicator(
                            lineHeight: surveyProvider.survey?.fields?.length
                                    ?.toDouble() ??
                                8.0,
                            percent: percentage / 100 ?? 0.2,
                            progressColor: Colors.grey,
                            backgroundColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () =>
                          Provider.of<SurveyProvider>(context, listen: false)
                              .previousQuestion(),
                      child: Container(
                        color: AppColors.yellow,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.keyboard_arrow_up_rounded,
                              size: 30, color: AppColors.dark),
                        ),
                      ),
                    ),
                    SizedBox(width: 2),
                    InkWell(
                      onTap: () =>
                          Provider.of<SurveyProvider>(context, listen: false)
                              .nextQuestion(),
                      child: Container(
                        color: AppColors.yellow,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.keyboard_arrow_down_rounded,
                              size: 30, color: AppColors.dark),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
    });
  }
}
