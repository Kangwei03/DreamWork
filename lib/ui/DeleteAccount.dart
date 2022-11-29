import 'package:flutter/material.dart';

class DeleteAccount extends StatefulWidget {
  const DeleteAccount({Key? key}) : super(key: key);

  @override
  State<DeleteAccount> createState() => _DeleteAccountState();
}

class _DeleteAccountState extends State<DeleteAccount> {
  bool buttonEnabled = false;
  bool showUserPassword = false;

  String? confirm = "No";

  final txtPasswordController = TextEditingController();

  bool isPassFilled() {
    if (confirm == "Yes" && txtPasswordController.text != "") {
      return true;
    } else
      return false;
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
                Text(
                  "DreamWork",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            )),
        body: SingleChildScrollView(
          child: Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text("Delete Account",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
                  SizedBox(height: 28),
                  Container(
                    child: Column(
                      children:[
                        Text(
                        "Confirm To Delete Your Account.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold)),
                        SizedBox(height:10),
                        Text("You may inform that after deleted, \n the account will no longer exist."
                        ),
                        SizedBox(height:15),
                        Container(
                          width: 250,
                          child: Row(
                            children: [
                              Expanded(
                                flex: 10,
                                child: RadioListTile(
                                    title: Text("Yes"),
                                    value: "Yes",
                                    groupValue: confirm,
                                    onChanged: (value) {
                                      setState(() {
                                        confirm = value.toString();
                                      });
                                    }
                                ),
                              ),
                              Expanded(
                                flex: 9,
                                child: RadioListTile(
                                  title: Text("No"),
                                  value: "No",
                                  groupValue: confirm,
                                  onChanged: (value){
                                    setState(() {
                                      confirm = value.toString();
                                    });
                                  }
                                ),
                              )
                            ],
                          )
                        )
                      ],
                    )
                  ),
                  SizedBox(height: 10),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 0, 30, 0),
                    child: TextFormField(
                        controller: txtPasswordController,
                        obscureText: !showUserPassword,
                        decoration: InputDecoration(
                            icon: Icon(Icons.lock_outlined),
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
                        }),
                  ),
                  SizedBox(height: 28),
                  SizedBox(height: 38),
                  Container(
                      width: 150,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: MaterialButton(
                          disabledColor: Colors.white.withOpacity(0.38),
                          color: Colors.blue,
                          onPressed: buttonEnabled
                              ? () {
                              Navigator.pushNamedAndRemoveUntil(context, "login", (route) => false);
                                }
                              : null,
                          child: Text("Submit",
                              style: TextStyle(color: Colors.black)))),
                ],
              )),
        ));
  }
}
