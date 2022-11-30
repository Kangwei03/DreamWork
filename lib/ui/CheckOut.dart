import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  static const IconData shopping_bag_outlined =
      IconData(0xf37d, fontFamily: 'MaterialIcons');

  //variable for product number
  int product1 = 3;
  int product2 = 2;
  int product3 = 4;
  int product4 = 1;

  //variable for calculate product total price
  double price1 = 0;
  double price2 = 0;
  double price3 = 0;
  double price4 = 0;

  //variable for calculate total amount before payment
  double totalPrice = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      price1 = product1.toDouble() * 150.00;
      price2 = product2.toDouble() * 235.00;
      price3 = product3.toDouble() * 25.00;
      price4 = product4.toDouble() * 90.00;

      totalPrice = price1 + price2 + price3 + price4;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(shopping_bag_outlined),
              padding: EdgeInsets.only(right: 10.0),
              onPressed: () {
                Navigator.pushNamed(context, "order");
              },
            )
          ],
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
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
            Text("Check Out",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(height: 28),
            Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(width: 1.5, color: Colors.black),
                  bottom: BorderSide(width: 1.5, color: Colors.black),
                )),
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Row(
                  children: [
                    Expanded(child: Image.asset("Assets/product1.png")),
                    Expanded(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("Creatine Monohydrate \n Powder",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            )),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    child: Text("   Amount : ",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        )),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.fromLTRB(0, 8, 0, 10),
                                      height: 40,
                                      child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text("$product1",
                                              style: TextStyle(
                                                  color: Colors.black)),
                                        ),
                                      )),
                                  SizedBox(height: 5),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  Container(
                                    width: double.infinity,
                                    child: Text("   Price : ",
                                        textAlign: TextAlign.left,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15,
                                        )),
                                  ),
                                  SizedBox(height: 5),
                                  Container(
                                      alignment: Alignment.topLeft,
                                      margin: EdgeInsets.fromLTRB(0, 8, 0, 10),
                                      height: 40,
                                      child: Container(
                                        margin:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        decoration: BoxDecoration(
                                          border:
                                              Border.all(color: Colors.black),
                                        ),
                                        child: TextButton(
                                          onPressed: () {},
                                          child: Text("RM 150.00",
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 10)),
                                        ),
                                      )),
                                  SizedBox(height: 5),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 28),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Text("Total : ",
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              )),
                              Text("RM $price1",
                              style: TextStyle(
                                fontSize: 18,
                              )),
                            ],
                          )
                        )
                      ],
                    )),
                  ],
                )),
            SizedBox(height: 28),
            Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.5, color: Colors.black),
                    )),
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Row(
                  children: [
                    Expanded(
                        flex: 9,
                        child: Image.asset("Assets/product2.png")),
                    Expanded(
                      flex: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Lean Protein\n Bar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: Text("   Amount : ",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            )),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                          alignment: Alignment.topLeft,
                                          margin: EdgeInsets.fromLTRB(0, 8, 0, 10),
                                          height: 40,
                                          child: Container(
                                            margin:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                            decoration: BoxDecoration(
                                              border:
                                              Border.all(color: Colors.black),
                                            ),
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text("$product2",
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                            ),
                                          )),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: Text("   Price : ",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            )),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                          alignment: Alignment.topLeft,
                                          margin: EdgeInsets.fromLTRB(0, 8, 0, 10),
                                          height: 40,
                                          child: Container(
                                            margin:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                            decoration: BoxDecoration(
                                              border:
                                              Border.all(color: Colors.black),
                                            ),
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text("RM 235.00",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10)),
                                            ),
                                          )),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 28),
                            Container(
                              padding: EdgeInsets.fromLTRB(10,0,0,0),
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text("Total : ",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        )),
                                    Text("RM $price2",
                                        style: TextStyle(
                                          fontSize: 18,
                                        )),
                                  ],
                                )
                            )
                          ],
                        )),
                  ],
                )),
            SizedBox(height: 28),
            Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.5, color: Colors.black),
                    )),
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Row(
                  children: [
                    Expanded(child: Image.asset("Assets/product3.png")),
                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Chunky Peanut \n Butter",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: Text("   Amount : ",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            )),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                          alignment: Alignment.topLeft,
                                          margin: EdgeInsets.fromLTRB(0, 8, 0, 10),
                                          height: 40,
                                          child: Container(
                                            margin:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                            decoration: BoxDecoration(
                                              border:
                                              Border.all(color: Colors.black),
                                            ),
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text("$product3",
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                            ),
                                          )),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: Text("   Price : ",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            )),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                          alignment: Alignment.topLeft,
                                          margin: EdgeInsets.fromLTRB(0, 8, 0, 10),
                                          height: 40,
                                          child: Container(
                                            margin:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                            decoration: BoxDecoration(
                                              border:
                                              Border.all(color: Colors.black),
                                            ),
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text("RM 25.00",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10)),
                                            ),
                                          )),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 28),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text("Total : ",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        )),
                                    Text("RM $price3",
                                        style: TextStyle(
                                          fontSize: 18,
                                        )),
                                  ],
                                )
                            )
                          ],
                        )),
                  ],
                )),
            SizedBox(height: 28),
            Container(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1.5, color: Colors.black),
                    )),
                width: MediaQuery.of(context).size.width,
                height: 250,
                child: Row(
                  children: [
                    Expanded(child: Image.asset("Assets/product4.png")),
                    Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("100% Instant Oats\n",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: Text("   Amount : ",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            )),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                          alignment: Alignment.topLeft,
                                          margin: EdgeInsets.fromLTRB(0, 8, 0, 10),
                                          height: 40,
                                          child: Container(
                                            margin:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                            decoration: BoxDecoration(
                                              border:
                                              Border.all(color: Colors.black),
                                            ),
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text("$product4",
                                                  style: TextStyle(
                                                      color: Colors.black)),
                                            ),
                                          )),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        width: double.infinity,
                                        child: Text("   Price : ",
                                            textAlign: TextAlign.left,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            )),
                                      ),
                                      SizedBox(height: 5),
                                      Container(
                                          alignment: Alignment.topLeft,
                                          margin: EdgeInsets.fromLTRB(0, 8, 0, 10),
                                          height: 40,
                                          child: Container(
                                            margin:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                            decoration: BoxDecoration(
                                              border:
                                              Border.all(color: Colors.black),
                                            ),
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text("RM 90.00",
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 10)),
                                            ),
                                          )),
                                      SizedBox(height: 5),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 28),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  children: [
                                    Text("Total : ",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        )),
                                    Text("RM $price4",
                                        style: TextStyle(
                                          fontSize: 18,
                                        )),
                                  ],
                                )
                            ),
                          ],
                        )),
                  ],
                )),
            SizedBox(height: 28),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(0,0,10,0),
              child: Row(
                children: [
                  Expanded(
                    flex: 10,
                    child: Row(children: [
                      Text("Total :   RM $totalPrice",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],),
                  ),
                 Expanded(
                   flex: 6,
                   child:  Container(
                     margin: EdgeInsets.fromLTRB(10,0,10,0),
                     height: 50,
                     decoration: BoxDecoration(
                       border: Border.all(color: Colors.black)
                     ),
                       width: MediaQuery.of(context).size.width,
                       child: TextButton(
                           onPressed: (){
                             Navigator.pushNamed(context, "payment");
                           },
                           child: Text("Proceed",
                               textAlign: TextAlign.center,
                               style: TextStyle(
                                 fontSize: 15,
                                 color: Colors.blue,
                               ))
                       )
                   )
                 )
                ],
              )
            )

          ],
        ),
      )),
    );
  }
}
