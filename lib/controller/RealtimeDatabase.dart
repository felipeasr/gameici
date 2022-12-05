import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import '../model/cards_model.dart' as card_model;
import '../model/ranking_model.dart' as card_ranking;
import 'AuthService.dart';

class RealtimeDatabase {
  Future<DatabaseReference> getRef() async {
    String? uid = AuthService(FirebaseAuth.instance).getUid();

    DatabaseReference ref = FirebaseDatabase.instance.ref('users/$uid');
    if (ref.key == null) {
      await ref.set({uid: {}});
    }
    ref = FirebaseDatabase.instance.ref('users/$uid');
    return ref;
  }

  Future<void> addRanking(card_ranking.CarRanking newraking) async {
    String? uid = AuthService(FirebaseAuth.instance).getUid();

    DatabaseReference ref = FirebaseDatabase.instance.ref('ranking/$uid');

    await ref.set(newraking.toMap());
  }

  Future<Query> getQueryRanking() async {
    String? uid = AuthService(FirebaseAuth.instance).getUid();
    DatabaseReference ref = FirebaseDatabase.instance.ref('ranking/$uid');
    if (ref.key == null) {
      await ref.set({
        uid: {'ranking': {}}
      });
    }
    var query =
        FirebaseDatabase.instance.ref('ranking').orderByChild("pontuacao");
    return query;
  }

  Future<void> addcardSaude(card_model.Cardmodel newUser) async {
    var ref = await getRef();
    ref = ref.child('cards');
    ref = ref.child('saude');
    var newPatienteId = ref.push().key;
    ref = ref.child(newPatienteId!);
    await ref.set(newUser.toMap());
  }

  Future<void> addcardEduca(card_model.Cardmodel newUser) async {
    var ref = await getRef();
    ref = ref.child('cards');
    ref = ref.child('educa');
    var newPatienteId = ref.push().key;
    ref = ref.child(newPatienteId!);
    await ref.set(newUser.toMap());
  }

  Future<Query> getQuerycardSaude() async {
    String? uid = AuthService(FirebaseAuth.instance).getUid();
    DatabaseReference ref = FirebaseDatabase.instance.ref('users/$uid');
    if (ref.key == null) {
      await ref.set({
        uid: {'saude': {}}
      });
    }
    var query = FirebaseDatabase.instance
        .ref('users/tHS3rNWlSva4Um8swx5rstjpRtF2/cards/saude')
        .orderByKey();
    return query;
  }

  Future<Query> getQuerycardEduca() async {
    String? uid = AuthService(FirebaseAuth.instance).getUid();
    DatabaseReference ref = FirebaseDatabase.instance.ref('users/$uid');
    if (ref.key == null) {
      await ref.set({
        uid: {'educa': {}}
      });
    }
    var query = FirebaseDatabase.instance
        .ref('users/tHS3rNWlSva4Um8swx5rstjpRtF2/cards/educa')
        .orderByKey();
    return query;
  }

  Future<void> removecard(DataSnapshot data) async {
    DatabaseReference ref = data.ref;
    await ref.child(data.key.toString()).remove();
  }

//('users/$uid/pacientes/key/testes/a')

}
