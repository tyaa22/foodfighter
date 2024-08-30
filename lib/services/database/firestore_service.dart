import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {

  //get collections of orders
  final CollectionReference orders = FirebaseFirestore.instance.collection('orders');

  //save order to db
  Future<void> saveOrder(String receipt) async {
    await orders.add(
        {'time': DateTime.now(),
          'order': receipt,
        }
    );
  }
}