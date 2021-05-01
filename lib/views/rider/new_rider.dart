import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:smart_select/smart_select.dart';
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

// simple usage

  String divisionValue;
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'Yangon', title: 'Yangon'),
    S2Choice<String>(value: 'Mandalay', title: 'Mandalay'),
  ];

  List<int> multi_value = [];
  List<S2Choice<int>> ygnTownships = [
    S2Choice<int>(value: 1, title: 'Hlaing(လှိုင်)'),
    S2Choice<int>(value: 2, title: 'Thingangyun(သင်္ဃန်းကျွန်း)'),
    S2Choice<int>(value: 3, title: 'Yankin(ရန်ကင်း)'),
  ];

  List<S2Choice<int>> mdyTownships = [
    S2Choice<int>(value: 1, title: 'Mdy Hlaing(လှိုင်)'),
    S2Choice<int>(value: 2, title: 'Thingangyun(သင်္ဃန်းကျွန်း)'),
    S2Choice<int>(value: 3, title: 'Yankin(ရန်ကင်း)'),
  ];

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
                SizedBox(
                  height: 20,
                ),
                Text(
                  divisionTitle,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: BorderRadius.circular(4.0)),
                  child: SmartSelect<String>.single(
                      title: statePlaceHolder,
                      value: divisionValue,
                      choiceItems: options,
                      onChange: (state) =>
                          setState(() => divisionValue = state.value)),
                ),
                SizedBox(
                  height: 16,
                ),
                if (divisionValue != null)
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.black12,
                        borderRadius: BorderRadius.circular(4.0)),
                    child: SmartSelect<int>.multiple(
                      title: townPlaceHolder,
                      choiceType: S2ChoiceType.chips,
                      choiceLayout: S2ChoiceLayout.grid,
                      value: multi_value,
                      choiceItems: divisionValue == 'Yangon'
                          ? ygnTownships
                          : mdyTownships,
                      onChange: (state) =>
                          setState(() => multi_value = state.value),
                    ),
                  ),
                SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(primary: Colors.black),
                    onPressed: () => {getImage()},
                    child: Text(
                      photoUploadBtnText,
                    ),
                  ),
                ),
                Container(
                  child: _image == null
                      ? Text("No image selected")
                      : Image.file(
                          _image,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fill,
                        ),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                  shopTitle,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.left,
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
                ElevatedButton(
                  style: ElevatedButton.styleFrom(primary: Colors.black),
                  onPressed: () => {},
                  child: Text(
                    addShopBtnText,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                        primary: Theme.of(context).primaryColor),
                    onPressed: () => {},
                    icon: Icon(Icons.done),
                    label: Text(doneBtnText),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
