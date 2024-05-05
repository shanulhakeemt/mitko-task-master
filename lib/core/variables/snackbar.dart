
import 'package:flutter/material.dart';

showSnackBar({required String message,required BuildContext context}){
  final showSnackBar=SnackBar(content: Text(message));
  return ScaffoldMessenger.of(context).showSnackBar(showSnackBar);
}