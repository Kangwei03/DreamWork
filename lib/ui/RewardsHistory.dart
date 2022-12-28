import 'package:dreamwork/response/RewardsHistoryResponse.dart';
import 'package:flutter/material.dart';

class RewardsHistory extends StatefulWidget {
  const RewardsHistory({Key? key}) : super(key: key);

  @override
  State<RewardsHistory> createState() => _RewardsHistoryState();
}

class _RewardsHistoryState extends State<RewardsHistory> {
  List<RewardsHistoryResponse> rewardsHistoryList = List.empty(growable: true);
  late RewardsHistoryResponse rewardsHistoryResponse;

  void initView() async {
    //call api to retrieve user details
    //get value and put into gender
    rewardsHistoryResponse = RewardsHistoryResponse(
        "rewards.png", "Yoga Map", 100, DateTime(2022, 12, 08), "Approved");
    rewardsHistoryList.add(RewardsHistoryResponse(
        "rewards.png", "Yoga Map", 100, DateTime(2022, 12, 04), "Approved"));
  }

  Widget buildRewardsHistory(RewardsHistoryResponse e) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Row(
        children: [
          Expanded(flex: 10, child: Image.asset("Assets/rewards2.png")),
          Expanded(
              flex: 20,
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                            flex: 15,
                            child: Container(
                              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                              child: Text(e.name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  )),
                            ),
                          ),
                          Expanded(
                              flex: 8,
                              child: Container(
                                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Text("100",
                                              style: TextStyle(
                                                fontSize: 15,
                                              )),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                            child: Image.asset(
                                          e.image,
                                          width: 40,
                                        )),
                                      )
                                    ],
                                  )))
                        ],
                      )),
                  SizedBox(height: 8),
                  Container(
                      padding: EdgeInsets.fromLTRB(25, 0, 80, 0),
                      child: Text("Redeem Time : " + "e.redeemDate",
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.bold,
                          ))),
                  SizedBox(height: 18),
                  Container(
                      margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(55, 0, 0, 0),
                            child: Text("Status : ",
                                style: TextStyle(color: Colors.black)),
                          ),
                          buildStatus(e.status)
                        ],
                      )),
                  ...rewardsHistoryList
                      .map((e) => buildRewardsHistory(e))
                      .toList(),
                ],
              )),
          SizedBox(height: 28)
        ],
      ),
    );
  }

  //The function that show the status in different color.
  Widget buildStatus(String status) {
    Color statusTextColor = Colors.black;

    if (status == 'Pending') {
      statusTextColor = Colors.orange;
    } else if (status == 'Approved') {
      statusTextColor = Colors.blue;
    } else if (status == 'Rejected') {
      statusTextColor = Colors.red;
    }

    return Text(
      status,
      style: TextStyle(
        color: statusTextColor,
      ),
    );
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
              children: const [
                Text("Dream Work",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    )),
              ],
            )),
        body: SingleChildScrollView(
            child: Column(
          children: [
            Container(
                padding: EdgeInsets.fromLTRB(10, 20, 0, 20),
                width: MediaQuery.of(context).size.width,
                child: Text("Rewards History",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ))),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(15, 10, 10, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                  )),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 20,
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 30,
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              130, 0, 10, 0),
                                          child: Text("Water Bottle",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              )),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 8,
                                          child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 0, 0, 0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      child: Text("50",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                          )),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                        child: Image.asset(
                                                      "Assets/dollar.png",
                                                      width: 40,
                                                    )),
                                                  )
                                                ],
                                              )))
                                    ],
                                  )),
                              SizedBox(height: 8),
                              Container(
                                  child: Text("Redeem Time : 6/12/2022",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ))),
                              SizedBox(height: 18),
                              Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(150, 0, 0, 0),
                                        child: Text("Status : ",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ),
                                      buildStatus("Pending")
                                    ],
                                  )),
                              SizedBox(height: 10),
                            ],
                          ))
                    ],
                  ),
                )),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(15, 10, 10, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                  )),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 20,
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 30,
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              130, 0, 10, 0),
                                          child: Text("Yoga Map",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              )),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 8,
                                          child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 0, 0, 0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      child: Text("100",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                          )),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                        child: Image.asset(
                                                      "Assets/dollar.png",
                                                      width: 40,
                                                    )),
                                                  )
                                                ],
                                              )))
                                    ],
                                  )),
                              SizedBox(height: 8),
                              Container(
                                  child: Text("Redeem Time : 6/12/2022",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ))),
                              SizedBox(height: 18),
                              Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(150, 0, 0, 0),
                                        child: Text("Status : ",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ),
                                      buildStatus("Approved")
                                    ],
                                  )),
                              SizedBox(height: 10),
                            ],
                          ))
                    ],
                  ),
                )),
            Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.fromLTRB(15, 10, 10, 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Card(
                  elevation: 10,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                    color: Theme.of(context).colorScheme.surfaceVariant,
                  )),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 20,
                          child: Column(
                            children: [
                              Container(
                                  padding: EdgeInsets.fromLTRB(0, 0, 50, 0),
                                  width: double.infinity,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 30,
                                        child: Container(
                                          padding: EdgeInsets.fromLTRB(
                                              130, 0, 10, 0),
                                          child: Text("Yoga Map",
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 18,
                                              )),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 8,
                                          child: Container(
                                              padding: EdgeInsets.fromLTRB(
                                                  8, 0, 0, 0),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Container(
                                                      child: Text("100",
                                                          style: TextStyle(
                                                            fontSize: 15,
                                                          )),
                                                    ),
                                                  ),
                                                  Expanded(
                                                    child: Container(
                                                        child: Image.asset(
                                                      "Assets/dollar.png",
                                                      width: 40,
                                                    )),
                                                  )
                                                ],
                                              )))
                                    ],
                                  )),
                              SizedBox(height: 8),
                              Container(
                                  child: Text("Redeem Time : 6/12/2022",
                                      style: TextStyle(
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ))),
                              SizedBox(height: 18),
                              Container(
                                  margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
                                  child: Row(
                                    children: [
                                      Container(
                                        padding:
                                            EdgeInsets.fromLTRB(150, 0, 0, 0),
                                        child: Text("Status : ",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ),
                                      buildStatus("Rejected")
                                    ],
                                  )),
                              SizedBox(height: 10),
                            ],
                          ))
                    ],
                  ),
                )),

            // Column(
            //   children: [
            //     RewardsHistory.map((e)) => buildRewardsHistory(e)).toList()),
            //   ],
            // )
          ],
        )));
  }
}
