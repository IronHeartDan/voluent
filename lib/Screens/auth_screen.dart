import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:voluentie/Screens/home.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isCodeSent = false;
  bool codeEntered = false;
  bool verifying = false;
  late String verificationId;
  var phone;
  var code;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: null,
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "VolunT",
          style: GoogleFonts.poppins(
              color: Colors.black, fontSize: 32, fontWeight: FontWeight.w500),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height -
              (AppBar().preferredSize.height +
                  MediaQuery.of(context).padding.top),
          child: Column(
            children: [
              Row(
                children: [
                  InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                        width: 50,
                        height: 50,
                        decoration: const BoxDecoration(shape: BoxShape.circle),
                        child: Image.asset("assets/backArrow.png")),
                  )
                ],
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Image.asset(
                      "assets/userMale.png",
                      height: 200,
                    ),
                  ),
                  Text(
                    "Hi Volunteer,",
                    style: GoogleFonts.poppins(
                        fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "Phone Number",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
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
                      keyboardType: TextInputType.phone,
                      maxLength: 10,
                      decoration: InputDecoration(
                        counter: const Offstage(),
                        prefixIcon: const Icon(Icons.phone),
                        prefix: const Text(
                          "+91",
                          style: TextStyle(color: Colors.black),
                        ),
                        filled: true,
                        border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                      onChanged: (value) {
                        if (value.length == 10) {
                          confirmNumber(value);
                        }
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      "OTP",
                      style: GoogleFonts.poppins(
                          fontSize: 16, fontWeight: FontWeight.w500),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    enabled: isCodeSent,
                    keyboardType: TextInputType.number,
                    maxLength: 6,
                    decoration: InputDecoration(
                      helperText: "Enter OTP",
                      counter: const Offstage(),
                      filled: true,
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(50)),
                    ),
                    onChanged: (value) {
                      if (value.length == 6) {
                        setState(() {
                          codeEntered = true;
                          code = value;
                        });
                      } else {
                        codeEntered = false;
                      }
                    },
                  ),
                ],
              )),
              Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 50,
                      child: ElevatedButton(
                        onPressed: codeEntered
                            ? verifying
                                ? null
                                : () {
                                    verify();
                                  }
                            : null,
                        child: verifying
                            ? const Center(
                                child: CircularProgressIndicator(
                                  color: Colors.black,
                                ),
                              )
                            : Text(
                                "Log In",
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

  confirmNumber(String value) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              "Confirm Number",
              style: GoogleFonts.poppins(),
            ),
            content: Text("An OTP will be sent to this number $value"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    "Cancel",
                    style: GoogleFonts.poppins(color: Colors.black),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                    sendOTP(value);
                  },
                  child: Text(
                    "Send OTP",
                    style: GoogleFonts.poppins(color: Colors.red),
                  ))
            ],
          );
        });
  }

  void sendOTP(String value) async {
    print(value);
    // showDialog(
    //    barrierDismissible: false,
    //    context: context,
    //    builder: (context) {
    //      return AlertDialog(
    //        title: Text("Sending OTP to $value"),
    //        content: const SizedBox(
    //            height: 100,
    //            width: 100,
    //            child: Center(child: CircularProgressIndicator())),
    //      );
    //    });

    var auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      phoneNumber: "+91$value",
      verificationCompleted: (PhoneAuthCredential credential) async {
        auth.signInWithCredential(credential).then((value) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
              (route) => false);
        });
      },
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verifyId, int? resendToken) {
        setState(() {
          phone = value;
          isCodeSent = true;
          verificationId = verifyId;
        });
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void verify() {
    setState(() {
      verifying = true;
    });
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
        verificationId: verificationId, smsCode: code);
    FirebaseAuth.instance.signInWithCredential(credential).then((value) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (route) => false);
    });
  }
}
