import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_colors.dart';
import '../../provider/survey_provider.dart';
import '../survey/survey_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _isLoading = false;

  Future<void> _fetchSurveyData() async {
    setState(() => _isLoading = true);
    try {
      await Provider.of<SurveyProvider>(context, listen: false).fetchSurvey();
      Navigator.push(
          context, MaterialPageRoute(builder: (_) => SurveyScreen()));
    } catch (e) {}
    setState(() => _isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _isLoading
            ? CircularProgressIndicator()
            : ElevatedButton(
                child: Text("Start survey",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(AppColors.dark),
                    backgroundColor:
                        MaterialStateProperty.all<Color>(AppColors.yellow),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        EdgeInsets.symmetric(horizontal: 36, vertical: 28)),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                    ))),
                onPressed: () => _fetchSurveyData()),
      ),
    );
  }
}
