import 'package:dreamwork/Constant.dart';
import 'package:dreamwork/repository/RewardsRepository.dart';
import 'package:dreamwork/repository/UserRepository.dart';
import 'package:dreamwork/response/RewardsResponse.dart';
import 'package:dreamwork/response/UserDetailsResponse.dart';
import 'package:dreamwork/util/Widgets.dart';
import 'package:flutter/material.dart';

class Reward extends StatefulWidget {
  const Reward({Key? key}) : super(key: key);

  @override
  State<Reward> createState() => _RewardState();
}

class _RewardState extends State<Reward> {
  static const IconData history = IconData(0xe314, fontFamily: 'MaterialIcons');

  List<RewardsResponse> RewardsList = List.empty(growable: true);

  List<UserDetailsResponse> PointsList = List.empty(growable: true);
  late UserDetailsResponse userDetails;

  int points = 0;

  //Variable for checking the point either enough or not.
  bool checkRewards = false;

  // control the loading indicator
  bool isLoading = false;

  RewardsRepository rewardsRepository = RewardsRepository();
  UserRepository userRepository = UserRepository();


  @override
  void initState() {
    super.initState();
    initView();
  }

  void initView() async {
    setState(() {
      isLoading = true;
    });

    await userRepository
        .userDetails()
        .then((value) {
          userDetails = value;
          setState(() {
            points = userDetails.Point;
          });
        })
        .onError(
            (error, stackTrace) => showErrorDialog(context, error.toString()))
        .whenComplete(() {
          setState(() {
            isLoading = false;
          });
        });

    setState(() {
      isLoading = true;
    });

    //push the data get from API into the array has be build.
    await rewardsRepository
        .products()
        .then((value) {
          RewardsList.clear();
          RewardsList.addAll(value);
        })
        .onError(
            (error, stackTrace) => showErrorDialog(context, error.toString()))
        .whenComplete(() {
          setState(() {
            isLoading = false;
          });
        });
  }

  //Same as looping
  Widget buildRewardItem(RewardsResponse reward) {
    return Container(
        padding: EdgeInsets.fromLTRB(0, 0, 0, 20),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          children: [
            Expanded(
                flex: 1, child: Image.network(Constant.hostUrl + reward.image)),
            Expanded(
                flex: 2,
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.fromLTRB(10, 0, 50, 0),
                        width: double.infinity,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 15,
                              child: Container(
                                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                                child: Text(reward.name,
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
                                            child: Text(
                                                reward.point_to_redeem
                                                    .toString(),
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
                        padding: EdgeInsets.fromLTRB(20, 0, 80, 0),
                        child: Text(reward.description,
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.bold,
                            ))),
                    SizedBox(height: 18),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Column(
                              children: [
                                Text("Stock : ",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 10, 10, 5),
                                  width: 50,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white,
                                  ),
                                  child: TextButton(
                                      onPressed: () {
                                      },
                                      child: Text(reward.stock.toString(),
                                          style:
                                              TextStyle(color: Colors.black))),
                                )
                              ],
                            )),
                        Container(
                            height: 40,
                            width: 70,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)),
                            margin: EdgeInsets.fromLTRB(20, 20, 50, 0),
                            child: TextButton(
                                onPressed: () {
                                  setState(() {
                                    isLoading = true;
                                    checkRewards = false;

                                    if (points >=
                                        reward.point_to_redeem) {
                                      checkRewards = true;
                                      print(checkRewards);
                                    }
                                  });
                                  if (checkRewards) {
                                    final payload = {'item_id': reward.id};

                                    rewardsRepository
                                        .rewards(payload)
                                        .then((value) {
                                      showDialog(
                                        context: context,
                                        builder: (ctx) => AlertDialog(
                                          title: Text("Rewards Applying"),
                                          content: Text(
                                              "Your Request Has Been Submitted, Wait For Reply."),
                                          actions: <Widget>[
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(ctx).pop();
                                              },
                                              child: Container(
                                                color: Colors.black,
                                                padding:
                                                const EdgeInsets.all(
                                                    14),
                                                child: Text("OK",
                                                    style: TextStyle(
                                                        color: Colors
                                                            .white)),
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    }).onError((error, stackTrace) {
                                      showErrorDialog(
                                          context, error.toString());
                                    }).whenComplete(() {
                                      setState(() {
                                        isLoading = false;
                                      });
                                    });
                                    ;
                                  } else if (!checkRewards) {
                                    showDialog(
                                      context: context,
                                      builder: (ctx) => AlertDialog(
                                        title: Text(
                                            "Rewards Redeem Unsuccessful"),
                                        content: Text(
                                            "Your Request Has Been Rejected Due To Not Enough Point."),
                                        actions: <Widget>[
                                          TextButton(
                                            onPressed: () {
                                              Navigator.of(ctx).pop();

                                              setState(() {
                                                isLoading = false;
                                              });
                                            },
                                            child: Container(
                                              color: Colors.black,
                                              padding:
                                              const EdgeInsets.all(
                                                  14),
                                              child: Text("OK",
                                                  style: TextStyle(
                                                      color:
                                                      Colors.white)),
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                },
                                child: Text("GET",
                                    style: TextStyle(
                                      color: Colors.blue,
                                    )))),
                      ],
                    ),
                  ],
                ))
          ],
        ));
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
              Text("DreamWork",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  )),
            ],
          ),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, "rewardsHistory");
                },
                child: Icon(
                  Icons.history, // add custom icons also
                ),
              ),
            )
          ],
        ),
        body: SafeArea(
          child: isLoading
              ? loadingIndicator()
              : SingleChildScrollView(
                  child: Container(
                    color: Colors.white12,
                    child: Column(
                      children: [
                        Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                            child: Text("Rewards",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23,
                                ))),
                        SizedBox(height: 10),
                        Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.fromLTRB(20, 0, 0, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                    width: double.infinity,
                                    child: Row(
                                      children: [
                                        Expanded(
                                            flex: 10,
                                            child: Image.asset(
                                                "Assets/dollar.png")),
                                        Expanded(
                                            flex: 18,
                                            child: Container(
                                                margin: EdgeInsets.fromLTRB(
                                                    5, 0, 40, 0),
                                                width: double.infinity,
                                                child: Column(
                                                  children: [
                                                    Text("Your Current Points",
                                                        style: TextStyle(
                                                            fontSize: 20)),
                                                    SizedBox(height: 15),
                                                    Text(points.toString(),
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontSize: 30,
                                                        ))
                                                  ],
                                                )))
                                      ],
                                    )),
                                SizedBox(height: 28),
                                //Check if the rewards list got things, it will display.
                                if (RewardsList.isNotEmpty)
                                  Column(
                                      children: RewardsList.map((reward) =>
                                          buildRewardItem(reward)).toList()),
                                SizedBox(height: 28),
                              ],
                            ))
                      ],
                    ),
                  ),
                ),
        ));
  }
}
