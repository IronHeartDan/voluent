import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:voluentie/Models/survey_data.dart';

import '../Widgets/top_clip.dart';

class SurveyFill extends StatefulWidget {
  final String surveyId;

  const SurveyFill({Key? key, required this.surveyId}) : super(key: key);

  @override
  State<SurveyFill> createState() => _SurveyFillState();
}

class _SurveyFillState extends State<SurveyFill> {
  final _formKey = GlobalKey<FormState>();
  double rating = 0.0;
  final SurveyData _surveyData = SurveyData();
  final TextEditingController _timeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              child: ClipPath(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  color: HexColor("83E753"),
                  // decoration: BoxDecoration(
                  //     gradient: LinearGradient(
                  //         begin: Alignment.centerLeft,
                  //         colors: [HexColor("A1C4FD"), HexColor("C2E9FB")])),
                ),
                clipper: CustomClipPathTop(),
              ),
            ),
            Positioned(
              top: 40,
              child: Text(
                "Survey",
                style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 32,
                    fontWeight: FontWeight.w600),
              ),
            ),
            Positioned(
              top: 100,
              left: 10,
              child: InkWell(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                    width: 50,
                    height: 50,
                    decoration: const BoxDecoration(shape: BoxShape.circle),
                    child: Image.asset("assets/backArrow.png")),
              ),
            ),
            Positioned(
                top: 100,
                right: 10,
                child: FloatingActionButton(
                  backgroundColor: HexColor("83E753"),
                  onPressed: () {},
                  child: const Icon(Icons.add),
                )),
            Positioned.fill(
                top: 160,
                child: SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 20.0, bottom: 20.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Container(
                              width: 150,
                              height: 150,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: ClipOval(
                                child: Image.asset(
                                  "assets/userMale.png",
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "House holder’s Name",
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: Theme.of(context)
                                  .colorScheme
                                  .copyWith(primary: Colors.black),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                counter: const Offstage(),
                                hintText: "Daniel Richard",
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              onSaved: (value) {
                                setState(() {
                                  _surveyData.houseHolderName = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Name';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "House holder’s Address",
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: Theme.of(context)
                                  .colorScheme
                                  .copyWith(primary: Colors.black),
                            ),
                            child: TextFormField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                counter: const Offstage(),
                                hintText: "ABC , City , State , Country , Pin",
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                              onSaved: (value) {
                                setState(() {
                                  _surveyData.houseHolderAddress = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Address';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Maid’s residence Location",
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: Theme.of(context)
                                  .colorScheme
                                  .copyWith(primary: Colors.black),
                            ),
                            child: TextFormField(
                              textCapitalization: TextCapitalization.characters,
                              decoration: InputDecoration(
                                counter: const Offstage(),
                                hintText: "City",
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              onSaved: (value) {
                                setState(() {
                                  _surveyData.maidAddress = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter City';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Maid’s timings",
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: Theme.of(context)
                                  .colorScheme
                                  .copyWith(primary: Colors.black),
                            ),
                            child: TextFormField(
                              controller: _timeController,
                              onTap: () async {
                                var data = await showTimePicker(
                                    context: context,
                                    initialTime: TimeOfDay.now());
                                if(data?.hour != null){
                                  setState(() {
                                    _timeController.text =
                                    "${data?.hour}:${data?.minute}";
                                  });
                                }

                              },
                              keyboardType: TextInputType.none,
                              // showCursor: false,
                              decoration: InputDecoration(
                                counter: const Offstage(),
                                hintText: "00:00:00",
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50)),
                              ),

                              onSaved: (value) {
                                setState(() {
                                  _surveyData.maidTime = value;
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Time';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Number of chorus work he/she does",
                              style: GoogleFonts.poppins(fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: Theme.of(context)
                                  .colorScheme
                                  .copyWith(primary: Colors.black),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              maxLength: 1,
                              decoration: InputDecoration(
                                counter: const Offstage(),
                                hintText: "3",
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              onSaved: (value) {
                                setState(() {
                                  _surveyData.maidWorks = int.parse(value!);
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Work';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "How much he/she charge Fee per work ?",
                              style: GoogleFonts.poppins(fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: Theme.of(context)
                                  .colorScheme
                                  .copyWith(primary: Colors.black),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                counter: const Offstage(),
                                prefixText: "₹",
                                hintText: "500",
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              onSaved: (value) {
                                setState(() {
                                  _surveyData.maidMoneyPerWork =
                                      int.parse(value!);
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Fee';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "Total Fee",
                              style: GoogleFonts.poppins(fontSize: 18),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: Theme.of(context)
                                  .colorScheme
                                  .copyWith(primary: Colors.black),
                            ),
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                counter: const Offstage(),
                                prefixText: "₹",
                                hintText: "1000",
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                              onSaved: (value) {
                                setState(() {
                                  _surveyData.maidTotalMoney =
                                      int.parse(value!);
                                });
                              },
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please Enter Total Fee';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Text(
                            "Any Specific problem due to maid ?",
                            style: GoogleFonts.poppins(fontSize: 18),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Theme(
                            data: Theme.of(context).copyWith(
                              colorScheme: Theme.of(context)
                                  .colorScheme
                                  .copyWith(primary: Colors.black),
                            ),
                            child: TextFormField(
                              maxLines: 5,
                              decoration: InputDecoration(
                                counter: const Offstage(),
                                hintText: "ABC",
                                filled: true,
                                border: OutlineInputBorder(
                                    borderSide: BorderSide.none,
                                    borderRadius: BorderRadius.circular(25)),
                              ),
                              onSaved: (value) {
                                setState(() {
                                  _surveyData.otherProblem = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Center(
                            child: Text(
                              "RATING",
                              style: GoogleFonts.poppins(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Center(
                            child: RatingBar.builder(
                              initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding:
                                  const EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => const Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (value) {
                                setState(() {
                                  _surveyData.maidRating = value;
                                  rating = value;
                                });
                              },
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: double.infinity,
                            height: 50,
                            child: ElevatedButton(
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (rating == 0.0) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                            content:
                                                Text("Please Fill Rating")));
                                    return;
                                  }
                                  _formKey.currentState!.save();
                                  submitSurvey();
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Please Fill Al The Details")));
                                }
                              },
                              child: Text(
                                "Submit",
                                style: GoogleFonts.poppins(
                                    fontSize: 24, fontWeight: FontWeight.bold),
                              ),
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.black,
                                  shape: const RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(10)))),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ))
          ],
        ),
      ),
    );
  }

  void submitSurvey() async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return WillPopScope(
            onWillPop: () async => false,
            child: const AlertDialog(
              title: Text("Processing"),
              content: SizedBox(
                width: 100,
                height: 100,
                child: Center(
                  child: CircularProgressIndicator(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          );
        });

    var ref = FirebaseFirestore.instance
        .collection("surveys")
        .doc(widget.surveyId)
        .collection("responses");
    var data = _surveyData.toJson();

    try {
      await ref.add(data);
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text("Success")));
      Navigator.of(context).pop();
    } catch (e) {
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Error: $e")));
    }
  }
}
