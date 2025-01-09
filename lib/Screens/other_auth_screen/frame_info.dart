import 'package:flutter/material.dart';
import 'package:new_softlab/Screens/other_auth_screen/verification_doc.dart';

import '../../const/colors.dart';

import '../../const/state_list.dart';
import '../../utils/custom_Textfilled.dart';
import '../../utils/custom_button.dart';
import '../../utils/dropdown.dart';
import '../../utils/helper_text.dart';

class FarmInfo extends StatefulWidget {
  const FarmInfo({super.key});

  @override
  State<FarmInfo> createState() => _FarmInfoState();
}

class _FarmInfoState extends State<FarmInfo> {
  TextEditingController businessNameCtrl = TextEditingController();
  TextEditingController informalNameCtrl = TextEditingController();
  TextEditingController streetAddCtrl = TextEditingController();
  TextEditingController cityAddCtrl = TextEditingController();
  TextEditingController stateCtrl = TextEditingController();
  TextEditingController zipcodeCtrl = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   scrolledUnderElevation: 0,
      //   elevation: 0,
      //   automaticallyImplyLeading: false,
      // ),
      body: Form(
        key: _formKey,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.white,
          child: SizedBox(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            child: Padding(
              padding: const EdgeInsets.all(35.0),
              child: ListView(
                children: [
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 80,
                        ),
                        HelperText(
                          text: "Farm Info",
                          isfontWeightBold: true,
                          fontsize: 28,
                        ),
                        const SizedBox(
                          height: 45,
                        ),
                        CustomTextField(
                          textFilledWidth: double.infinity,

                          textFilledHeight: 90,
                          isRequired: true,
                          textStyle: TextStyle(color: primary),
                          cursorHeight: 30,

                          fillColor: Color.fromARGB(196, 237, 236, 236),
                          controller: businessNameCtrl,
                          keyboardType: TextInputType.name,
                          isborderSide: false,
                          isPrefix: true,
                          hintText: "Business Name",
                          prefix: Icon(Icons.sell_outlined),

                          // prefix: Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: HelperText(
                          //     text: '@', isfontWeightBold: true, textColor: Colors.black,
                          //     //               ),
                          //   ),
                          // ),
                        ),
                        CustomTextField(
                          textFilledWidth: double.infinity,

                          textFilledHeight: 90,
                          isRequired: true,
                          textStyle: TextStyle(color: primary),
                          cursorHeight: 30,

                          fillColor: Color.fromARGB(196, 237, 236, 236),
                          controller: informalNameCtrl,
                          keyboardType: TextInputType.name,
                          isborderSide: false,
                          isPrefix: true,
                          hintText: "Informal Name",
                          prefix: Icon(Icons.emoji_emotions_outlined),
                          // prefix: Padding(
                          //   padding: const EdgeInsets.all(8.0),
                          //   child: HelperText(
                          //     text: '@', isfontWeightBold: true,
                          //     textColor: Colors.black,
                          //     //               ),
                          //   ),
                          // ),
                        ),
                        CustomTextField(
                          textFilledWidth: double.infinity,
                          textFilledHeight: 90,
                          isRequired: true,
                          textStyle: TextStyle(color: primary),
                          cursorHeight: 30,
                          fillColor: Color.fromARGB(196, 237, 236, 236),
                          controller: streetAddCtrl,
                          keyboardType: TextInputType.name,
                          isborderSide: false,
                          isPrefix: true,
                          hintText: "Streeet Address",
                          prefix: Icon(Icons.home_outlined),
                        ),
                        CustomTextField(
                          textFilledWidth: double.infinity,

                          textFilledHeight: 90,
                          isRequired: true,

                          textStyle: TextStyle(color: primary),
                          cursorHeight: 30,

                          fillColor: Color.fromARGB(196, 237, 236, 236),

                          controller: cityAddCtrl,
                          keyboardType: TextInputType.name,

                          isborderSide: false,
                          isPrefix: true,
                          hintText: "City",

                          prefix: Icon(Icons.location_on_outlined),

                          //               ),
                        ),
                        SizedBox(
                          height: 80,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            // mainAxisSize: MainAxisSize.min,
                            // crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 50,
                                width: 165,
                                child: dropDownButton(
                                    isDropDwonContainer: true,
                                    context: context,
                                    controller: stateCtrl,
                                    listData: stateList),
                              ),
                              // CustomTextField(

                              //   textStyle: TextStyle(color: primary),
                              //   cursorHeight: 30,
                              //   textFilledHeight:960,
                              //   fillColor: Color.fromARGB(196, 237, 236, 236),

                              //   controller: conPassCtrl,
                              //   keyboardType: TextInputType.emailAddress,

                              //   isborderSide: false,
                              //   isPrefix: true,
                              //   hintText: "Re-enter Password",

                              //   prefix: Icon(Icons.lock_outline),

                              //   //               ),
                              // ),

                              CustomTextField(
                                // textFilledWidth: double.infinity,

                                textFilledHeight: 90,
                                isRequired: true,
                                textFilledWidth: 130,

                                textStyle: TextStyle(color: primary),
                                cursorHeight: 30,
                                fillColor: Color.fromARGB(196, 237, 236, 236),

                                controller: zipcodeCtrl,
                                keyboardType: TextInputType.number,

                                isborderSide: false,

                                hintText: "Enter Zipcode",

                                //               ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                            // height: 25,
                            ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 100,
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(Icons.arrow_back)),
                        SizedBox(
                          width: 220,
                          height: 50,
                          child: CustomButton(
                              borderRadius: 30,
                              backgroundColor: primary,
                              text: "Continue",
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  addAllDataInMap();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              VerificationDocs()));
                                }
                              }),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  addAllDataInMap() {
    farmInfoMap = {
      "business_name": businessNameCtrl.text.trim(),
      "informal_name": informalNameCtrl.text.trim(),
      "address": streetAddCtrl.text.trim(),
      "city": cityAddCtrl.text.trim(),
      "state": stateCtrl.text.trim(),
      "zip_code": int.parse(zipcodeCtrl.text.trim()),
    };
  }
}

Map<String, dynamic> farmInfoMap = {};
