import 'package:dreamwork/repository/UserRepository.dart';
import 'package:dreamwork/response/BodyMeasurementResponse.dart';
import 'package:dreamwork/util/Widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class BodyMeasure extends StatefulWidget {
  const BodyMeasure({Key? key}) : super(key: key);

  @override
  State<BodyMeasure> createState() => _BodyMeasureState();
}

class _BodyMeasureState extends State<BodyMeasure> {
  //Controller
  final txtWeightController = TextEditingController();
  final txtHeightController = TextEditingController();
  final txtShoulderController = TextEditingController();
  final txtArmController = TextEditingController();
  final txtChestController = TextEditingController();
  final txtWaistController = TextEditingController();
  final txtHipController = TextEditingController();
  final txtTightController = TextEditingController();
  final txtCalfController = TextEditingController();

  //Declaring the response
  BodyMeasurementResponse bodyMeasurementResponse = BodyMeasurementResponse.defaultEmpty();

  //To build a array to store data that get from API
  List<BodyMeasurementResponse> bodyMeasurementList =
      List.empty(growable: true);
  List<BodyMeasurementResponse> getBodyMeasurementList =
      List.empty(growable: true);


  //Function in API
  UserRepository userRepository = UserRepository();
  bool isLoading = false;

  bool buttonEnabled = false;
  String gender = 'others';
  double bmi = 0;

  //Number Format in 1 decimal places.
  var f = NumberFormat("##.#", "en_US");

  //Function to check either value height and weight has been filled in or not.
  bool isPassFilled() {
    if (txtHeightController.text != "" && txtWeightController.text != "") {
      return true;
    } else {
      return false;
    }
  }

  //same as main function, when open this page, it will run at the first time.
  void initState() {
    super.initState();
    initView();
    setState(() {
      buttonEnabled = false;
    });
  }

  void initView() async {
    //call api to retrieve user details
    // //get value and put into gender
    // bodyMeasurementResponse = BodyMeasurementResponse(
    //     1, "2022-11-23", 75, 155, 15, 15, 15, 15, 15, 15, 15, 31.2);
    // bodyMeasurementList.add(BodyMeasurementResponse(
    //     1, "2022-11-23", 75, 155, 15, 15, 15, 15, 15, 15, 15, 31.2));
    // setState(() {
    //   txtHeightController.text = f.format(bodyMeasurementResponse.height);
    //   txtWeightController.text = f.format(bodyMeasurementResponse.weight);
    //   bmi = calBmi();
    // });

    setState(() {
      isLoading = true;
    });

    await userRepository
        .getBodyMeasurement()
        .then((value) {
          getBodyMeasurementList.clear();
          getBodyMeasurementList.addAll(value);

          //Check whether the date is today or not, if yes then pass the value
          //into the controller.
          for(BodyMeasurementResponse e in value){
            DateTime createdDateTime = DateTime.parse(e.created_at);
            DateTime currentDateTime = DateTime.now();
            print(createdDateTime);
            if(createdDateTime.year == currentDateTime.year
                && createdDateTime.month == currentDateTime.month
                && createdDateTime.day == currentDateTime.day){
              bodyMeasurementResponse = e;
              print(e);
            }
          }
        })
        .onError(
            (error, stackTrace) => showErrorDialog(context, error.toString()))
        .whenComplete(() {
          setState(() {
            isLoading = false;
          });
        });

    setState(() {
      if(bodyMeasurementResponse != BodyMeasurementResponse.defaultEmpty()){
        //Compulsory data
        txtHeightController.text = f.format(bodyMeasurementResponse.height);
        txtWeightController.text = f.format(bodyMeasurementResponse.weight);

        //Not compulsory data
        txtShoulderController.text = f.format(bodyMeasurementResponse.shoulder);
        txtArmController.text = f.format(bodyMeasurementResponse.arm);
        txtChestController.text = f.format(bodyMeasurementResponse.chest);
        txtWaistController.text = f.format(bodyMeasurementResponse.waist);
        txtHipController.text = f.format(bodyMeasurementResponse.hip);
        txtTightController.text = f.format(bodyMeasurementResponse.tight);
        txtCalfController.text = f.format(bodyMeasurementResponse.calf);

        bmi = calBmi();
      }
    });
  }

