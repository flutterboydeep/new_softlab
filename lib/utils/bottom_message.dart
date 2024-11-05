import 'package:flutter/material.dart';

scaffoldMessage({required context, required String message}){
  return ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));

}