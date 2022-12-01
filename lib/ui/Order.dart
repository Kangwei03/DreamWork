import 'package:dreamwork/response/ProductResponse.dart';
import 'package:dreamwork/response/ProductResponse.dart';
import 'package:dreamwork/ui/OrderItem.dart';
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

  //declare variable
  List<ProductResponse> ProductList = List.empty(growable: true);

  @override
  void initState() {
    super.initState();
    initView();
  }

  void initView() async {
    //call api to retrieve user details
    //get value and put into gender
    ProductResponse productResponse = ProductResponse(1, DateTime(2022, 11, 23),
        DateTime(2022, 11, 24), "Apple", "Assets/product1.png", 25, 1, 1, 1, 2.5);
    ProductList.add(productResponse);
    //array list to store data
    ProductList.addAll([
      ProductResponse(1, DateTime(2022, 11, 23), DateTime(2022, 11, 24),
          "Creatine Monohydrate \n Powder", "Assets/product1.png", 25, 1, 1, 1, 2.5),
      ProductResponse(2, DateTime(2022, 11, 23), DateTime(2022, 11, 24),
          "Lean Protein Bar", "Assets/product2.png", 25, 1, 2, 2, 15),
      ProductResponse(3, DateTime(2022, 11, 23), DateTime(2022, 11, 24),
          "Chunky Peanut Butter", "Assets/product3.png", 25, 1, 3, 3, 8),
      ProductResponse(4, DateTime(2022, 11, 23), DateTime(2022, 11, 24),
          "100% Instant Oats", "Assets/product4.png", 25, 1, 3, 4, 1),
    ]);
  }

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
              Column(
                children: ProductList.map((product) {
                  //() is the thing that need to pass in
                  return OrderItem(product: product,title: 'Order');
                }).toList(),
              ),
            ],
          ),
        )));
  }
}
