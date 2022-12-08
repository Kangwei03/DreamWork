import 'package:dreamwork/response/Rewards.dart';
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

  // control the loading indicator
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    // Future.delayed(Duration(seconds: 2)).then((value) {setState(() {
    //   isLoading = false;
    // });});
    initView();
  }

  void initView() async {
    RewardsResponse rewardsResponse = RewardsResponse(
        "Assets/rewards.png",
        "Water Bottle",
        "Enjoy a new free water \n bottle as our gift for you.",
        50,
        "Assets/dollar.png");
    RewardsList.add(rewardsResponse);
    RewardsList.addAll([
      RewardsResponse(
          "Assets/rewards2.png",
          "Yoga Map",
          "Serve with high quality\n material.",
          100,
          "Assets/dollar.png"),
    ]);
  }

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
            flex: 1,
            child: Image.asset(reward.image_url)
          ),
          Expanded(
            flex: 2,
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
                          child: Text(
                            reward.name,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight:
                              FontWeight.bold,
                              fontSize: 18,
                            )
                          ),
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
                                    reward.pointNeeded.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                    )
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Image.asset(
                                    reward.coinImage,
                                    width: 40,
                                  )
                                ),
                              )
                            ],
                          )
                        )
                      )
                    ],
                  )
                ),
                SizedBox(height: 8),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0, 80, 0),
                  child: Text(
                    reward.description,
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    )
                  )
                ),
                SizedBox(height: 18),
                Container(
                    height: 40,
                    width: 70,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black)
                    ),
                    margin: EdgeInsets.fromLTRB(0, 0, 50, 0),
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "GET",
                        style: TextStyle(
                          color: Colors.blue,
                        )
                      )
                    )
                ),
              ],
            )
          )
        ],
      )
    );
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
                                          child: Image.asset("Assets/dollar.png")),
                                      Expanded(
                                          flex: 18,
                                          child: Container(
                                              margin:
                                              EdgeInsets.fromLTRB(5, 0, 40, 0),
                                              width: double.infinity,
                                              child: Column(
                                                children: const [
                                                  Text("Your Current Points",
                                                      style: TextStyle(fontSize: 20)),
                                                  SizedBox(height: 15),
                                                  Text(" 300 points",
                                                      style: TextStyle(
                                                        fontWeight: FontWeight.bold,
                                                        fontSize: 15,
                                                      ))
                                                ],
                                              )))
                                    ],
                                  )),
                              SizedBox(height: 28),
                              if(RewardsList.isNotEmpty) Column(
                                  children: RewardsList.map((reward) => buildRewardItem(reward)).toList()
                              ),
                              SizedBox(height: 28),
                            ],
                          ))
                    ],
                  ),
                ),
          ),
        )
    );
  }
}
