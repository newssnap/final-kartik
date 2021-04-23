import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_colors.dart';
import '../../../provider/survey_provider.dart';

class SurveyWelcomeWidget extends StatelessWidget {
  const SurveyWelcomeWidget({
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
                  if (welcomeScreen?.title != null)
                    Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Text(
                        welcomeScreen?.title,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 30),
                      ),
                    ),
                  SizedBox(height: 2),
                  if (welcomeScreen?.properties?.description != null)
                    Container(
                      height: 300,
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                          color: Colors.white60,
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Center(
                        child: Text(
                          welcomeScreen?.properties?.description,
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
                        child: Text(
                            welcomeScreen?.properties?.buttonText != null
                                ? welcomeScreen?.properties?.buttonText
                                : "Begin",
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
                        onPressed: () {
                          Provider.of<SurveyProvider>(context, listen: false)
                              .startSurvey();
                        }),
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
