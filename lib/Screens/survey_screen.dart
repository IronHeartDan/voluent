import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voluentie/Screens/survey_fill.dart';

class SurveyHomeScreen extends StatefulWidget {
  const SurveyHomeScreen({Key? key}) : super(key: key);

  @override
  State<SurveyHomeScreen> createState() => _SurveyHomeScreenState();
}

class _SurveyHomeScreenState extends State<SurveyHomeScreen> {
  final Stream<QuerySnapshot> _surveysStream =
      FirebaseFirestore.instance.collection('surveys').snapshots();

  Stream<QuerySnapshot> _surveyResponseCountStream(String _id) {
    return FirebaseFirestore.instance
        .collection('surveys')
        .doc(_id)
        .collection("responses")
        .snapshots();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Survey",
          style: GoogleFonts.poppins(),
        ),
      ),
      body: StreamBuilder(
        stream: _surveysStream,
        builder: (BuildContext context,
            AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }

          if (snapshot.connectionState == ConnectionState.active) {
            if (snapshot.hasData) {
              // List<Map<String, dynamic>> data = snapshot.data?.docs as List<Map<String, dynamic>>;
              var data = snapshot.data;

              return ListView.builder(
                  itemCount: data?.size,
                  itemBuilder: (context, index) {
                    var active = data!.docs[index]['isActive'];
                    return InkWell(
                      onTap: () {
                        if (!active) {
                          return;
                        }
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => SurveyFill(
                                  surveyId: data.docs[index].id,
                                )));
                      },
                      child: ListTile(
                        leading: const Icon(Icons.stacked_bar_chart),
                        title: Text(data.docs[index]['Name'].toString()),
                        trailing: active
                            ? StreamBuilder(
                                stream: _surveyResponseCountStream(
                                    data.docs[index].id),
                                builder: (BuildContext context,
                                    AsyncSnapshot<QuerySnapshot<Object?>>
                                        snapshot) {
                                  if (snapshot.hasError) {
                                    return const Icon(Icons.error);
                                  }

                                  if (snapshot.connectionState ==
                                      ConnectionState.active) {
                                    if (snapshot.hasData) {
                                      var data = snapshot.data;
                                      return Text("${data?.docs.length}");
                                    }
                                  }

                                  return const SizedBox(
                                    width: 20,
                                    height: 20,
                                    child: CircularProgressIndicator(
                                      color: Colors.black,
                                      strokeWidth: 2,
                                    ),
                                  );
                                },
                              )
                            : null,
                      ),
                    );
                  });
            }
          }

          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }
}
