import 'package:dreamwork/response/CheckOutResponse.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../response/UserPoints.dart';

class Payment extends StatefulWidget {
  final List<CheckOutResponse> checkoutList;
  const Payment({Key? key, required this.checkoutList}) : super(key: key);

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

  //Default drop down value is nothing.
  String? dropDownValue;

  //The value in the drop down box.
  var items = [
    'Public Bank',
    'Maybank',
    'CIMB Bank',
    'Citi Bank',
    'Hong Leong Bank'
  ];

  //To build a array to store the data get from API
  List<CheckOutResponse> checkOutList = List.empty(growable: true);
  late CheckOutResponse checkOutResponse;

  double totalPrice = 0;
  double total = 0;

  void initView() async {
    checkOutList.addAll(widget.checkoutList);
    double totalSub = 0;

    //Function to calculate the Sub total.
    for (int i = 0; i < checkOutList.length; i++) {
      totalSub += checkOutList[i].price * checkOutList[i].quantity;
    }


    setState(() {
      totalPrice = totalSub;
      total = totalSub + 4;
    });
  }

  void initState() {
    super.initState();
    initView();
  }

  //Same as looping
  Widget buildPayment(CheckOutResponse checkOut) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
        child: Container(
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(color: Colors.black12))),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 5),
                        child: Text(checkOut.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                            ))),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 15, 0),
                      child: Text("RM " + checkOut.price.toString(),
                          textAlign: TextAlign.end,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          )),
                    ),
                  )
                ],
              ),
              SizedBox(height: 4),
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child: Text("Quantity : ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ))),
                  Container(
                      padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: Text("x" + checkOut.quantity.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 13,
                          )))
                ],
              ),
              SizedBox(height: 20),
            ],
          ),
        ));
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
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Card(
                          elevation: 15,
                          child: Column(
                            children: [
                              if (checkOutList.isNotEmpty)
                                Column(
                                    children: checkOutList
                                        .map((checkOut) =>
                                            buildPayment(checkOut))
                                        .toList()),
                              Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 10, 0, 0),
                                          child: Text("Sub Total : ",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 15, 0),
                                            child: Text("RM " + totalPrice.toString(),
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                ))),
                                      )
                                    ],
                                  )),
                              Container(
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(10, 10, 0, 5),
                                          child: Text("Delivery Fees : ",
                                              style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold,
                                              )),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Container(
                                            padding: EdgeInsets.fromLTRB(
                                                0, 0, 15, 0),
                                            child: Text("RM 4.0",
                                                textAlign: TextAlign.end,
                                                style: TextStyle(
                                                  fontSize: 13,
                                                  fontWeight: FontWeight.bold,
                                                ))),
                                      )
                                    ],
                                  )),
                              Row(
                                children: [
                                  Expanded(
                                    flex: 18,
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(10, 8, 0, 0),
                                      child: Text("Total :",
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          )),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 10,
                                      child: Container(
                                          padding:
                                              EdgeInsets.fromLTRB(0, 0, 15, 0),
                                          child: Text("RM " + total.toString(),
                                              textAlign: TextAlign.end,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ))))
                                ],
                              ),
                              SizedBox(height: 28),
                            ],
                          )),
                    ),
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
                                      width: MediaQuery.of(context).size.width,
                                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                      decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black)),
                                      child: DropdownButtonFormField(
                                        decoration: InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.black))),
                                        value: dropDownValue,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropDownValue = newValue!;
                                          });
                                        },
                                      )),
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
                                          onPressed: () {
                                            Navigator.pushNamed(
                                                context, "invoice");
                                          },
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
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
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
                                    maxLength: 19,
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
                                          borderSide:
                                              BorderSide(color: Colors.blue),
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
                                    ],
                                  ),
                                ),
                                SizedBox(height: 28),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
                                    padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: TextButton(
                                        onPressed: () {
                                          Navigator.pushNamed(
                                              context, "invoice");
                                        },
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
