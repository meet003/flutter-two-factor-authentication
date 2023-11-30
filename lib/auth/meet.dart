import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:login_auth/screens/Home.dart';



class OTPScreen extends StatelessWidget {
  final TextEditingController otp = TextEditingController();
  final EmailOTP myauth;
  final String userEmail;
  // var userEmail;

  OTPScreen(this.myauth , {super.key, required this.userEmail});

  @override
  Widget build(BuildContext context) {
    // var widget;
    return Scaffold(
       extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(10, 80, 20, 0),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            
            children: [

               Text(
                "Enter 6 digit code sent to ${userEmail}",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              Card(
                child: Column(

                  children: [

                    
             
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: otp,
                        decoration: const InputDecoration(hintText: "Enter OTP"),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        if (await myauth.verifyOTP(otp: otp.text) == true) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("OTP is verified"),
                            ),
                          );
                          Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => HomeScreen(),
                                    ),
                                  );
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text("Invalid OTP"),
                            ),
                          );
                        }
                      },
                      child: const Text("Verify"),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class otp extends StatefulWidget {
//   final String userEmail;
//   final EmailOTP myauth;

//   otp(this.myauth, {required this.userEmail});

//   @override
//   _otpState createState() => _otpState();
// }

// class _otpState extends State<otp> {
//   // TextEditingController email = new TextEditingController();
//   TextEditingController otp = new TextEditingController();
//   EmailOTP myauth = EmailOTP();
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       extendBodyBehindAppBar: true,
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//       ),
//       body: Container(
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height,
//         padding: EdgeInsets.fromLTRB(10, 80, 20, 0),
//         child: Padding(
//           padding: const EdgeInsets.all(15),
//           child: Column(
//             // mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 "Enter 6 digit code sent to ${widget.userEmail}",
//                 style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(
//                 height: 50,
//               ),
//               Card(
//                 child: Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: TextFormField(
//                           controller: otp,
//                           decoration:
//                               const InputDecoration(hintText: "Enter OTP")),
//                     ),
//                     Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           // ElevatedButton(
//                           //     onPressed: () async {
//                           //       myauth.setConfig(
//                           //         appEmail: "me@rohitchouhan.com",
//                           //         appName: "Email OTP",
//                           //         userEmail: widget.userEmail,
//                           //         otpLength: 6,
//                           //         otpType: OTPType.digitsOnly
//                           //       );
//                           //       if (await myauth.sendOTP() == true) {
//                           //         ScaffoldMessenger.of(context)
//                           //             .showSnackBar(const SnackBar(
//                           //           content: Text("OTP has been sent"),
//                           //         ));
//                           //       } else {
//                           //         ScaffoldMessenger.of(context)
//                           //             .showSnackBar(const SnackBar(
//                           //           content: Text("Oops, OTP send failed"),
//                           //         ));
//                           //       }
//                           //     },
//                           // child: const Text("Get OTP")),
//                           ElevatedButton(
//                               onPressed: () async {
//                                 if (await myauth.verifyOTP(otp: otp.text) ==
//                                     true) {
//                                   ScaffoldMessenger.of(context)
//                                       .showSnackBar(const SnackBar(
//                                     content: Text("OTP is verified"),
//                                   ));
//                                   Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => HomeScreen(),
//                                     ),
//                                   );
//                                 } else {
//                                   ScaffoldMessenger.of(context)
//                                       .showSnackBar(const SnackBar(
//                                     content: Text("Invalid OTP"),
//                                   ));
//                                 }
//                               },
//                               child: const Text("Verify")),
//                         ])
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

// Card(
//   child: Column(
//     children: [
//       Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: TextFormField(
//           controller: otp,
//           decoration: const InputDecoration(hintText: "Enter OTP"),
//         ),
//       ),
//       ElevatedButton(
//         onPressed: () async {
//           myauth.setConfig(
//               appEmail: "me@rohitchouhan.com",
//               appName: "Email OTP",
//               userEmail: widget.userEmail,
//               otpLength: 6,
//               otpType: OTPType.digitsOnly);
//           if (await myauth.sendOTP() == true) {
//             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//               content: Text("OTP has been sent"),
//             ));
//           } else {
//             ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//               content: Text("Oops, OTP send failed"),
//             ));
//           }
//         },
//         child: const Text("Send OTP"),
//       ),
//       // Row for ElevatedButtons
//       Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           ElevatedButton(
//             onPressed: () async {
//               if (await myauth.verifyOTP(otp: otp.text) == true) {
//                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                   content: Text("OTP is verified"),
//                 ));
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => HomeScreen(),
//                   ),
//                 );
//               } else {
//                 ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                   content: Text("Invalid OTP"),
//                 ));
//               }
//             },
//             child: const Text("Verify"),
//           ),
//           // Add any additional buttons as needed
//         ],
//       ),
//     ],
//   ),
// )
