import 'package:email_auth/email_auth.dart';

class VerificationService {
  late EmailAuth emailAuth = new EmailAuth(sessionName: "Frankie the King");

//  void initState() {
//     super.initState();
//     emailAuth = new EmailAuth(sessionName: "Frankie the King");

//     //Configurando el servidor remoto
//     emailAuth.config(remoteServerConfiguration);
//   }

  void sendOTP(String email) async {
    var res = await emailAuth.sendOtp(recipientMail: email, otpLength: 3);
    if (res) {
      print("OTP sent");
    } else {
      print("OTP not sent");
    }
  }

  bool verify(String email, String otp) {
    bool res = emailAuth.validateOtp(recipientMail: email, userOtp: otp);
    return res;
  }
}
