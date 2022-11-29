import 'package:flutter/material.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({Key? key}) : super(key: key);

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {

  static const IconData shopping_bag_outlined = IconData(0xf37d, fontFamily: 'MaterialIcons');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
          actions:[
            IconButton(
              icon: Icon(shopping_bag_outlined),
              padding: EdgeInsets.only(right: 10.0),
              onPressed: (){
                Navigator.pushNamed(context, "order");
              },
            )
          ],
        title: Text("DreamWork",
        style: TextStyle(
          color: Colors.white,

        ))
      ),
      body: Container(),
    );
  }
}
