import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../model/ranking_model.dart' as card_ranking;

class RankingDatabase {
  Future<void> addRanking(card_ranking.CarRanking newraking) async {
    User? user = FirebaseAuth.instance.currentUser;
    await FirebaseFirestore.instance
        .collection("ranking")
        .doc(user?.uid)
        .set(newraking.toMap());
  }

  
}
