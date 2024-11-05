import 'dart:developer';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

 Future<String>pickImage() async {
  var data;
  try {
     await FilePicker.platform.pickFiles().then((result) {
      if (result == null) {
        return "";
      } else {
          log("this  is data ${result.files.first.name}");
          data=result.files.first.name;
        return  result.files.first.name.toString();
      }
    });
  } catch (e) {
    log("error in picker is $e");
    return"";

    // return e.toString();
  }
return data;
}

Future pickImageForSignature() async {
  try {
     await FilePicker.platform.pickFiles().then((result) {
      if (result == null) {
        return null;
      } else {
    var image= Image.memory(result.files.first.bytes!,fit: BoxFit.fitWidth,);
    
        return image;
      }
    });
  } catch (e) {
    log("error in picker is $e");
    // return e.toString();
  }
}