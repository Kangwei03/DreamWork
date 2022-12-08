import 'package:flutter/material.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
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
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Dream Work",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                    child: Text("RESET PASSWORD",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ))),
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
                              margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                              decoration: BoxDecoration(
                                  color: Colors.grey,
                                  border: Border.all(color: Colors.grey)),
                              height: MediaQuery.of(context).size.height,
                              width: 130,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      disabledForegroundColor:
                                          Colors.blue.withOpacity(0.38),
                                      disabledBackgroundColor:
                                          Colors.white.withOpacity(0.12)),
                                  onPressed: buttonEnabled
                                      ? () {
                                          showDialog(
                                            context: context,
                                            builder: (ctx) => AlertDialog(
                                              title: const Text(
                                                  "Reset Password Successful",
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              content: const Text(
                                                  "You have successfully reset Password. You may continue to use."),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pushNamed(
                                                        context, "homePage");
                                                  },
                                                  child: Container(
                                                    color: Colors.black,
                                                    padding:
                                                        const EdgeInsets.all(
                                                            14),
                                                    child: Text("OK",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white)),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          );
                                        }
                                      : null,
                                  child: Text("Submit",
                                      style: TextStyle(color: Colors.white)))),
                        ),
                        Expanded(
                            child: Container(
                          margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                          decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(color: Colors.grey)),
                          height: MediaQuery.of(context).size.height,
                          width: 130,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  disabledForegroundColor:
                                      Colors.blue.withOpacity(0.38),
                                  disabledBackgroundColor:
                                      Colors.white.withOpacity(0.12)),
                              onPressed: () {
                                txtPasswordController.clear();
                                txtConfirmPasswordController.clear();
                                setState(() {
                                  buttonEnabled = false;
                                });
                              },
                              child: Text("Reset")),
                        ))
                      ],
                    ))
              ],
            ),
          ),
        ));
  }
}
