import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  //Rx<User?> user = Rx<User?>(null);
  Rx<User?> user = Rx<User?>(FirebaseAuth.instance.currentUser);

  @override
  void onInit() {
    super.onInit();
    user.value = _auth.currentUser;
    _auth.authStateChanges().listen((User? u) {
      user.value = u;
    });
  }

  Future<void> updateUserData() async {
    await FirebaseAuth.instance.currentUser?.reload();
    user.value = FirebaseAuth.instance.currentUser; // Update user info
    print("Updated User Profile Photo URL: ${user.value?.photoURL}");
    update();
  }

  Future<bool> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) return false; // User canceled login

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final UserCredential userCredential =
          await _auth.signInWithCredential(credential);
      user.value = userCredential.user;
      return true;
    } catch (e) {
      Get.snackbar("Login Failed", e.toString());
      return false;
    }
  }

  bool isUserLoggedIn() {
    return user.value != null;
  }

  Future<void> signOut() async {
    await _auth.signOut();
    await _googleSignIn.signOut();
    user.value = null;
    Get.offAllNamed("/");
  }
}
