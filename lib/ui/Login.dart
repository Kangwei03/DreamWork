import 'package:dreamwork/Constant.dart';
import 'package:dreamwork/repository/UserRepository.dart';
import 'package:dreamwork/util/Widgets.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool buttonEnabled = false;
  bool txtUserPassword = true;
  bool showUserPassword = false;
  bool txtUserName = true;
  bool isButtonActive = false;
  bool submit = false;

  final txtUserPasswordController = TextEditingController();
  final txtUserNameController = TextEditingController();

  UserRepository userRepository = UserRepository();
  bool isLoading = false;

  bool isPassFilled() {
    if (txtUserPasswordController.text != "" &&
        txtUserNameController.text != "")
      return true;
    else
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
        body: isLoading
            ? loadingIndicator()
            : Column(children: [
          Container(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
              width: MediaQuery.of(context).size.width,
              child: Text("LOGIN",
                  textAlign: TextAlign.center, style: TextStyle(fontSize: 25))),
          SizedBox(height: 8),
          Container(
              padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
              child: Column(children: [
                Container(
                  child: TextFormField(
                      controller: txtUserNameController,
                      decoration: InputDecoration(
                        labelText: 'UserID',
                        border: OutlineInputBorder(),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.blue),
                        ),
                        labelStyle: TextStyle(
                          color: Colors.black,
                        ),
                      )),
                ),
                SizedBox(height: 28),
                Container(
                    child: TextFormField(
                        obscureText: !showUserPassword,
                        controller: txtUserPasswordController,
                        decoration: InputDecoration(
                            labelText: 'UserPassword',
                            labelStyle: TextStyle(
                              color: Colors.black,
                            ),
                            border: OutlineInputBorder(),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.blue),
                            ),
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
                        })),
                SizedBox(height: 10),
                Container(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            child: Text("  I Forgot My Password !",
                                style: TextStyle(
                                  color: Colors.blue,
                                  // decoration: TextDecoration.underline,
                                  // decorationColor: Colors.yellow
                                )),
                            onTap: () => {
                              //Use for link to forgot my password page
                              Navigator.pushNamed(context, 'forgotPassword'),
                            })
                      ],
                    )),
                SizedBox(height: 30),
                Container(
                    margin: EdgeInsets.fromLTRB(50, 0, 55, 0),
                    width: 250,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        border: Border.all(color: Colors.grey)),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          disabledForegroundColor:
                          Colors.blue.withOpacity(0.38),
                          disabledBackgroundColor:
                          Colors.white.withOpacity(0.12)),
                      // style: ButtonStyle(
                      //     backgroundColor:
                      //         MaterialStatePropertyAll<Color>(Colors.blue)),
                      onPressed: buttonEnabled
                          ? () {

                        setState(() {
                          isLoading = true;
                        });

                        final payload = {
                          'username': txtUserNameController.text,
                          'password': txtUserPasswordController.text
                        };

                        //value = UserLoginResponse
                        userRepository.userLogin(payload).then((value) {
                          if(value.status == "success"){
                            setState(() {
                              Constant.userToken = value.token;
                            });
                            //Put the navigator place
                            Navigator.pushNamedAndRemoveUntil(context, 'homePage', (route) => false);
                          }
                        }).onError((error, stackTrace) {
                          showErrorDialog(context, error.toString());
                        }).whenComplete(() {
                          setState(() {
                            isLoading = false;
                          });
                        });

                      }
                          : null,
                      child:
                      Text("LOGIN", style: TextStyle(color: Colors.black)),
                    )),
                SizedBox(height: 20),
                Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Not have an account ? "),
                          InkWell(
                              child: Text("Sign Up Here.",
                                  style: TextStyle(color: Colors.blue)),
                              onTap: () => {
                                //Use for link to Sign Up page
                                Navigator.pushNamed(context, 'register'),
                              })
                        ])),
              ]))
        ]));
  }
}
