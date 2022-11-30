import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  String? paymentMethod;
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
                                    child: Image.asset("Assets/product1.png"),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 18),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
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
                          SizedBox(height: 18),
                          Container(
                            margin: EdgeInsets.fromLTRB(20, 10, 20, 0),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                            ),
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
                        ],
                      ),
                    )
                  ],
                ))));
  }
}
