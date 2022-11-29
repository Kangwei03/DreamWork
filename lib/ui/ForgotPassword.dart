import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/services.dart';
import 'package:pinput/pinput.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  bool Validate(String email) {
    return EmailValidator.validate(email);
  }

  bool buttonEnabled = false;
  bool showOTP = false;

  final txtEmailController = TextEditingController();
  final txtVerificationController = TextEditingController();

  bool isPassFilled() {
    if (txtEmailController.text != "") {
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text("DreamWork",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white)),
              ],
            )),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
            width: MediaQuery.of(context).size.width,
            child: Text("FORGOT PASSWORD",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold
                )),
          ),
          Container(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Column(
                children: [
                  Container(
                    child: Column(
                      children: [
                        TextFormField(
                          controller: txtEmailController,
                          decoration: InputDecoration(
                            icon: Icon(Icons.email_outlined),
                            labelText: 'Email',
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        SizedBox(height: 38),
                        Container(
                          width: 150,
                          height: 50,
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                          ),
                          child: MaterialButton(
                            onPressed: (() {
                              if (!Validate(txtEmailController.text)) {
                                showDialog(
                                  context: context,
                                  builder: (ctx) => AlertDialog(
                                    title: const Text("Uncorrect Email Format.",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    content: const Text(
                                        "You may Re-Enter a valid Email."),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          txtEmailController.clear();
                                          Navigator.of(ctx).pop();
                                        },
                                        child: Container(
                                          color: Colors.black,
                                          padding: const EdgeInsets.all(14),
                                          child: Text("OK",
                                              style: TextStyle(
                                                  color: Colors.white)),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              } else {
                                setState(() {
                                  showOTP = true;
                                });
                              }
                            }),
                            child: Text("Check", textAlign: TextAlign.center),
                          ),
                        ),
                        SizedBox(height: 28),
                        //call return widget function
                        if (showOTP)
                          Container(
                            child: Column(
                              children: [
                                Text("Verification",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20,
                                )),
                                SizedBox(height: 10),
                                Text("Enter the code that send to the email, \n ${txtEmailController.text}.",
                                style: TextStyle(
                                  color: Colors.grey
                                ),
                                textAlign: TextAlign.center),
                                SizedBox(height: 28),
                                Container(
                                    child: Pinput(
                                      length: 6,
                                      textInputAction: TextInputAction.next,
                                      showCursor: true,
                                      validator: (s) {
                                        print('validating code: $s');
                                      },
                                      onChanged: (value){
                                        if(txtVerificationController.text.length == 6){
                                          print('complete');
                                          Navigator.pushNamed(context, "resetPassword");
                                        }
                                      },
                                      controller: txtVerificationController,
                                      keyboardType: TextInputType.number,
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.digitsOnly,
                                      ],
                                    )),
                                SizedBox(height: 28),
                                Container(
                                    child: Column(
                                      children:[
                                        Text("Didnt Receive Code?",
                                            textAlign: TextAlign.center),
                                        SizedBox(height: 8),
                                        InkWell(
                                            child: Text("Resend",
                                                style: TextStyle(
                                                    color: Colors.blue
                                                )),
                                            onTap: () => {
                                            }
                                        )
                                      ],
                                    )
                                )
                              ],
                            )
                          ),

                      ],
                    ),
                  ),
                ],
              )),
        ])));
  }
}
