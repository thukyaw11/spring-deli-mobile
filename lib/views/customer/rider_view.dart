import 'package:flutter/material.dart';
import 'package:spring_deli_app/partials/line.dart';
import 'package:spring_deli_app/utils.dart';

class RiderView extends StatefulWidget {
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
                            "Kyaw Gyi",
                            style: TextStyle(fontSize: 25),
                          ),
                          Text(
                            "098787878",
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
                  child: Text(
                      "သင်္ဃန်းကျွန်း နဲ့ တောင်ဥက္ကလာအတွင်းမှာရှိတဲ့ 🍔🍗 မုန့်ဆိုင်တေ 🏢🏢 G&G၊ City Martတို့က လိုအပ်တဲ့ပစ္စည်းလေးတေ၊ 🛵🛵 ပို့ဆောင်ချင်တဲ့ပစ္စည်းလေးတေ 🕺🕺 အကုန်အဆင်ပြေအောင်ဝန်ဆောင်မှုပေးပါတယ်ခင်ဗျ 📱📱 လိုအပ်တာရှိရင် Message ပို့ပီးမှာနိုင်ပါတယ်"),
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
                              "1500 ks",
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
                  children: [
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
                        backgroundColor: Colors.red,
                        padding: EdgeInsets.all(2.0),
                        label: Text(
                          'Insein(အင်းစိန်)',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
                BuildLine(),
                BuildRiderAvCard(),
                BuildRiderAvCard(),
                BuildRiderAvCard(),
                BuildRiderAvCard(),
                BuildRiderAvCard(),
                BuildRiderAvCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BuildRiderAvCard extends StatelessWidget {
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
                  'All shop from Thingangyun & South Okkalapa',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Text(
                  'အစားအစာနှင့် ဆေးဝါး လိုအပ်တဲ့ပစ္စည်းများဝယ်ပေးပါတယ် Online shopနှင့် ပို့ချင်တဲ့ ပစ္စည်းလေးတေပို့ပေးပါတယ်ခင်ဗျ',
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
