import 'package:airpedia/app/models/user_model.dart';
import 'package:airpedia/utils/app_utils.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class UserInfoController extends GetxController {
  Rx<UserModel> dataUser = const UserModel().obs;

  void setDataUser(UserModel value) => dataUser(value);

  Future<void> getDataUser() async {
    try {
      final collectionUser = FirebaseFirestore.instance.collection('users');
      final user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final data = await collectionUser.doc(user.uid).get();

        final dataUserUpdate = UserModel(
          balance: data['balance'] ?? 0,
          dateOfBirth: data['date_of_birth'] ?? '',
          email: data['email'] ?? '',
          fullName: data['full_name'] ?? '',
          imageProfile: data['image_profile'] ?? '',
          pinTransaction: data['pin_transaction'] ?? '',
          userId: user.uid,
        );

        dataUser.value = dataUserUpdate;
        logSys('cek data user : ${dataUser.value}');
      }
    } catch (e) {
      logSys(e.toString());
      rethrow;
    }
  }
}
