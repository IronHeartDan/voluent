import 'package:firebase_auth/firebase_auth.dart';

class SurveyData {
  String? by = FirebaseAuth.instance.currentUser?.phoneNumber?.substring(3);
  String? houseHolderName;
  String? houseHolderAddress;
  String? maidAddress;
  String? maidTime;
  int? maidWorks;
  int? maidMoneyPerWork;
  int? maidTotalMoney;
  String? otherProblem;
  double? maidRating;

  SurveyData({this.houseHolderName,
    this.houseHolderAddress,
    this.maidAddress,
    this.maidTime,
    this.maidWorks,
    this.maidMoneyPerWork,
    this.maidTotalMoney,
    this.otherProblem,
    this.maidRating});


  Map<String, Object?> toJson() {
    return {
      "by": by,
      "houseHolderName": houseHolderName,
      "houseHolderAddress": houseHolderAddress,
      "maidAddress": maidAddress,
      "maidTime": maidTime,
      "maidWorks": maidWorks,
      "maidMoneyPerWork": maidMoneyPerWork,
      "maidTotalMoney": maidTotalMoney,
      "otherProblem": otherProblem,
      "maidRating": maidRating,
    };
  }
}
