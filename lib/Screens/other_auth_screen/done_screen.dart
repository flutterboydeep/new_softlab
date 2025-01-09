import 'package:flutter/material.dart';

import '../../const/colors.dart';
import '../../utils/alert_dialog.dart';
import '../../utils/custom_button.dart';
import '../../utils/helper_text.dart';

class DoneScreen extends StatelessWidget {
  DoneScreen({super.key});

  TextEditingController businessNameCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        elevation: 0,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {
                alertDialog(context);
              },
              icon: Icon(Icons.power_settings_new_sharp)),
          SizedBox(
            width: 25,
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(35.0),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                ),
                SizedBox(
                    height: 120,
                    width: double.infinity,
                    child: Image(
                      image: AssetImage("assets/images/Vector.png"),
                      fit: BoxFit.fitHeight,
                    )),
                SizedBox(
                  height: 20,
                ),
                HelperText(
                  text: "You're all done!",
                  fontsize: 28,
                  isfontWeightBold: true,
                ),
                SizedBox(
                  height: 20,
                ),
                HelperText(
                  align: TextAlign.center,
                  text:
                      "Hang tight! We are currently reviewing your account and will follw up with you in 2-3 business days. In the meantime, you can setup your inventory. ",
                  fontsize: 12,
                  textColor: Colors.grey.shade400,
                ),
                const SizedBox(
                  height: 35,
                ),
                Expanded(child: SizedBox()),
                SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: CustomButton(
                      borderRadius: 30,
                      backgroundColor: primary,
                      text: "Got it!",
                      onPressed: () {}),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
