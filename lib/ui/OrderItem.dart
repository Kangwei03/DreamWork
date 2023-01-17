import 'dart:math';

import 'package:dreamwork/Constant.dart';
import 'package:dreamwork/model/addToCartModel.dart';
import 'package:dreamwork/repository/AddToCartRepository.dart';
import 'package:dreamwork/response/ProductResponse.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:quantity_input/quantity_input.dart';

import '../model/addToCartDB.dart';

class OrderItem extends StatefulWidget {
  final ProductResponse product;
  final String title;
  final Function setLoader;
  const OrderItem(
      {Key? key,
      required this.product,
      required this.title,
      required this.setLoader})
      : super(key: key);

  @override
  State<OrderItem> createState() => _OrderItemState();
}

class _OrderItemState extends State<OrderItem> {
  static const IconData shopping_cart =
      IconData(0xe59c, fontFamily: 'MaterialIcons');
  int _itemCount = 0;

  List<AddToCart> addToCartList = [];

  AddToCartRepository addToCartRepository = AddToCartRepository();

  var f = NumberFormat("##.##", "en_US");

  bool buttonPress = false;

  void addToCart() {
    if (_itemCount != 0) {
      setState(() {
        buttonPress = true;
      });
      print("buttonPress to true");
    } else if (_itemCount == 0) {
      setState(() {
        buttonPress = false;
      });
      print("buttonPress to false");
    }
  }

  void initState() {
    super.initState();
    initView();
  }

  void initView() async {
    DbManager.db.getAddToCart().then((value) {
      setState(() {
        addToCartList = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 28),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            Expanded(
                child: Container(
              padding: EdgeInsets.all(10),
              //child: Image.asset(widget.product.image_url),
              child: Image.network(Constant.hostUrl + widget.product.image_url),
            )),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(widget.product.name,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      )),
                  SizedBox(height: 8),
                  Text(widget.product.description,
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
                                margin: EdgeInsets.fromLTRB(0, 8, 0, 10),
                                height: 40,
                                child: Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                        widget.product.weight.toString() +
                                            " KG",
                                        style: TextStyle(color: Colors.black)),
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
                                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                        "RM " +
                                            widget.product.price
                                                .toStringAsFixed(2),
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 10)),
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
                              value: _itemCount,
                              onChanged: (value) => {
                                    setState(
                                      () => _itemCount =
                                          int.parse(value.replaceAll(',', '')),
                                    ),
                                    setState(() {
                                      addToCart();
                                    })
                                  }),
                        ),
                        Expanded(
                            flex: 8,
                            child: IconButton(
                              icon: Icon(shopping_cart),
                              onPressed: () {
                                if (buttonPress) {
                                  widget.setLoader(true);
                                  final payload = {
                                    'id': widget.product.id,
                                    'quantity': _itemCount,
                                  };
                                  print(payload);
                                  Future.delayed(Duration(seconds: 1))
                                      .then((value) {
                                    widget.setLoader(false);

                                    setState(() {
                                      this._itemCount = 0;
                                    });
                                  });
                                } else if (!buttonPress) {
                                  showDialog(
                                    context: context,
                                    builder: (ctx) => AlertDialog(
                                      title: const Text(
                                          "Item added Unsuccessful",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      content: const Text(
                                          "At least one item must be added to cart."),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(ctx).pop();
                                          },
                                          child: Container(
                                            color: Colors.black,
                                            padding: const EdgeInsets.all(14),
                                            child: Text("OK",
                                                style: TextStyle(
                                                    color: Colors.white)),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                  print("unable to add");
                                }
                              },
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }
}
