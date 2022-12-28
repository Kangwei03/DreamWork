import 'package:dreamwork/repository/ProductRepository.dart';
import 'package:dreamwork/repository/UserRepository.dart';
import 'package:dreamwork/response/ProductResponse.dart';
import 'package:dreamwork/response/ProductResponse.dart';
import 'package:dreamwork/ui/OrderItem.dart';
import 'package:dreamwork/util/Widgets.dart';
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

  //To build the array to store the data that get from API.
  List<ProductResponse> ProductList = List.empty(growable: true);

  ProductRepository productRepository = ProductRepository();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    initView();
  }

  void initView() async {
    setState(() {
      isLoading = true;
    });

    await productRepository.product().then((value) {
      ProductList.clear();
      ProductList.addAll(value);
    }).onError((error, stackTrace) => showErrorDialog(context, error.toString()))
    .whenComplete(() {
      setState(() {
       isLoading = false;
      });
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
              children: const [
                Text("DreamWork", style: TextStyle(fontWeight: FontWeight.bold))
              ],
            )),
        body: isLoading
            ? loadingIndicator()
            : SingleChildScrollView(
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
                        return OrderItem(product: product, title: 'Order');
                      }).toList(),
                    ),
                  ],
                ),
              )));
  }
}
