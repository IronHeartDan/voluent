import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voluentie/Screens/auth_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  AppBar appBar = AppBar(
    centerTitle: true,
    backgroundColor: Colors.white,
    elevation: 0,
    title: Text(
      "VolunT",
      style: GoogleFonts.poppins(
          color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height -
              (appBar.preferredSize.height +
                  MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/authAsset.png",
                  height: 300,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dear Volunteer ,",
                              style: GoogleFonts.poppins(
                                  fontSize: 32, fontWeight: FontWeight.w500),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "You have got ACCESS to this app by the\npermission of our team member. ",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              "You have to login with your specified\ncredentials and proceed for progressing\nwith the survey.",
                              style: GoogleFonts.poppins(
                                  fontSize: 16, fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const AuthScreen()));
                        },
                        child: Text(
                          "Lets get started !",
                          style: GoogleFonts.poppins(
                              fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)))),
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
