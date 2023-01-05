import 'package:dreamwork/Constant.dart';
import 'package:dreamwork/model/addToCartModel.dart';
import 'package:dreamwork/repository/AddToCartRepository.dart';
import 'package:dreamwork/response/ProductResponse.dart';
import 'package:flutter/material.dart';
import 'package:quantity_input/quantity_input.dart';

import '../model/addToCartDB.dart';

class OrderItem extends StatefulWidget {
  final ProductResponse product;
  final String title;
  const OrderItem({Key? key, required this.product, required this.title})
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
                                    child: Text(widget.product.weight.toString() + "kg",
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
                                        "RM " + widget.product.price.toString(),
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
                            onChanged: (value) => setState(() => _itemCount =
                                int.parse(value.replaceAll(',', ''))),
                          ),
                        ),
                        Expanded(
                            flex: 8,
                            child: IconButton(
                              icon: Icon(shopping_cart),
                              onPressed: () {

                                final payload = {
                                  // 'product_id': widget.product.product_id,
                                  'quantity': _itemCount,
                                };
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
