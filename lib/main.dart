import 'package:flutter/material.dart';
import 'package:oodles/constants/app_colors.dart';
import 'package:provider/provider.dart';

import 'package:oodles/provider/survey_provider.dart';

import 'view/home/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<SurveyProvider>(
            create: (context) => SurveyProvider(),
          ),
        ],
        child: MaterialApp(
          title: 'NITL',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primaryColor: AppColors.blue),
          home: HomeScreen(),
        ));
  }
}
