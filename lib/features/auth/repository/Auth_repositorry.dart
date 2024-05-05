import 'package:firebase_auth/firebase_auth.dart';
import 'package:fpdart/fpdart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mitco_task/features/model_class/order_model_class.dart';

import '../../../core/variables/failure.dart';

class AuthRepository {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _firestore;
  AuthRepository(
      {required FirebaseAuth firebaseAuth,
      required FirebaseFirestore firestore})
      : _firebaseAuth = firebaseAuth,
        _firestore = firestore;

  Future<Either<Failure, OrderModel?>> signIn(
      {required String email, required String password}) async {
    try {

      OrderModel? orderModel;
      await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
            print('succedd');
            print(value.user!.email);
            final userdoc=await
        _firestore
            .collection('order')
            .where('email', isEqualTo: value.user!.email)
            .get();
            orderModel = OrderModel.fromMap(userdoc.docs.first.data());
      });
      return right(orderModel!);
    } catch (error) {
      return left(Failure(error.toString()));
    }
  }
}
