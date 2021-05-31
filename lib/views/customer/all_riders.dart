import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spring_deli_app/blocs/riders/riders_bloc.dart';
import 'package:spring_deli_app/models/rider/riders_model.dart';
import 'package:spring_deli_app/partials/line.dart';
import 'package:spring_deli_app/utils.dart';
import 'package:spring_deli_app/views/customer/rider_view.dart';

class AllRiders extends StatefulWidget {
  final String selectedTownship;
  AllRiders({required this.selectedTownship});
  @override
  _AllRidersState createState() => _AllRidersState();
}

class _AllRidersState extends State<AllRiders> {
  //controllers
  final TextEditingController _filter = new TextEditingController();
  Icon _searchIcon = Icon(Icons.search);
  Widget _appBarTitle = new Text('All Riders');
  void _changeToSearchBar() {
    setState(() {
      if (this._searchIcon.icon == Icons.search) {
        this._searchIcon = Icon(Icons.close);
        this._appBarTitle = TextField(
          autofocus: true,
          controller: _filter,
          cursorColor: Colors.white,
          style: TextStyle(color: Colors.white),
          decoration: new InputDecoration(
              border: InputBorder.none,
              hintText: ("မြို့နယ်နာမည်နှင့်ရှာရန် ..."),
              hintStyle: TextStyle(color: Colors.white)),
        );
      } else {
        this._searchIcon = Icon(Icons.search);
        this._appBarTitle = Text("All Riders");
        _filter.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final ridersBloc = BlocProvider.of<RidersBloc>(context);
    ridersBloc..add(FetchRiderEvent(statePath: widget.selectedTownship));

    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: _appBarTitle, actions: [
        IconButton(icon: _searchIcon, onPressed: () => {_changeToSearchBar()})
      ]),
      body: ListView(
        children: [
          BlocBuilder<RidersBloc, RidersState>(
            builder: (context, state) {
              if (state is RidersLoadingState || state is RidersInitial) {
                return Padding(
                  padding: const EdgeInsets.only(top: 30),
                  child: Center(
                    child: CircularProgressIndicator(
                        backgroundColor: backgroundColor,
                        valueColor: new AlwaysStoppedAnimation<Color>(
                            Theme.of(context).primaryColor)),
                  ),
                );
              }

              if (state is RidersErrorState) {
                return Center(
                  child: Text(
                    "Something went wrong!",
                    style: TextStyle(color: Colors.red),
                  ),
                );
              }

              if (state is RidersLoadedState) {
                return Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Total Riders ${widget.selectedTownship} : ",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          state.ridersModel.data.length.toString(),
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    BuildLine(),
                    Column(children: [
                      for (var item in state.ridersModel.data)
                        if (item.state == widget.selectedTownship) ...[
                          BuildFoodCard(riderModel: item)
                        ]
                    ])
                  ],
                );
              }

              return Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Center(
                  child: CircularProgressIndicator(
                      backgroundColor: backgroundColor,
                      valueColor: new AlwaysStoppedAnimation<Color>(
                          Theme.of(context).primaryColor)),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class BuildFoodCard extends StatelessWidget {
  RiderModel riderModel;
  BuildFoodCard({required this.riderModel});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (_) => RiderView(riderModel: riderModel),
          ),
        ),
      },
      child: Card(
        elevation: 0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              trailing: IconButton(
                  color: Theme.of(context).primaryColor,
                  icon: Icon(Icons.phone, size: 30),
                  onPressed: () {
                    print("hello");
                  }),
              title: Text(
                "${riderModel.name}",
                style: TextStyle(fontSize: 19),
              ),
              subtitle: Text('${riderModel.phoneNumber}'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Wrap(children: [
                for (var township in riderModel.township.take(3))
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Chip(
                      backgroundColor: Colors.red,
                      padding: EdgeInsets.all(2.0),
                      label: Text(
                        township,
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                if (riderModel.township.length > 3)
                  Container(
                    margin: EdgeInsets.only(right: 10),
                    child: Chip(
                      backgroundColor: Colors.transparent,
                      shape: StadiumBorder(side: BorderSide(color: Colors.red)),
                      padding: EdgeInsets.all(2.0),
                      label: Text(
                        '${riderModel.township.length - 3} more',
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                for (var shop in riderModel.availableShops.take(2))
                  ListTile(
                    leading: Icon(
                      Icons.fastfood,
                    ),
                    title: Text("${shop.name}"),
                  ),
                if (riderModel.availableShops.length > 2)
                  ListTile(
                    leading: Icon(Icons.add),
                    title: Text("${riderModel.availableShops.length - 2} more"),
                  ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
