import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hexcolor/hexcolor.dart';

import '../Screens/intro_screen.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            HexColor("96D7FA"),
            HexColor("ABECD6"),
          ])),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50),
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
              const SizedBox(
                height: 10,
              ),
              Text(
                "Hello Volunteer",
                style: GoogleFonts.poppins(
                    fontSize: 24, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(right: 30),
                  width: double.infinity,
                  height: 65,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        HexColor("D4FC79"),
                        HexColor("96E6A1"),
                      ]),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  child: Center(
                      child: Text(
                    "Edit your Profile",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(right: 30),
                  width: double.infinity,
                  height: 65,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        HexColor("D4FC79"),
                        HexColor("96E6A1"),
                      ]),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  child: Center(
                      child: Text(
                    "Rating\n0/5",
                    style: GoogleFonts.poppins(
                        fontSize: 18, fontWeight: FontWeight.w500),
                    textAlign: TextAlign.center,
                  )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(right: 30),
                  width: double.infinity,
                  height: 65,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        HexColor("D4FC79"),
                        HexColor("96E6A1"),
                      ]),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  child: Image.asset(
                    "assets/drawerAssetOne.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: const EdgeInsets.only(right: 30),
                  width: double.infinity,
                  height: 65,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        HexColor("D4FC79"),
                        HexColor("96E6A1"),
                      ]),
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50))),
                  child: Image.asset(
                    "assets/drawerAssetTwo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Expanded(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Log Out"),
                                  content: const Text(
                                      "Are You Sure ? You want to Log Out"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "Cancel",
                                          style: GoogleFonts.poppins(
                                              color: Colors.black),
                                        )),
                                    TextButton(
                                        onPressed: () {
                                          FirebaseAuth.instance
                                              .signOut()
                                              .then((value) {
                                            Navigator.of(context)
                                                .pushAndRemoveUntil(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            const IntroScreen()),
                                                    (route) => false);
                                          });
                                        },
                                        child: Text(
                                          "Log Out",
                                          style: GoogleFonts.poppins(
                                              color: Colors.red),
                                        ))
                                  ],
                                );
                              });
                        },
                        child: Text(
                          "Log Out",
                          style: GoogleFonts.poppins(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)))),
                      )),
                  SizedBox(
                      width: 200,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  title: const Text("Feedback"),
                                  content: const Text("Coming Soon"),
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text(
                                          "Ok",
                                          style: GoogleFonts.poppins(
                                              color: Colors.black),
                                        ))
                                  ],
                                );
                              });
                        },
                        child: Text(
                          "Feedback",
                          style: GoogleFonts.poppins(color: Colors.black),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 0,
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(50)))),
                      )),
                ],
              )),
              Text(
                "Version 1.0",
                style: GoogleFonts.poppins(color: Colors.black38),
              )
            ],
          ),
        ),
      ),
    );
  }
}
