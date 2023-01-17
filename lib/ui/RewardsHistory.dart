import 'package:dreamwork/repository/RewardsRepository.dart';
import 'package:dreamwork/response/RewardsHistoryResponse.dart';
import 'package:dreamwork/util/Formatter.dart';
import 'package:dreamwork/util/Widgets.dart';
import 'package:flutter/material.dart';

class RewardsHistory extends StatefulWidget {
  const RewardsHistory({Key? key}) : super(key: key);

  @override
  State<RewardsHistory> createState() => _RewardsHistoryState();
}

class _RewardsHistoryState extends State<RewardsHistory> {
  List<RewardsHistoryResponse> rewardsHistoryList = List.empty(growable: true);
  late RewardsHistoryResponse rewardsHistoryResponse;

  // control the loading indicator
  bool isLoading = false;
  RewardsRepository rewardsRepository = RewardsRepository();

  void initView() async {
    //call api to retrieve user details
    //get value and put into gender
    setState(() {
      isLoading = true;
    });

    //push the data get from API into the array has be build.
    await rewardsRepository
        .rewardsHistory()
        .then((value) {

          rewardsHistoryList.clear();
          rewardsHistoryList.addAll(value);
        })
        .onError(
            (error, stackTrace) => showErrorDialog(context, error.toString()))
        .whenComplete(() {
          setState(() {
            isLoading = false;
          });
        });
  }

  void initState() {
    super.initState();
    initView();

    print(rewardsHistoryList);
  }

  Widget buildRewardsHistory(RewardsHistoryResponse e) {
    return Container(
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
                                  padding: EdgeInsets.fromLTRB(130, 0, 10, 0),
                                  child: Text(e.item_name,
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
                                              child: Text(e.point.toString(),
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
                          child: Text(
                              "Redeem Time : " +
                                  dateFormatterFromString(
                                      e.created_at.toString()),
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
                                padding: EdgeInsets.fromLTRB(150, 0, 0, 0),
                                child: Text("Status : ",
                                    style: TextStyle(color: Colors.black)),
                              ),
                              buildStatus(e.status),
                            ],
                          )),
                      SizedBox(height: 10),
                    ],
                  ))
            ],
          ),
        ));
  }

  //The function that show the status in different color.
  Widget buildStatus(int status) {
    if (status == '0') {
      return Text("Pending", style: TextStyle(color: Colors.orange));
    } else if (status == '1') {
      return Text("Approved", style: TextStyle(color: Colors.blue));
    } else if (status == '2') {
      return Text("Rejected",
          style: TextStyle(
            color: Colors.red,
          ));
    } else {
      return Text("Pending", style: TextStyle(color: Colors.orange));
    }
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
            Column(
              children: [
                ...rewardsHistoryList
                    .map((e) => buildRewardsHistory(e))
                    .toList(),
              ],
            )
          ],
        )));
  }
}
