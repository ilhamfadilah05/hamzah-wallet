// ignore_for_file: body_might_complete_normally_catch_error, invalid_return_type_for_catch_error

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hamzah_wallet/app/models/transaction_model.dart';

class TransactionService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future getAllTransaction() async {
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await firestore.collection('transaction').get();

    if (snapshot.docs.isEmpty) {
      return null;
    } else {
      return snapshot.docs;
    }
  }

  Future postDataTransaction(TransactionModel data) async {}
}
