import 'package:flutter/material.dart';
import 'package:spring_deli_app/models/rider/riders_model.dart';
import 'package:spring_deli_app/partials/line.dart';
import 'package:spring_deli_app/utils.dart';

class RiderView extends StatefulWidget {
  final RiderModel riderModel;
  RiderView({required this.riderModel});

  @override
  _RiderViewState createState() => _RiderViewState();
}

class _RiderViewState extends State<RiderView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${widget.riderModel.name}",
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            widget.riderModel.phoneNumber,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColor),
                          ),
                        ],
                      ),
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('images/demo.png'))),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("${widget.riderModel.detail}"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Text(
                              "Delivery Fees ",
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "${widget.riderModel.expectedMoney} ks",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red),
                            )
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.phone),
                        onPressed: () => {},
                        color: Theme.of(context).primaryColor,
                      )
                    ],
                  ),
                ),
                BuildLine(),
                Text(
                  "Available Shops and Delivery",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Wrap(
                    children: widget.riderModel.township
                        .map((townshipNmae) => BuildTownshipChip(
                              township: townshipNmae,
                            ))
                        .toList()),
                BuildLine(),
                Column(
                  children: widget.riderModel.availableShops
                      .map((shop) => BuildRiderAvCard(
                            availableShopsModel: shop,
                          ))
                      .toList(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildTownshipChip extends StatelessWidget {
  final String township;

  BuildTownshipChip({required this.township});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 10),
      child: Chip(
        backgroundColor: Colors.red,
        padding: EdgeInsets.all(2.0),
        label: Text(
          township,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class BuildRiderAvCard extends StatelessWidget {
  final AvailableShopsModel availableShopsModel;
  BuildRiderAvCard({required this.availableShopsModel});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Align(
            alignment: Alignment.center,
            child: Column(
              children: [
                Text(
                  availableShopsModel.name,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  availableShopsModel.detail,
                  style: TextStyle(fontSize: 15, color: Colors.black45),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
