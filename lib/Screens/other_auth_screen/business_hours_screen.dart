import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:new_softlab/Screens/other_auth_screen/frame_info.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../../const/colors.dart';

import '../../data/api/api_value.dart';

import '../../utils/custom_button.dart';
import '../../utils/helper_text.dart';
import '../auth_screen/sign_in_screen.dart';
import '../auth_screen/sign_up_screen.dart';

List dayFirstNameList = ['M', 'T', 'W', 'Th', 'F', 'S', 'Su'];
List dayList = ['mon', 'tue', 'wed', 'thu', 'fri', 'sat', 'sun'];
final Map<String, dynamic> businessHours = {
  'mon': [],
  'tue': [],
  'wed': [],
  'thu': [],
  'fri': [],
  'sat': [],
  'sun': [],
};

class BusinessHours extends StatefulWidget {
  const BusinessHours({super.key});

  @override
  State<BusinessHours> createState() => _BusinessHoursState();
}

class _BusinessHoursState extends State<BusinessHours> {
  ApiContainer apiContainer = ApiContainer();
  updateBusinessHours(String day, List<String> timeSlot, String timeStamp) {
    if (businessHours[day]!.contains(timeStamp)) {
      businessHours[day]!.remove(timeStamp);
    } else {
      businessHours[day]!.add(timeStamp);
    }
  }

  final List<String> _timeSlots = [
    '8:00am - 10:00am',
    '10:00am - 1:00pm',
    '1:00pm - 4:00pm',
    '4:00pm - 7:00pm',
    '7:00pm - 10:00pm',
  ];

  int selectedDayValue = 0;
  String selectedDay = 'mon';
  List<String> selectdTimeStamp = [];

  TextEditingController businessNameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              HelperText(
                text: "Business Hours",
                isfontWeightBold: true,
                fontsize: 28,
              ),
              const SizedBox(
                height: 25,
              ),
              HelperText(
                text:
                    "Choose the hours your farm is open for pickups. This will allow customers to order deliveries",
                fontsize: 12,
                textColor: Colors.grey.shade400,
              ),
              const SizedBox(
                height: 35,
              ),
              SizedBox(
                height: 60,
                width: double.infinity,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: dayFirstNameList.length,
                    itemBuilder: (context, index) {
                      final isSelectedDay = selectedDayValue == index;
                      return Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: InkWell(
                          onTap: () {
                            selectdTimeStamp.clear();
                            setState(() {
                              selectedDay = dayList[index];
                              selectedDayValue = index;
                            });
                            // if(selectedDay==index){
                            //   isSelectedDay=true;
                            //   setState(() {

                            //   });
                            // }
                            // else{
                            //   isSelectedDay=false;
                            //   setState(() {

                            //   });
                            // }
                          },
                          child: Container(
                            height: 50,
                            width: 43,
                            decoration: BoxDecoration(
                              border: businessHours[dayList[index]].isEmpty
                                  ? Border.all(
                                      width: 1, color: Colors.grey.shade400)
                                  : null,
                              borderRadius: BorderRadius.circular(11),
                              color: isSelectedDay
                                  ? primary
                                  : businessHours[dayList[index]].isEmpty
                                      ? Colors.white
                                      : Color.fromARGB(196, 237, 236, 236),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Center(
                                  child: HelperText(
                                text: dayFirstNameList[index],
                                fontsize: 15,
                                textColor:
                                    isSelectedDay ? whiteText : blackText,
                              )),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              GridView.builder(
                  // scrollDirection: Axis.horizontal,
                  // physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 250, mainAxisExtent: 70),
                  shrinkWrap: true,
                  itemCount: _timeSlots.length,
                  itemBuilder: (context, index) {
                    // final isSelectedDay= selectedDay==index;
                    return Padding(
                      padding: const EdgeInsets.all(9.0),
                      child: InkWell(
                        onTap: () {
                          final onTapIndexvalue = index;
                          if (selectdTimeStamp.contains(_timeSlots[index])) {
                            setState(() {
                              selectdTimeStamp.remove(_timeSlots[index]);
                            });
                          } else {
                            setState(() {
                              selectdTimeStamp.add(_timeSlots[index]);
                            });
                          }
                          print(onTapIndexvalue);
                          log("This is selected day $selectedDay and this is selcted timeStamp=${selectdTimeStamp}");
                          updateBusinessHours(selectedDay, selectdTimeStamp,
                              _timeSlots[onTapIndexvalue]);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              // color: selectdTimeStamp.contains(_timeSlots[index])
                              //     ? Color.fromARGB(158, 255, 235, 59)
                              //     : null,
                              color: businessHours[selectedDay]!
                                      .contains(_timeSlots[index])
                                  ? secondary
                                  : Color.fromARGB(196, 237, 236, 236),
                              borderRadius: BorderRadius.circular(11)),
                          child: Center(
                              child: HelperText(
                            text: _timeSlots[index],
                            fontFamily: 'vaitnam',
                            fontsize: 12,
                            isfontWeightBold: false,
                            fontWeight: FontWeight.normal,
                          )),
                        ),
                      ),
                    );
                  }),
              Expanded(child: SizedBox()),
              Row(
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
                        text: "Signup",
                        onPressed: () async {
                          final SharedPreferences prefs =
                              await SharedPreferences.getInstance();

                          Map businessHoursMap = {
                            "business_hours": businessHours,
                          };
                          Map combinationMap = {
                            ...signUpMap,
                            ...farmInfoMap,
                            ...businessHoursMap,
                          };
                          log(combinationMap.toString());
                          var res =
                              await apiContainer.signUp(data: combinationMap);
                          if (res['success'] == true) {
                            prefs.setString(
                                "authToken", res['token'].toString());

                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SignInScreen()));
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text(res['message'])));
                          }
                        }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
