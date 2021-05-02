import 'package:flutter/material.dart';
import 'package:spring_deli_app/partials/line.dart';
import 'package:spring_deli_app/utils.dart';
import 'package:get/get.dart';

class FindRider extends StatefulWidget {
  @override
  _FindRiderState createState() => _FindRiderState();
}

class _FindRiderState extends State<FindRider> {
  final idTextController = TextEditingController();
  bool _buttonDisable = true;

  textListener() {
    if (idTextController.text.isNotEmpty) {
      setState(() {
        _buttonDisable = false;
      });
    } else {
      setState(() {
        _buttonDisable = true;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    idTextController.dispose();
  }

  @override
  void initState() {
    super.initState();
    idTextController.addListener(textListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Text(
                  findRiderTitle,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: idTextController,
                cursorColor: Colors.black,
                decoration: InputDecoration(
                  labelText: findRiderPlaceHolder,
                  labelStyle: TextStyle(
                    color: Colors.black,
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black, width: 1)),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: _buttonDisable
                      ? ElevatedButton.styleFrom(primary: Colors.white)
                      : null,
                  onPressed: () => {},
                  child: Text(
                    findRiderBtnText,
                    style: TextStyle(
                        color: _buttonDisable ? Colors.black : Colors.white),
                  ),
                ),
              ),
              BuildLine(),
              Text(
                findRiderText,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 19,
                ),
              ),
              InkWell(
                onTap: () => {Get.toNamed('/new_rider')},
                child: Text(
                  newProfile,
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
