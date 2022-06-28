import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:meu_diario_de_sintese/helpers/firebase_errors.dart';
import 'package:meu_diario_de_sintese/model/user_model.dart';
import 'package:meu_diario_de_sintese/pages/login.dart';

class UserLoginController extends GetxController {

  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  UserLoginController()  {
    _loadCurrentUser();
  }

  UserModel? user;

  var loading = false.obs;

  Future<void> singIn({UserModel? user, Function? onFail, Function? onSucess(UserModel newUser)?}) async {

    setLoading(true);

    try {
      final UserCredential result = await auth.signInWithEmailAndPassword(email: user!.email!, password: user!.pass!);
      await _loadCurrentUser(firebaseUser: result.user!);

      onSucess!(user!);

    } on FirebaseAuthException catch (e) {
      setLoading(false);
      onFail!(getErrorString(e.code));
    }
    on PlatformException catch (e) {
      onFail!(getErrorString(e.code));
    }

    setLoading(false);
  }

  Future<void> singUp({UserModel? user, Function? onFail, Function? onSucess(UserModel newUser)?}) async {
    setLoading(true);
    try {
      final UserCredential result = await auth.createUserWithEmailAndPassword(email: user!.email!, password: user!.pass!);

      user.id = result.user!.uid;
      this.user = user;

      await user.saveData();

      onSucess!(user!);

    } on FirebaseAuthException catch (e) {
      setLoading(false);
      onFail!(getErrorString(e.code));
      }
      on PlatformException catch (e) {
      setLoading(false);
      onFail!(getErrorString(e.code));
    }

    setLoading(false);
  }

  Future<void> signOut() async {
    await getUser();
    auth.signOut();
    user = null;
    Get.offAll(Login());
  }

  void setLoading(bool value){
    loading.value = value;
    update();
  }

  Future<void> _loadCurrentUser({User? firebaseUser}) async {
    setLoading(true);
    final User? currentUser = firebaseUser ?? auth.currentUser;


    if(currentUser != null) {
      final DocumentSnapshot docUser = await firestore.collection('users').doc(currentUser.uid).get();

      user = UserModel.fromDocumentSnapshot(documentSnapshot: docUser);
    }
    setLoading(false);
  }

  Future<void> getUser() async {
    if (user == null) {
      await _loadCurrentUser();
    }
  }
}