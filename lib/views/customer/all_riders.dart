import 'package:flutter/material.dart';
import 'package:spring_deli_app/controllers/rider_controller.dart';
import 'package:spring_deli_app/partials/line.dart';
import 'package:get/get.dart';
import 'package:spring_deli_app/utils.dart';

class AllRiders extends StatefulWidget {
  @override
  _AllRidersState createState() => _AllRidersState();
}

class _AllRidersState extends State<AllRiders> {
  //controllers
  final RiderController riderController = Get.put(RiderController());

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
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(title: _appBarTitle, actions: [
        IconButton(icon: _searchIcon, onPressed: () => {_changeToSearchBar()})
      ]),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Riders in Yangon : ",
                    style: TextStyle(fontSize: 20),
                  ),
                  Text(
                    "67 Riders",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              BuildLine(),
              BuildFoodCard(),
              BuildFoodCard(),
              BuildFoodCard(),
              BuildFoodCard(),
            ],
          ),
        ),
      ),
    );
  }
}

class BuildFoodCard extends StatelessWidget {
  const BuildFoodCard({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {Get.toNamed('/rider_view')},
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
                'Kyaw Gyi',
                style: TextStyle(fontSize: 19),
              ),
              subtitle: Text('0986868686'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 13),
              child: Wrap(children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Chip(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.all(2.0),
                    label: Text(
                      'Kamaryut(ကမာရွတ်)',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Chip(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.all(2.0),
                    label: Text(
                      'Hlaing(လှိုင်)',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Chip(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.all(2.0),
                    label: Text(
                      'Insein(အင်းစိန်)',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 10),
                  child: Chip(
                    backgroundColor: Colors.transparent,
                    shape: StadiumBorder(side: BorderSide(color: Colors.red)),
                    padding: EdgeInsets.all(2.0),
                    label: Text(
                      '3 more',
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.fastfood,
                  ),
                  title: Text("KFC"),
                ),
                ListTile(
                  leading: Icon(Icons.fastfood),
                  title: Text("LOTTERIA"),
                ),
                ListTile(
                  leading: Icon(Icons.add),
                  title: Text("2 more"),
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