  //Function to calculate BMI
  double calBmi() {
    double a1 = double.parse(txtWeightController.text);
    double a2 = double.parse(txtHeightController.text);
    double result;

    result = ((a1 / (a2 * a2)) * 10000);

    return result;
  }

  //Function show the BMI status
  Widget bmiStatusText() {
    String bmiStatus = "";

    if (bmi <= 18.5 && bmi > 0) {
      bmiStatus = "UnderWeight";
    } else if (bmi <= 25 && bmi > 18.5) {
      bmiStatus = "Healthy";
    } else if (bmi > 25) {
      bmiStatus = "Obesity";
    }

    return Text("BMI status is $bmiStatus");
  }

  //Function to change the photo, either male, female or others.
  Widget photoDisplay() {
    if (gender == "male") {
      return Image.asset("Assets/bodymen.png");
    } else if (gender == "female") {
      return Image.asset("Assets/bodygirl.png");
    } else {
      return Image.asset("Assets/bodyothers.png");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: const [
              Text("DreamWork", style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "bodyHistory");
                },
                child: Icon(
                  Icons.history, // add custom icons also
                ),
              ),
            )
          ],
        ),
        body: isLoading
            ? loadingIndicator()
            : SingleChildScrollView(
                child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(30, 30, 30, 0),
                      width: MediaQuery.of(context).size.width,
                      child: Text("BODY",
                          textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 25))),
                  SizedBox(height: 5),
                  Container(
                      padding: EdgeInsets.fromLTRB(15, 15, 20, 0),
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                              flex: 8,
                              child: Image.asset("Assets/body.png",
                                  alignment: Alignment.topLeft)),
                          Expanded(
                            flex: 12,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.fromLTRB(8, 8, 8, 8),
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.black),
                                    ),
                                    child: Column(children: [
                                      Text("BMI",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black)),
                                      Text(
                                          "Your BMI value is " + f.format(bmi)),
                                      bmiStatusText(),
                                    ])),
                                SizedBox(height: 28),
                                TextFormField(
                                    controller: txtWeightController,
                                    decoration: InputDecoration(
                                      labelText: 'Weight (kg)',
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    onEditingComplete: () {
                                      setState(() {
                                        buttonEnabled = isPassFilled();
                                        FocusScope.of(context).unfocus();
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ]),
                                SizedBox(height: 28),
                                TextFormField(
                                    controller: txtHeightController,
                                    decoration: InputDecoration(
                                      labelText: 'Height (cm)',
                                      border: OutlineInputBorder(),
                                      focusedBorder: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.blue),
                                      ),
                                      labelStyle: TextStyle(
                                        color: Colors.black,
                                      ),
                                    ),
                                    onEditingComplete: () {
                                      setState(() {
                                        buttonEnabled = isPassFilled();
                                        FocusScope.of(context).unfocus();
                                      });
                                    },
                                    keyboardType: TextInputType.number,
                                    inputFormatters: <TextInputFormatter>[
                                      FilteringTextInputFormatter.digitsOnly
                                    ]),
                                SizedBox(height: 28),
                                Container(
                                    margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: Colors.black)),
                                    height: 60,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            disabledForegroundColor:
                                                Colors.blue.withOpacity(0.38),
                                            disabledBackgroundColor:
                                                Colors.white.withOpacity(0.12)),
                                        onPressed: buttonEnabled
                                            ? () {
                                                setState(() {
                                                  bmi = calBmi();
                                                });
                                              }
                                            : null,
                                        child: Text("Calculate",
                                            style: TextStyle(
                                                color: Colors.black))))
                              ],
                            ),
                          )
                        ],
                      )),
                  Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.black),
                      ),
                      child: Column(
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(color: Colors.black),
                            padding: EdgeInsets.fromLTRB(10, 15, 0, 15),
                            child: Text("Detail Information",
                                style: TextStyle(
                                    fontSize: 25, color: Colors.white),
                                textAlign: TextAlign.center),
                          ),
                          SizedBox(height: 28),
                          Row(
                            children: [
                              Expanded(
                                child: photoDisplay(),
                              ),
                              Expanded(
                                child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
                                    child: Column(
                                      children: [
                                        TextFormField(
                                            controller: txtShoulderController,
                                            decoration: InputDecoration(
                                              labelText: 'Shoulder (cm)',
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ]),
                                        SizedBox(height: 18),
                                        TextFormField(
                                            controller: txtArmController,
                                            decoration: InputDecoration(
                                              labelText: 'Arm (cm)',
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ]),
                                        SizedBox(height: 18),
                                        TextFormField(
                                            controller: txtChestController,
                                            decoration: InputDecoration(
                                              labelText: 'Chest (cm)',
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ]),
                                        SizedBox(height: 18),
                                        TextFormField(
                                            controller: txtWaistController,
                                            decoration: InputDecoration(
                                              labelText: 'Waist (cm)',
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ]),
                                        SizedBox(height: 18),
                                        TextFormField(
                                            controller: txtHipController,
                                            decoration: InputDecoration(
                                              labelText: 'Hip (cm)',
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ]),
                                        SizedBox(height: 18),
                                        TextFormField(
                                            controller: txtTightController,
                                            decoration: InputDecoration(
                                              labelText: 'Tight (cm)',
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ]),
                                        SizedBox(height: 18),
                                        TextFormField(
                                            controller: txtCalfController,
                                            decoration: InputDecoration(
                                              labelText: 'Calf (cm)',
                                              border: OutlineInputBorder(),
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Colors.blue),
                                              ),
                                              labelStyle: TextStyle(
                                                color: Colors.black,
                                              ),
                                            ),
                                            keyboardType: TextInputType.number,
                                            inputFormatters: <
                                                TextInputFormatter>[
                                              FilteringTextInputFormatter
                                                  .digitsOnly
                                            ]),
                                      ],
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(height: 30),
                          Container(
                              padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                              width: 150,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.blue),
                              child: TextButton(
                                  onPressed: () {
                                    setState(() {
                                      isLoading = true;
                                    });
                                    final payload = {
                                      'weight': txtWeightController.text,
                                      'height': txtHeightController.text,
                                      'bmi': bmi.toString(),
                                      'shoulder': txtShoulderController.text,
                                      'arm': txtArmController.text,
                                      'chest': txtChestController.text,
                                      'waist': txtWaistController.text,
                                      'hip': txtHipController.text,
                                      'tight': txtTightController.text,
                                      'calf': txtCalfController.text,
                                    };

                                    userRepository
                                        .bodyMeasurement(payload)
                                        .then((value) {
                                      if (value.status == "success" &&
                                          value.message == "Get Record") {
                                        showDialog(
                                          context: context,
                                          builder: (ctx) => AlertDialog(
                                            title: Text("Information Saved"),
                                            content: Text(
                                                "All the information have been recorded."),
                                            actions: <Widget>[
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(ctx).pop();
                                                },
                                                child: Container(
                                                  color: Colors.black,
                                                  padding:
                                                      const EdgeInsets.all(14),
                                                  child: Text("OK",
                                                      style: TextStyle(
                                                          color: Colors.white)),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      }
                                    }).onError((error, stackTrace) {
                                      showErrorDialog(
                                          context, error.toString());
                                    }).whenComplete(() {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    });
                                    ;
                                  },
                                  child: Text("SAVE",
                                      style: TextStyle(color: Colors.black)))),
                          SizedBox(height: 28)
                        ],
                      ))
                ],
              )));
  }
}
