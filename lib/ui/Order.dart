import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';

class Order extends StatefulWidget {
  const Order({Key? key}) : super(key: key);

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int product1 = 0;
  int product2 = 0;
  int product3 = 0;
  int product4 = 0;

  static const IconData shopping_cart =
      IconData(0xe59c, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.black,
            centerTitle: true,
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart),
                padding: EdgeInsets.only(right: 10.0),
                onPressed: () {
                  Navigator.pushNamed(context, "checkOut");
                },
              )
            ],
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("DreamWork", style: TextStyle(fontWeight: FontWeight.bold))
              ],
            )),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.fromLTRB(10, 20, 10, 10),
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Text("Product",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  )),
              Container(
                  width: MediaQuery.of(context).size.width,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        width: 80,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black),
                          color: Colors.black,
                        ),
                        child: TextButton(
                          onPressed: () {
                            print('clear');
                            setState(() {
                              product1 == 0;
                              product2 == 0;
                              product3 == 0;
                              product4 == 0;
                            });
                          },
                          child: Text("CLEAR",
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white)),
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 28),
              Container(
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
                            SizedBox(height: 8),
                            Text(
                                "Scientifically proven to boost your \n performance.",
                                style: TextStyle(
                                  fontSize: 12,
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
                                          margin:
                                              EdgeInsets.fromLTRB(0, 8, 0, 10),
                                          height: 40,
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                            ),
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text("250g",
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
                                          margin:
                                              EdgeInsets.fromLTRB(0, 8, 0, 10),
                                          height: 40,
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
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
                            Container(
                              width: double.infinity,
                              child: Text("   Quantity : ",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 18,
                                    child: QuantityInput(
                                      acceptsZero: true,
                                      buttonColor: Colors.black,
                                      inputWidth: 45,
                                      value: product1,
                                      onChanged: (value) => setState(() =>
                                          product1 = int.parse(
                                              value.replaceAll(',', ''))),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 8,
                                      child: IconButton(
                                        icon: Icon(shopping_cart),
                                        onPressed: () {},
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 28),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 8, child: Image.asset("Assets/product2.png")),
                      Expanded(
                        flex: 9,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Lean Protein Bar",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                            SizedBox(height: 8),
                            Text("Delicious high protein, low \n sugar snack.",
                                style: TextStyle(
                                  fontSize: 12,
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
                                          margin:
                                              EdgeInsets.fromLTRB(0, 8, 0, 10),
                                          height: 40,
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                            ),
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text("12 x 45g",
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
                                          margin:
                                              EdgeInsets.fromLTRB(0, 8, 0, 10),
                                          height: 40,
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
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
                            Container(
                              width: double.infinity,
                              child: Text("   Quantity : ",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 15,
                                    child: QuantityInput(
                                      acceptsZero: true,
                                      buttonColor: Colors.black,
                                      inputWidth: 45,
                                      value: product2,
                                      onChanged: (value) => setState(() =>
                                          product2 = int.parse(
                                              value.replaceAll(',', ''))),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 9,
                                      child: IconButton(
                                        icon: Icon(shopping_cart),
                                        onPressed: () {},
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 28),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 9, child: Image.asset("Assets/product3.png")),
                      Expanded(
                        flex: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("Chunky Peanut Butter",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                            SizedBox(height: 8),
                            Text(
                                "Healty Peanut butter with no\nsugar, salt and oil.",
                                style: TextStyle(
                                  fontSize: 12,
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
                                          margin:
                                              EdgeInsets.fromLTRB(0, 8, 0, 10),
                                          height: 40,
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                            ),
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text("380g",
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
                                          margin:
                                              EdgeInsets.fromLTRB(0, 8, 0, 10),
                                          height: 40,
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
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
                            Container(
                              width: double.infinity,
                              child: Text("   Quantity : ",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 18,
                                    child: QuantityInput(
                                      acceptsZero: true,
                                      buttonColor: Colors.black,
                                      inputWidth: 45,
                                      value: product3,
                                      onChanged: (value) => setState(() =>
                                          product3 = int.parse(
                                              value.replaceAll(',', ''))),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 11,
                                      child: IconButton(
                                        icon: Icon(shopping_cart),
                                        onPressed: () {},
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 28),
              Container(
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  child: Row(
                    children: [
                      Expanded(
                          flex: 9, child: Image.asset("Assets/product4.png")),
                      Expanded(
                        flex: 10,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("100% Instant Oats",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                )),
                            SizedBox(height: 8),
                            Text(
                                "Breakfast time sorted, with super\n -simple nutritious oats.",
                                style: TextStyle(
                                  fontSize: 12,
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
                                          margin:
                                              EdgeInsets.fromLTRB(0, 8, 0, 10),
                                          height: 40,
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
                                            ),
                                            child: TextButton(
                                              onPressed: () {},
                                              child: Text("1kg",
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
                                          margin:
                                              EdgeInsets.fromLTRB(0, 8, 0, 10),
                                          height: 40,
                                          child: Container(
                                            margin: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.black),
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
                            Container(
                              width: double.infinity,
                              child: Text("   Quantity : ",
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                  )),
                            ),
                            Container(
                              width: double.infinity,
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 18,
                                    child: QuantityInput(
                                      acceptsZero: true,
                                      buttonColor: Colors.black,
                                      inputWidth: 45,
                                      value: product4,
                                      onChanged: (value) => setState(() =>
                                          product4 = int.parse(
                                              value.replaceAll(',', ''))),
                                    ),
                                  ),
                                  Expanded(
                                      flex: 11,
                                      child: IconButton(
                                        icon: Icon(shopping_cart),
                                        onPressed: () {},
                                      ))
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  )),
              SizedBox(height: 28),
            ],
          ),
        )));
  }
}
