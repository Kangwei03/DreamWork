import 'package:flutter/material.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  State<ResetPassword> createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  bool showUserPassword = false;
  bool showUserConfirmPassword = false;
  bool buttonEnabled = false;

  final txtPasswordController = TextEditingController();
  final txtConfirmPasswordController = TextEditingController();

  bool isPassFilled() {
    if (txtPasswordController.text != "" &&
        txtConfirmPasswordController.text != "") {
      if (txtPasswordController.text == txtConfirmPasswordController.text)
        return true;

    }
    return false;
  }


  void initState() {
    super.initState();
    initView();
    setState(() {
      buttonEnabled = false;
    });
  }

  void initView() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                // Image.asset("Assets/dream4.png",
                //     fit: BoxFit.fill,
                //     color: Colors.white),
                children: const [
                  Text("DreamWork",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                ])),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(20, 25, 20, 10),
            child: Column(children: [
              Text("Reset Password",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
              SizedBox(height: 28),
              TextFormField(
                  obscureText: !showUserPassword,
                  controller: txtPasswordController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.lock),
                      labelText: "Password",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                          icon: Icon(
                            //_showCurrentPassword was a condition
                            showUserPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            //setState is the tool that make the state change
                            setState(() {
                              showUserPassword = !showUserPassword;
                            });
                          })),
                  onEditingComplete: () {
                    setState(() {
                      buttonEnabled = isPassFilled();
                      FocusScope.of(context).unfocus();
                    });
                  }),
              SizedBox(height: 28),
              TextFormField(
                  obscureText: !showUserConfirmPassword,
                  controller: txtConfirmPasswordController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.spellcheck),
                      labelText: "Confirm Password",
                      border: OutlineInputBorder(),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.blue),
                      ),
                      labelStyle: TextStyle(color: Colors.black),
                      suffixIcon: IconButton(
                          icon: Icon(
                            //_showCurrentPassword was a condition
                            showUserConfirmPassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                          onPressed: () {
                            //setState is the tool that make the state change
                            setState(() {
                              showUserConfirmPassword =
                              !showUserConfirmPassword;
                            });
                          })),
                  onEditingComplete: () {
                    setState(() {
                      buttonEnabled = isPassFilled();
                      FocusScope.of(context).unfocus();
                    });
                  }),
              SizedBox(height: 60),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 60,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                            margin: EdgeInsets.fromLTRB(10,0,20,0),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(color: Colors.grey)),
                            height: MediaQuery.of(context).size.height,
                            width: 130,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    disabledForegroundColor: Colors.blue.withOpacity(0.38),
                                    disabledBackgroundColor: Colors.white.withOpacity(0.12)),
                                onPressed: buttonEnabled ? () {

                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: const Text("Reset Password Successful",
                                          style: TextStyle(fontWeight: FontWeight.bold)),
                                      content: const Text(
                                          "You have successfully rest Password. You may sign in now."),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.pushNamedAndRemoveUntil(context, 'login', (route) => false);
                                          },
                                          child: Container(
                                            color: Colors.black,
                                            padding: const EdgeInsets.all(14),
                                            child: Text("OK",
                                                style: TextStyle(color: Colors.white)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );


                                } : null
                                , child: Text("Submit",
                                style: TextStyle(
                                    color: Colors.white
                                )))),
                      ),
                      Expanded(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10,0,20,0),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(color: Colors.grey)),
                            height: MediaQuery.of(context).size.height,
                            width: 130,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    disabledForegroundColor: Colors.blue.withOpacity(0.38),
                                    disabledBackgroundColor: Colors.white.withOpacity(0.12)),
                                onPressed: () {
                                  txtPasswordController.clear();
                                  txtConfirmPasswordController.clear();
                                  setState(() {
                                    buttonEnabled = false;
                                  });
                                }, child: Text("Reset")),
                          )
                      )
                    ],
                  ))
            ]),
          ),
        ));
  }
}
