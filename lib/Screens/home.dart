import 'dart:math';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:voluentie/Screens/survey_screen.dart';
import 'package:voluentie/Widgets/bottom_clip.dart';
import 'package:voluentie/Widgets/drawer.dart';

import '../Widgets/top_clip.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: const CustomDrawer(),
        body: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Positioned(
                  top: 120,
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 5,
                    childAspectRatio: 1 / 1.5,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SurveyHomeScreen()));
                        },
                        child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Container(
                                  width: 120,
                                  height: 120,
                                  decoration: BoxDecoration(
                                      color: HexColor("83E753"),
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(70))),
                                  child: Center(
                                      child: Text(
                                    "Survey",
                                    style: GoogleFonts.poppins(
                                        color: HexColor("277700"),
                                        fontSize: 24,
                                        fontWeight: FontWeight.w500),
                                  ))),
                            )),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    color: HexColor("C4C4C4"),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(70))),
                                child: Center(
                                  child: Text(
                                    "Activity",
                                    style: GoogleFonts.poppins(
                                        fontSize: 24, color: HexColor("9A9A9A")),
                                  ),
                                ),
                              ),
                            )),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    color: HexColor("C4C4C4"),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(70))),
                                child: Center(
                                  child: Text(
                                    "Activity",
                                    style: GoogleFonts.poppins(
                                        fontSize: 24, color: HexColor("9A9A9A")),
                                  ),
                                ),
                              ),
                            )),
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                            color: Colors.white,
                            child: Center(
                              child: Container(
                                width: 120,
                                height: 120,
                                decoration: BoxDecoration(
                                    color: HexColor("C4C4C4"),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(70))),
                                child: Center(
                                  child: Text(
                                    "Activity",
                                    style: GoogleFonts.poppins(
                                        fontSize: 24, color: HexColor("9A9A9A")),
                                  ),
                                ),
                              ),
                            )),
                      ),
                    ],
                  )),
              Positioned(
                  top: 0,
                  child: ClipPath(
                    clipper: BottomClip(),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 400,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                              transform: const GradientRotation(pi / 4),
                              colors: [
                            HexColor("705DEE"),
                            HexColor("FFC3A0"),
                          ])),
                    ),
                  )),
              Positioned(
                top: 0,
                child: ClipPath(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    color: Colors.black,
                    // decoration: BoxDecoration(
                    //     gradient: LinearGradient(
                    //         begin: Alignment.centerLeft,
                    //         colors: [HexColor("A1C4FD"), HexColor("C2E9FB")])),
                  ),
                  clipper: CustomClipPathTop(),
                ),
              ),
              Positioned(
                top: 30,
                child: Text(
                  "VolunT",
                  style: GoogleFonts.poppins(
                      color: Colors.white,
                      fontSize: 32,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Positioned(
                top: 50,
                left: 0,
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  child: InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    onTap: () {
                      _key.currentState?.openDrawer();
                    },
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: const Icon(
                          Icons.menu,
                          color: Colors.black,
                          size: 30.0,
                        )),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
