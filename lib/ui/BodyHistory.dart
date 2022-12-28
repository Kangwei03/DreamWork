import 'package:dreamwork/repository/UserRepository.dart';
import 'package:dreamwork/response/BodyMeasurementResponse.dart';
import 'package:flutter/material.dart';

class BodyHistory extends StatefulWidget {
  const BodyHistory({Key? key}) : super(key: key);

  @override
  State<BodyHistory> createState() => _BodyHistoryState();
}

class _BodyHistoryState extends State<BodyHistory> {

  //To build a array to store the data that get from API
  List<BodyMeasurementResponse> bodyMeasurementList = List.empty(growable: true);
  late BodyMeasurementResponse bodyMeasurementResponse;


  //Declaring the function in API
  UserRepository userRepository = UserRepository();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    initView();
  }

  void initView() async {
    //call api to retrieve user details
    //get value and put into gender
    bodyMeasurementResponse = BodyMeasurementResponse(1, "2022-11-23", 75, 155, 15, 15, 15, 15, 15, 15, 15,31.22);
    bodyMeasurementList.add(BodyMeasurementResponse(1, "2022-11-24", 75, 155, 14, 15, 15, 15, 15, 15, 15, 31.22));
    bodyMeasurementList.add(BodyMeasurementResponse(1, "2022-11-25", 75, 155, 13, 15, 15, 15, 15, 15, 15, 31.22));
    bodyMeasurementList.add(BodyMeasurementResponse(1, "2022-11-26", 75, 155, 12, 15, 15, 15, 15, 15, 15, 31.22));
    bodyMeasurementList.add(BodyMeasurementResponse(1, "2022-11-27", 75, 155, 11, 15, 15, 15, 15, 15, 15, 31.22));
    bodyMeasurementList.add(BodyMeasurementResponse(1, "2022-11-28", 75, 155, 16, 15, 15, 15, 15, 15, 15, 31.22));
    bodyMeasurementList.add(BodyMeasurementResponse(1, "2022-11-29", 75, 155, 17, 15, 15, 15, 15, 15, 15, 31.22));
  }

  String selectedParam = '';

  //A widget that let the different data can be show in table form.
  TableRow buildBodyMeasurementItem(BodyMeasurementResponse bodyMeasurement){
    double bodyValue = 0;

    if(selectedParam == "BMI"){
      bodyValue = bodyMeasurement.bmi;
    }else if(selectedParam == "Shoulder"){
      bodyValue = bodyMeasurement.shoulder;
    }else if(selectedParam == "Arm"){
      bodyValue = bodyMeasurement.arm;
    }else if(selectedParam == "Chest"){
      bodyValue = bodyMeasurement.chest;
    }else if(selectedParam == "Waist"){
      bodyValue = bodyMeasurement.waist;
    }else if(selectedParam == "Hip"){
      bodyValue = bodyMeasurement.hip;
    }else if(selectedParam == "Tight"){
      bodyValue = bodyMeasurement.tight;
    }else if(selectedParam == "Calf"){
      bodyValue = bodyMeasurement.calf;
    }

    return (
        TableRow(children: [
          Column(
            children: [
              TableCell(child: SizedBox(height: 10)),
              Text(bodyMeasurement.created_at, style: TextStyle(fontSize: 20.0))
            ],
          ),
          Column(
            children: [
              TableCell(child: SizedBox(height: 10)),
              Text(bodyValue.toString(), style: TextStyle(fontSize: 20.0))
            ],
          )
        ])
    );
  }

  Widget buildBodyMeasureTable() {


    return Container(
        child: Column(children: [
      Container(
        padding: EdgeInsets.fromLTRB(0, 30, 0, 20),
        child: Text(selectedParam,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            )),
      ),
      Container(
          child: Center(
              child: Column(
        children: <Widget>[
          Container(
              margin: EdgeInsets.all(20),
              child: Table(
                defaultColumnWidth: FixedColumnWidth(170.0),
                border: TableBorder.all(
                    color: Colors.black, style: BorderStyle.solid, width: 3),
                children: [
                  TableRow(children: [
                    Column(children: [
                      TableCell(child: SizedBox(height: 10)),
                      Text('Date', style: TextStyle(fontSize: 22.0))
                    ]),
                    Column(children: [
                      TableCell(child: SizedBox(height: 10)),
                      Text('Value', style: TextStyle(fontSize: 22.0))
                    ]),
                  ]),
                  ...bodyMeasurementList.map((e) => buildBodyMeasurementItem(e)).toList(),

                ],
              ))
        ],
      )))
    ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.black,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text("Dream Work",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ))
              ],
            )),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                child: Text("Body Measure History",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    )),
              ),
              SizedBox(height: 28),
              Container(
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                  child: Text("My Records",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ))),
              SizedBox(height: 28),
              Container(
                height: 100,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        width: 120,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                selectedParam = "BMI";
                              });
                            },
                            child: Text("BMI",
                                style: TextStyle(color: Colors.black)),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(15)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.black, width: 3)),
                                )))),
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        width: 120,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                selectedParam = "Shoulder";
                              });
                            },
                            child: Text("Shoulder",
                                style: TextStyle(color: Colors.black)),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(15)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.black, width: 3)),
                                )))),
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        width: 120,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                selectedParam = "Arm";
                              });
                            },
                            child: Text("Arm",
                                style: TextStyle(color: Colors.black)),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(15)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.black, width: 3)),
                                )))),
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        width: 120,
                        child: TextButton(
                            onPressed: () {
                                setState(() {
                                  selectedParam = "Chest";
                                });
                            },
                            child: Text("Chest",
                                style: TextStyle(color: Colors.black)),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(15)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.black, width: 3)),
                                )))),
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        width: 120,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                selectedParam = "Waist";
                              });
                            },
                            child: Text("Waist",
                                style: TextStyle(color: Colors.black)),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(15)),
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.black, width: 3)),
                                )))),
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        width: 120,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                selectedParam = "Hip";
                              });
                            },
                            child: Text("Hip",
                                style: TextStyle(color: Colors.black)),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(15)),
                                foregroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.red),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.black, width: 3)),
                                )))),
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        width: 120,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                selectedParam = "Tight";
                              });
                            },
                            child: Text("Tight",
                                style: TextStyle(color: Colors.black)),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(15)),
                                foregroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.red),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.black, width: 3)),
                                )))),
                    Container(
                        padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                        width: 120,
                        child: TextButton(
                            onPressed: () {
                              setState(() {
                                selectedParam = "Calf";
                              });
                            },
                            child: Text("Calf",
                                style: TextStyle(color: Colors.black)),
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all<EdgeInsets>(
                                    EdgeInsets.all(15)),
                                foregroundColor:
                                MaterialStateProperty.all<Color>(
                                    Colors.red),
                                shape: MaterialStateProperty.all<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18.0),
                                      side: BorderSide(
                                          color: Colors.black, width: 3)),
                                )))),
                  ],
                ),
              ),
              if(selectedParam != "")
              buildBodyMeasureTable(),
            ],
          ),
        ));
  }
}
