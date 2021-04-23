import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../../provider/survey_provider.dart';

class SurveySuccessWidget extends StatelessWidget {
  const SurveySuccessWidget({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 680,
      padding: EdgeInsets.symmetric(horizontal: 32),
      child: Consumer<SurveyProvider>(builder: (ctx, surveyProvider, _) {
        final welcomeScreen = surveyProvider.survey?.welcomeScreen;
        return Stack(
          children: [
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.green,
                    maxRadius: 75,
                    child: Icon(
                      Icons.check,
                      size: 85,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(12),
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Text(
                      'Great job!',
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(
                    height: 300,
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Center(
                      child: Text(
                        'You have successfully completed the survey.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 24),
                      ),
                    ),
                  ),
                  SizedBox(height: 2),
                  Container(
                    width: 280,
                    child: ElevatedButton(
                        child: Text("Okay",
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.w800)),
                        style: ButtonStyle(
                            foregroundColor: MaterialStateProperty.all<Color>(
                                AppColors.dark),
                            backgroundColor: MaterialStateProperty.all<Color>(
                                AppColors.yellow),
                            padding:
                                MaterialStateProperty.all<EdgeInsetsGeometry>(
                                    EdgeInsets.symmetric(
                                        horizontal: 36, vertical: 28)),
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0),
                            ))),
                        onPressed: () => Navigator.of(context).pop()),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
