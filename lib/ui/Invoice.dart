import 'package:flutter/material.dart';

class Invoice extends StatefulWidget {
  const Invoice({Key? key}) : super(key: key);

  @override
  State<Invoice> createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  final txtUserIdController = TextEditingController();
  final txtAddressController = TextEditingController();
  final txtDateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: Container(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("Dream Work",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ],
          )),
        ),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 30, 20, 20),
              width: MediaQuery.of(context).size.width,
              child: Text("Invoice",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  )),
            ),
            SizedBox(height: 28),
            Container(
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                  readOnly: true,
                  controller: txtUserIdController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.person_outlined),
                    labelText: 'User Id',
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
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                  maxLines: 3,
                  readOnly: true,
                  controller: txtAddressController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.location_city_outlined),
                    labelText: 'Address',
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
              padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: TextFormField(
                  readOnly: true,
                  controller: txtDateController,
                  decoration: InputDecoration(
                    icon: Icon(Icons.calendar_month),
                    labelText: 'Order Date',
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
                padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                child: Text("Product",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ))),
            SizedBox(height: 13),
            Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                margin: EdgeInsets.fromLTRB(3, 0, 3, 0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    border: Border(
                  top: BorderSide(color: Colors.black),
                  bottom: BorderSide(color: Colors.black),
                )),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 6,
                              child: Image.asset("Assets/product1.png")),
                          Expanded(
                              flex: 20,
                              child: Column(
                                children: [
                                  Text("Creatine Monohydrate \n Powder",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            child: Text("  Unit Price : ",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                )),
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 8, 0, 10),
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
                                                  child: Text("RM 15",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10)),
                                                ),
                                              )),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text("Quantity :",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                )),
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 8, 0, 10),
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
                                                  child: Text("2",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10)),
                                                ),
                                              )),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(" Sub Total : ",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                )),
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 8, 0, 10),
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
                                                  child: Text("RM 30",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10)),
                                                ),
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              )),
                        ],
                      ),
                    ),
                    SizedBox(height: 28),
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 6,
                              child: Image.asset("Assets/product2.png")),
                          Expanded(
                              flex: 20,
                              child: Column(
                                children: [
                                  Text("Lean Protein \n Bar",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  SizedBox(height: 15),
                                  Row(
                                    children: [
                                      Column(
                                        children: [
                                          Container(
                                            child: Text("  Unit Price : ",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                )),
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 8, 0, 10),
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
                                                  child: Text("RM 15",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10)),
                                                ),
                                              )),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text("Quantity :",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                )),
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 8, 0, 10),
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
                                                  child: Text("2",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10)),
                                                ),
                                              )),
                                        ],
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                            padding: EdgeInsets.fromLTRB(
                                                10, 0, 0, 0),
                                            child: Text(" Sub Total : ",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                )),
                                          ),
                                          SizedBox(height: 5),
                                          Container(
                                              alignment: Alignment.topLeft,
                                              margin: EdgeInsets.fromLTRB(
                                                  0, 8, 0, 10),
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
                                                  child: Text("RM 30",
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 10)),
                                                ),
                                              )),
                                        ],
                                      )
                                    ],
                                  ),
                                  SizedBox(height: 28),
                                ],
                              )),
                        ],
                      ),
                    )
                  ],
                )),
            Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.black)
                  ),
                ),
                child: Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(10,20,0,15),
                      child: Text("SUMMARY",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ))
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10,10,0,0),
                          child: Text("Sub Total : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                        ),
                      Container(
                        width: 280,
                        child: Text("RM 30",
                        textAlign: TextAlign.end)
                      )
                      ],
                    ),
                    SizedBox(height: 18),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10,10,0,10),
                          child: Text("Delivery Fee : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0,0,27,0),
                            width: 280,
                            child: Text("RM 4",
                                textAlign: TextAlign.end)
                        )
                      ],
                    ),
                    SizedBox(height: 18),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(10,0,0,10),
                          child: Text("Total : ",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 15,
                              )),
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(40,0,22,0),
                            width: 330,
                            child: Text("RM 34",
                                textAlign: TextAlign.end)
                        ),
                      ],
                    ),
                    SizedBox(height: 18),
                  ],
                )),
            SizedBox(height: 28),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.fromLTRB(40,0,15,20),
              margin: EdgeInsets.fromLTRB(40,0,25,10),
              child: Row(
                children: [
                  Container(
                    width: 100,
                    height: 50,
                      margin: EdgeInsets.fromLTRB(0,0,10,0),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: TextButton(
                      onPressed: (){},
                      child: Text("Proceed",
                      style: TextStyle(
                        color: Colors.black,
                      ))
                    )
                  ),
                  Container(
                      margin: EdgeInsets.fromLTRB(15,0,0,0),
                    width: 100,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black),
                    ),
                    child: TextButton(
                      onPressed: (){},
                      child: Text("Print",
                      style: TextStyle(
                        color: Colors.black
                      ))
                    )
                  ),
                ],
              ),
            )
          ],
        )));
  }
}
