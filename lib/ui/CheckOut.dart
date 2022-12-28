import 'package:dreamwork/model/addToCartDB.dart';
import 'package:dreamwork/response/CheckOut.dart';
import 'package:flutter/material.dart';

import '../model/addToCartModel.dart';

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

  //To build a array to store data in API
  List<AddToCart> addToCartList = [];
  List<CheckOutResponse> checkOutList =
  List.empty(growable: true);
  late CheckOutResponse checkOutResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initView();

    //Function to calculate the product sub total price.
    setState(() {
      price1 = product1.toDouble() * 150.00;
      price2 = product2.toDouble() * 235.00;
      price3 = product3.toDouble() * 25.00;
      price4 = product4.toDouble() * 90.00;

      //Function to calculate the totalPrice.
      totalPrice = price1 + price2 + price3 + price4;
    });

  }

  void initView() async {
    await DbManager.db.getAddToCart().then((value) {
      setState(() {
        addToCartList = value;
      });
      print(addToCartList);
    });

    checkOutList.addAll([
      CheckOutResponse("Creatine Monohydrate Powder", "Assets/product1.png", 3, 150, 450),
      CheckOutResponse("Lean Protein Bar", "Assets/product2.png", 2, 235, 470),
    ]);


  }

  //Same as looping.
  Widget buildCheckOut(CheckOutResponse checkOut){
    return Container(
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
            Expanded(child: Image.asset(checkOut.image_url)),
            Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(checkOut.productName,
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
                                      child: Text(checkOut.amount.toString(),
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
                                      child: Text(checkOut.price.toString(),
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
                            Text("RM " + checkOut.totalPrice.toString(),
                                style: TextStyle(
                                  fontSize: 18,
                                )),
                          ],
                        )
                    )
                  ],
                )),
          ],
        ));
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
            //The ways to do mapping
            if(checkOutList.isNotEmpty)
              Column(
                children: checkOutList.map((checkOut) => buildCheckOut(checkOut)).toList()
            ),
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
                             Navigator.pushNamed(context, "payment", arguments: checkOutList);
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
