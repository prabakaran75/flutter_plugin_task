import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../screens/dashbord/home_screen.dart';

class AuthProvider with ChangeNotifier {
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController otpCtrl = TextEditingController();
  String? verificationId;
  bool isOTPSent = false;
  bool isLoading = false;
  String? errorMessage = '';

  bool isTestingMode = true;

  User? userData;

  @override
  void dispose() {
    phoneCtrl.dispose();
    otpCtrl.dispose();
    super.dispose();
  }

  Future<void> sendOTP(String phoneNumber) async {
    isLoading = true;
    notifyListeners();

    if (isTestingMode) {
      await Future.delayed(Duration(seconds: 1));
      verificationId = 'test_verification_id'; // Fake verification ID
      isOTPSent = true;
      isLoading = false;
      notifyListeners();
      return;
    }

    try {
      await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: phoneNumber,
        timeout: const Duration(seconds: 60),
        verificationCompleted: (PhoneAuthCredential credential) async {
          await FirebaseAuth.instance.signInWithCredential(credential);
          isLoading = false;
          notifyListeners();
        },
        verificationFailed: (FirebaseAuthException e) {
          errorMessage = e.message;
          isLoading = false;
          notifyListeners();
        },
        codeSent: (String verId, int? resendToken) {
          verificationId = verId;
          isOTPSent = true;
          isLoading = false;
          notifyListeners();
        },
        codeAutoRetrievalTimeout: (String verId) {
          verificationId = verId;
        },
      );
    } catch (e) {
      errorMessage = "Error: ${e.toString()}";
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> verifyOTP(String otp, BuildContext context) async {
    print("fsdkmnfkjnds$otp");
    if (isTestingMode) {
      if (otp == '123456') {
        UserCredential userCredential =
            await FirebaseAuth.instance.signInAnonymously();
        User? user = userCredential.user;
        userData = user;
        if (user != null) {
          if (!context.mounted) {
            return;
          }
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomeScreen(user: user),
            ),
          );
        }
        notifyListeners();
        return;
      } else {
        errorMessage = "Invalid OTP.";
        notifyListeners();
        return;
      }
    }

    if (verificationId != null) {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId!,
          smsCode: otp,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
      } catch (e) {
        errorMessage = "Invalid OTP.";
        notifyListeners();
      }
    }
  }

  void clear() {
    phoneCtrl.clear();
    otpCtrl.clear();
    verificationId = null;
    isOTPSent = false;
    errorMessage = null;
    notifyListeners();
  }
}
