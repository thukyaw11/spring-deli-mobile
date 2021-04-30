import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:spring_deli_app/partials/build_textfield.dart';
import 'package:spring_deli_app/utils.dart';

class NewRider extends StatefulWidget {
  @override
  _NewRiderState createState() => _NewRiderState();
}

class _NewRiderState extends State<NewRider> {
  File _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print("No image selected");
      }
    });
  }

  // text editing controller
  final nameTextController = TextEditingController();
  final aboutMeController = TextEditingController();
  final phoneNoController = TextEditingController();
  final feeController = TextEditingController();
  final shopNameController = TextEditingController();
  final aboutShopController = TextEditingController();

  // division select elements
  final divisions = <String>['Yangon', 'Mandalay'];
  final ygnDivisions = <String>[
    'Yangon Township One',
    'Yangon Township Two',
    'Yangon Township Three'
  ];
  final mdyDivisions = <String>[
    'Mandalay Township One',
    'Mandalay Township Two',
    'Mandalay Township Three'
  ];
  String _selectedDivision;
  String _selectedTownship;

  List<Widget> buildDropdownItem() => divisions
      .map(
        (String val) => DropdownMenuItem(
          child: Text(val),
          value: val,
        ),
      )
      .toList();

  void _divisionSelectChanged(String value) {
    // if (value == 'Yangon') {
    //   buildTownshipDropdownItem(ygnDivisions);
    // } else if (value == 'Mandalay') {
    //   buildTownshipDropdownItem(mdyDivisions);
    // }
    setState(() {
      _selectedDivision = value;
    });
  }

  void _townshipSelectChanged(String townshipVal) {
    setState(() {
      _selectedTownship = townshipVal;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Text(
                    newRiderTitle,
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                BuildTextField(
                  textController: nameTextController,
                  labelText: namePlaceHolder,
                ),
                BuildTextField(
                  textController: aboutMeController,
                  labelText: aboutMePlaceHolder,
                  isMaxLine: true,
                ),
                BuildTextField(
                  textController: phoneNoController,
                  labelText: phNoPlaceHolder,
                ),
                BuildTextField(
                  textController: feeController,
                  labelText: feePlaceHolder,
                ),
                BuildTextField(
                  textController: shopNameController,
                  labelText: shopNamePlaceHolder,
                ),
                BuildTextField(
                  textController: aboutShopController,
                  labelText: aboutShopPlaceHolder,
                  isMaxLine: true,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                    onPressed: () => {getImage()},
                    child: Text(
                      photoUploadBtnText,
                    ),
                  ),
                ),
                Container(
                  child: _image == null
                      ? Text("No image selected")
                      : Image.file(_image),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "မိမိပို့ဆောင်နိုင်မည့် မြို့နယ်များကို ၁ ခုချင်းရွေးချယ်ပါ",
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  items: buildDropdownItem(),
                  hint: Text("တိုင်းဒေသကြီး"),
                  value: _selectedDivision,
                  onChanged: (String value) {
                    _divisionSelectChanged(value);
                  },
                ),
                DropdownButton<String>(
                  isExpanded: true,
                  hint: Text("မြို့နယ်"),
                  value: _selectedTownship,
                  onChanged: (String value) {
                    _townshipSelectChanged(value);
                  },
                  items: [
                    new DropdownMenuItem(
                      child: new Text("Abc"),
                      value: 'hello',
                    ),
                    new DropdownMenuItem(
                      child: new Text("Xyz"),
                      value: 'hi',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
