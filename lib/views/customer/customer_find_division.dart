import 'package:flutter/material.dart';
import 'package:smart_select/smart_select.dart';
import 'package:spring_deli_app/utils.dart';

class FindDivision extends StatefulWidget {
  @override
  _FindDivisionState createState() => _FindDivisionState();
}

class _FindDivisionState extends State<FindDivision> {
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'Yangon', title: 'Yangon'),
    S2Choice<String>(value: 'Mandalay', title: 'Mandalay'),
  ];
  String? divisionValue;
  bool _buttonDisable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  findCustomerDivisionTitleEn,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Center(
                child: Text(
                  findCustomerDivisionTitleMm,
                  style: TextStyle(fontSize: 16),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 20.0),
                decoration: BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.circular(4.0)),
                child: SmartSelect<String>.single(
                  title: statePlaceHolder,
                  value: divisionValue,
                  choiceItems: options,
                  onChange: (state) => setState(() {
                    divisionValue = state.value;
                    if (divisionValue != null) {
                      _buttonDisable = false;
                    }
                  }),
                ),
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: _buttonDisable
                      ? ElevatedButton.styleFrom(primary: Colors.white)
                      : null,
                  onPressed: () => {
                    _buttonDisable
                        ? null
                        : Navigator.of(context)
                            .pushNamed('/allRiders', arguments: divisionValue)
                  },
                  child: Text(
                    findRiderBtnText,
                    style: TextStyle(
                        color: _buttonDisable ? Colors.black : Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
