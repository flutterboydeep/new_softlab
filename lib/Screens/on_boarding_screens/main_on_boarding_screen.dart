import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../const/colors.dart';

import '../../sharedPref/shared_pref.dart';

import '../../utils/custom_button.dart';
import '../../utils/helper_text.dart';
import '../auth_screen/sign_in_screen.dart';

class MainOnBoardingScreen extends StatefulWidget {
  const MainOnBoardingScreen({super.key});

  @override
  State<MainOnBoardingScreen> createState() => _MainOnBoardingScreenState();
}

class _MainOnBoardingScreenState extends State<MainOnBoardingScreen> {
  SharedPreferencesHelper sharedPreferences = SharedPreferencesHelper();
  PageController pageController = PageController();
  int selectedIdx = 0;
  List onBoardingData = [
    {
      "image": "assets/images/Group 44.png",
      "headingText": " Quality",
      "subtitleText":
          "Sell your farm fresh products directly to consumers, cutting out the middleman and reducing emissions of the global supply chain"
    },
    {
      "image": "assets/images/Group.png",
      "headingText": "Convenient",
      "subtitleText":
          "Our team of delivery drivers will make sure your orders are picked up on time and promptly delivered to your customers."
    },
    {
      "image": "assets/images/Group 46.png",
      "headingText": "Local",
      "subtitleText":
          "We love the earth and know you do tool join us in reducing our local carbon footprint one order at time."
    },
  ];
  Widget animationDo(
    int index,
    int delay,
    Widget child,
  ) {
    if (index == 1) {
      return FadeInDown(
        delay: Duration(milliseconds: delay),
        child: child,
      );
    }
    return FadeInUp(
      delay: Duration(milliseconds: delay),
      child: child,
    );
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(

          // allowImplicitScrolling: true,
          physics: BouncingScrollPhysics(),
          controller: pageController,
          itemCount: 3,
          onPageChanged: (newIndex) {
            setState(() {
              currentIndex = newIndex;
            });
          },
          itemBuilder: (context, index) {
            changeIndex(index);

            return AnimatedContainer(
                duration: Duration(seconds: 1),
                height: double.infinity,
                width: double.infinity,
                color: index == 0
                    ? tertiary
                    : index == 2
                        ? primary
                        : secondary,
                child: Stack(
                  children: [
                    AnimatedContainer(
                        duration: Duration(seconds: 2),
                        // decoration:
                        //     BoxDecoration(border: Border.all(width: 2, color: primary)),
                        height: 400,
                        width: double.infinity,
                        child: Align(
                            alignment: Alignment.topCenter,
                            child: animationDo(
                              index,
                              100,
                              Image(
                                image: AssetImage(
                                    onBoardingData[index]['image'].toString()),
                              ),
                            ))),
                    Positioned(
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: BottomSheet(
                        enableDrag: false,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(49),
                                topRight: Radius.circular(49))),
                        backgroundColor: whiteText,
                        builder: (context) {
                          return Container(
                            height: 400,
                            child: Padding(
                              padding: const EdgeInsets.all(40.0),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  animationDo(
                                    index,
                                    100,
                                    HelperText(
                                      text: onBoardingData[index]['headingText']
                                          .toString(),
                                      fontsize: 25,
                                      isfontWeightBold: true,
                                    ),
                                  ),
                                  animationDo(
                                    index,
                                    100,
                                    HelperText(
                                      align: TextAlign.center,
                                      fontsize: 13,
                                      text: onBoardingData[index]
                                              ['subtitleText']
                                          .toString(),
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                  // animationDo(
                                  //     index,100,
                                  SmoothPageIndicator(
                                    controller: pageController,
                                    count: onBoardingData.length,
                                    effect: const ExpandingDotsEffect(
                                      spacing: 6.0,
                                      radius: 10.0,
                                      dotWidth: 10.0,
                                      dotHeight: 10.0,
                                      expansionFactor: 3.8,
                                      dotColor: Colors.grey,
                                      activeDotColor: Colors.black,
                                    ),
                                    onDotClicked: (newIndex) {
                                      setState(() {
                                        currentIndex = newIndex;
                                        pageController.animateToPage(newIndex,
                                            duration: const Duration(
                                                milliseconds: 500),
                                            curve: Curves.ease);
                                      });
                                    },
                                  ),
                                  // ),
                                  //  animationDo(

                                  //  index,100,
                                  SizedBox(
                                    width: 250,
                                    height: 60,
                                    child: CustomButton(
                                        borderRadius: 30,
                                        backgroundColor: index == 0
                                            ? tertiary
                                            : index == 1
                                                ? primary
                                                : secondary,
                                        text: "Join the Movement!",
                                        onPressed: () {
                                          if (index == 2) {
                                            SharedPreferencesHelper
                                                .setFirstTime(
                                                    isFirstTime: false);
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        SignInScreen()));
                                          } else {
                                            pageController
                                                .jumpToPage(index + 1);
                                          }
                                        }),
                                  ),
                                  // ),
                                  InkWell(
                                    onTap: () {
                                      SharedPreferencesHelper.setFirstTime(
                                          isFirstTime: false);
                                      Navigator.pushAndRemoveUntil(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SignInScreen()),
                                          (Route<dynamic> route) => false);
                                    },
                                    child:
                                        // animationDo(
                                        // index,100,
                                        HelperText(
                                      text: "Login",
                                      isUnderline: true,
                                      fontsize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  // )
                                ],
                              ),
                            ),
                          );
                        },
                        onClosing: () {
                          log("bottom sheet is closing");
                        },
                      ),
                    ),
                  ],
                )
                // children: [
                //   OnBoarding1Screen(),
                //   OnBoarding2Screen(),
                //   OnBoarding3Screen()
                // ],

                );
          }),
    );
  }

  changeIndex(index) {
    // log("This is index value $index");

    //   selectedIdx=index;
    // print();
  }
}
