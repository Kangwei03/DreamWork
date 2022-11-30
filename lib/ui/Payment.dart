import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String? paymentMethod;

  Widget paymentDetailsContainer() {
    if (paymentMethod == "onlineBanking") {
      return Container(
        child: Text("Online banking section"),
      );
    } else if (paymentMethod == "eWallet") {
      return Container(
        child: Text("E-wallet section"),
      );
    }
    return Container();
  }

  final txtIdController = TextEditingController();
  final txtPasswordController = TextEditingController();
  final txtNameController = TextEditingController();
  final txtCardNumberController = TextEditingController();
  final txtCvvController = TextEditingController();

  bool buttonEnabled = false;
  bool showUserPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("DreamWork",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            )),
        body: SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text("PAYMENT",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    SizedBox(height: 20),
                    Text("All transactions are secure and encrypted.",
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    SizedBox(height: 10),
                    Text("Select Payment Method For Further Payment."),
                    SizedBox(height: 20),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: RadioListTile(
                                      title: Text("Online Banking"),
                                      value: "onlineBanking",
                                      groupValue: paymentMethod,
                                      onChanged: (value) {
                                        setState(() {
                                          paymentMethod = value.toString();
                                        });
                                      }),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Image.asset("Assets/payment1.png"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 18),
                          if (paymentMethod == "onlineBanking")
                            Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 18),
                              child: Column(
                                children: [
                                  Text("Online Banking",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 10),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: TextFormField(
                                        controller: txtIdController,
                                        decoration: InputDecoration(
                                          labelText: 'UserId',
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.blue),
                                          ),
                                          labelStyle: TextStyle(
                                            color: Colors.black,
                                          ),
                                        )),
                                  ),
                                  SizedBox(height: 10),
                                  Container(
                                    padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    child: TextFormField(
                                        obscureText: !showUserPassword,
                                        controller: txtPasswordController,
                                        decoration: InputDecoration(
                                            labelText: 'UserPassword',
                                            border: OutlineInputBorder(),
                                            focusedBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.blue),
                                            ),
                                            labelStyle: TextStyle(
                                              color: Colors.black,
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
                                                    showUserPassword =
                                                        !showUserPassword;
                                                  });
                                                }))),
                                  ),
                                  SizedBox(height: 28),
                                  Container(
                                      margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                      padding:
                                          EdgeInsets.fromLTRB(10, 0, 10, 0),
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        border: Border.all(color: Colors.black),
                                      ),
                                      child: TextButton(
                                          onPressed: () {},
                                          child: Text("Proceed",
                                              style: TextStyle(
                                                  color: Colors.white))))
                                ],
                              ),
                            ),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: RadioListTile(
                                      title: Text("E-Wallet"),
                                      value: "eWallet",
                                      groupValue: paymentMethod,
                                      onChanged: (value) {
                                        setState(() {
                                          paymentMethod = value.toString();
                                        });
                                      }),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Image.asset("Assets/payment2.png")),
                              ],
                            ),
                          ),
                          SizedBox(height: 18),
                          if (paymentMethod == "eWallet")
                            Container(
                              child: Text("E-wallet section",
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                              )),
                            ),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 8,
                                  child: RadioListTile(
                                      title: Text("Credit Card"),
                                      value: "creditCard",
                                      groupValue: paymentMethod,
                                      onChanged: (value) {
                                        setState(() {
                                          paymentMethod = value.toString();
                                        });
                                      }),
                                ),
                                Expanded(
                                    flex: 3,
                                    child: Image.asset("Assets/payment3.png"))
                              ],
                            ),
                          ),
                          SizedBox(height: 18),
                          if (paymentMethod == "creditCard")
                            Container(
                                child: Column(
                              children: [
                                Text("Credit Card",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                SizedBox(height: 8),
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: TextFormField(
                                      controller: txtNameController,
                                      decoration: InputDecoration(
                                        labelText: 'Card Holder Name',
                                        border: OutlineInputBorder(),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.blue),
                                        ),
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                      )),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: TextFormField(
                                    controller: txtCardNumberController,
                                    decoration: InputDecoration(
                                      labelText: 'Card Number',
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8),
                                Container(
                                  padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                  child: TextFormField(
                                      obscureText: !showUserPassword,
                                      controller: txtCvvController,
                                      decoration: InputDecoration(
                                          labelText: 'CVV Number',
                                          border: OutlineInputBorder(),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.blue),
                                          ),
                                          labelStyle: TextStyle(
                                            color: Colors.black,
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
                                                  showUserPassword =
                                                  !showUserPassword;
                                                });
                                              })),
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly,
                                    ],),
                                ),
                                SizedBox(height: 28),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    padding:
                                    EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: TextButton(
                                        onPressed: () {},
                                        child: Text("Proceed",
                                            style: TextStyle(
                                                color: Colors.white)))),
                                SizedBox(height: 40)
                              ],
                            ))
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
