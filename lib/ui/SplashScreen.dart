import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();

    asyncFunction();
  }

//put async is because got operation that need to be wait
  void asyncFunction() async{
    await Future.delayed(Duration(seconds: 3)).then((value) {
      Navigator.popAndPushNamed(context, 'login');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black87,
        body: Container(
            width: MediaQuery.of(context).size.width,
            height: 800,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
              Container(
                child: Image.asset("Assets/dream2.png",
                     ),
              ),
              SizedBox(height: 10),
              Container(
                  child: Text(
                      "DREAM WORK",
                      style: TextStyle(
                          fontSize: 80,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      textAlign: TextAlign.center,
                    ),
                  )
            ])));
  }
}
