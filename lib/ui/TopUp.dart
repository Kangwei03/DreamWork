import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TopUp extends StatefulWidget {
  const TopUp({Key? key}) : super(key: key);

  @override
  State<TopUp> createState() => _TopUpState();
}

class _TopUpState extends State<TopUp> {
  final txtAmountController = TextEditingController();

  double points = 0;

  void calCredit(String enteredValue){
    if(enteredValue.isEmpty){
      setState(() {
        points = 0;
      });
    }else{
      double amount = double.parse(txtAmountController.text);
      setState(() {
        points = amount * 0.1;
      });
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
              children: [
                Text("DreamWork",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ))
              ],
            )),
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.fromLTRB(0, 15, 0, 15),
            child: Text("Top Up",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
          ),
          SizedBox(height: 20),
          Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(70, 0, 0, 0),
              child: Text("RM 10 equals to 1 credit.",
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: Colors.red,
                  ))),
          SizedBox(height: 8),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: TextFormField(
              onChanged: calCredit,
                controller: txtAmountController,
                decoration: InputDecoration(
                  icon: Icon(Icons.search),
                  labelText: 'Enter Top Up Amount (RM)',
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue),
                  ),
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ]),
          ),
          SizedBox(height: 8),
          Container(
            child: Text("Credit that you can get is $points points.")
          ),
          SizedBox(height: 28),
              Container(
                padding: EdgeInsets.fromLTRB(30,0,0,0),
                child: Text("Package That We Offered.",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ))
              ),
              SizedBox(height: 15),
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 150,
                          height: 80,
                          margin: EdgeInsets.fromLTRB(60,15,0,15),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.black),
                            color: Colors.white,
                          ),
                          child: TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, "payment");
                            },
                            child: Text("RM100 gets \n 10 credits.",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                            ))
                          )
                        ),
                        Container(
                            width: 150,
                            height: 80,
                            margin: EdgeInsets.fromLTRB(10,15,0,15),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Colors.white,
                            ),
                            child: TextButton(
                                onPressed: (){
                                  Navigator.pushNamed(context, "payment");
                                },
                                child: Text("RM200 gets \n 22 credits.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.black,
                                    ))
                            )
                        )
                      ],
                    ),
                    Container(
                        width: 150,
                        height: 80,
                        margin: EdgeInsets.fromLTRB(25,15,0,15),
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.white,
                        ),
                        child: TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, "payment");
                            },
                            child: Text("RM500 gets \n 60 credits.",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                ))
                        )
                    ),
                    SizedBox(height: 30),
                    Container(
                      margin: EdgeInsets.fromLTRB(25,0,0,0),
                      width: 140,
                      height: 60,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                        child: TextButton(
                            onPressed: (){
                              Navigator.pushNamed(context, "payment");
                            },
                            child: Text("Proceed",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,
                            ))
                        )
                    )
                  ],
                )
              )
        ])));
  }
}
