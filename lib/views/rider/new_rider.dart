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

  //button disable
  bool _buttonDisable = true;

  // division select
  String divisionValue;
  List<S2Choice<String>> options = [
    S2Choice<String>(value: 'Yangon', title: 'Yangon'),
    S2Choice<String>(value: 'Mandalay', title: 'Mandalay'),
  ];

  List<int> multiValue = [];
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

  List<Map<String, String>> availableShops = [
    {'shopTitle': 'Jo Jo', 'shopDescription': 'this is shop des'},
    {'shopTitle': 'Jo Jo', 'shopDescription': 'this is shop des'},
    {'shopTitle': 'Jo Jo', 'shopDescription': 'this is shop des'},
  ];

  void _addShopToList(String shopTitle, [String shopDescription]) {
    setState(() {
      availableShops.add({
        'shopTitle': shopTitle,
        'shopDescription': shopDescription == null ? '' : shopDescription
      });
    });
    _clearShopNameTextField();
  }

  void _clearShopNameTextField() {
    shopNameController.text = '';
    aboutShopController.text = '';
  }

  // listen text change event
  textListener() {
    if (shopNameController.text.isNotEmpty) {
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
    shopNameController.dispose();
  }

  @override
  void initState() {
    super.initState();
    shopNameController.addListener(textListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
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
                      value: multiValue,
                      choiceItems: divisionValue == 'Yangon'
                          ? ygnTownships
                          : mdyTownships,
                      onChange: (state) =>
                          setState(() => multiValue = state.value),
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
                SizedBox(
                  height: 16,
                ),
                Wrap(
                  children: availableShops
                      .map(
                        (shop) => Container(
                          margin: EdgeInsets.only(right: 3),
                          child: InputChip(
                              deleteIconColor: Colors.white,
                              backgroundColor: Colors.red,
                              padding: EdgeInsets.all(2.0),
                              label: Text(
                                shop['shopTitle'],
                                style: TextStyle(color: Colors.white),
                              ),
                              onDeleted: () {
                                setState(() {
                                  availableShops.removeWhere((element) =>
                                      element['shopTitle'] ==
                                      shop['shopTitle']);
                                });
                              }),
                        ),
                      )
                      .toList(),
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
                  style: ElevatedButton.styleFrom(
                      primary: _buttonDisable ? Colors.grey : Colors.red),
                  onPressed: () => {
                    _buttonDisable
                        ? null
                        : _addShopToList(
                            shopNameController.text, aboutShopController.text)
                  },
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
