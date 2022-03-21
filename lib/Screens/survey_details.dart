import 'package:flutter/material.dart';
import 'package:voluentie/Screens/survey_fill.dart';

class SurveyDetails extends StatefulWidget {
  final String surveyId;

  const SurveyDetails({Key? key, required this.surveyId}) : super(key: key);

  @override
  State<SurveyDetails> createState() => _SurveyDetailsState();
}

class _SurveyDetailsState extends State<SurveyDetails> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.surveyId),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SurveyFill(
                    surveyId: widget.surveyId,
                  )));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
