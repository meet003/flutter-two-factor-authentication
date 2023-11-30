import 'package:flutter/material.dart';
import 'package:login_auth/auth/meet.dart';
import 'package:login_auth/reusable_widgets/reusable_widget.dart';
import 'package:login_auth/screens/resetPassword.dart';
import 'package:login_auth/screens/signup.dart';
import 'package:login_auth/utils/color.dart';
// import 'package:login_auth/screens/Home.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:email_otp/email_otp.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _passwordTextController = TextEditingController();
  TextEditingController _emailTextController = TextEditingController();
  EmailOTP myauth = EmailOTP();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
          hexStringToColor("9546C4"),
          hexStringToColor("5E61F4")
        ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(
                20, MediaQuery.of(context).size.height * 0.2, 20, 0),
            child: Column(
              children: <Widget>[
                logoWidget("assets/images/FlowXpert.png"),
                SizedBox(
                  height: 10,
                ),
                reusableTextField(
                    "Enter", Icons.verified_user, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField("Enter Password", Icons.lock_outline, true,
                    _passwordTextController),
                const SizedBox(
                  height: 5,
                ),

                forgetPassword(context),

                firebaseUIButton(context, "Sign In", () {
                  FirebaseAuth.instance
                      .signInWithEmailAndPassword(
                          email: _emailTextController.text,
                          password: _passwordTextController.text)
                      .then((value) async {

                         myauth.setConfig(
                          appEmail: "me@rohitchouhan.com",
                          appName: "Email OTP",
                          userEmail: _emailTextController.text,
                          otpLength: 6,
                          otpType: OTPType.digitsOnly,
                        );

                        

                        if (await myauth.sendOTP() == true) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OTPScreen(myauth , userEmail : _emailTextController.text)
                            ),
                          );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Oops, OTP send failed"),
                            ),
                          );
                        }


                  //   Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => otp(
                  //         userEmail : _emailTextController.text, myauth
                  //       ),
                  //     ),
                  //   );
                   }
                  ).onError((error, stackTrace) {
                    print("Error ${error.toString()}");
                  });
                  
                }),

                              
                  
                signUpOption(context)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Row signUpOption(BuildContext context) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      const Text("Don't have account?",
          style: TextStyle(color: Color.fromARGB(234, 255, 255, 255))),
      GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => signUpscreen()));
        },
        child: const Text(
          " Sign Up",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),   
        ),
      ) 
    ],
  );
}



Widget forgetPassword(BuildContext context) {       
  return Container(
    width: MediaQuery.of(context).size.width,
    height: 35,
    alignment: Alignment.bottomRight,
    child: TextButton(
      child: const Text(
        "Forgot Password?",
        style: TextStyle(color: Colors.white70),
        textAlign: TextAlign.right,
      ),
      onPressed: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => ResetPassword())),
    ),
  );
}

//demo



