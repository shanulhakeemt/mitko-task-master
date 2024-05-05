import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../core/variables/mediaQuery.dart';

class DataDetailScreen extends StatefulWidget {
  const DataDetailScreen({super.key});

  @override
  State<DataDetailScreen> createState() => _DataDetailScreenState();
}

class _DataDetailScreenState extends State<DataDetailScreen> {
  TextEditingController comment=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton:  FloatingActionButton(
      onPressed: () {

      },
      backgroundColor:
     Colors.blueAccent,
      child: Text('Save',
          style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: w * 0.05),)
    ),
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            CupertinoIcons.back,
            color: Colors.white,
          ),
        ),
        title: Text('History',
            style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontSize: w * 0.06),),
        actions: [Icon(Icons.share,color: Colors.blueAccent,),SizedBox(width: w*0.05,)],
      ),
      body: Padding(
        padding:  EdgeInsets.only(left: w*0.04,right: w*0.04),
        child: Container(height: h,width: w,child:SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: h*0.02,),
              Container(height: h*0.5,width: w,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white12),child:
                Column(children: [
                  Container(height: h*0.13,decoration: BoxDecoration(borderRadius: BorderRadius.only(topRight: Radius.circular(10),topLeft: Radius.circular(10)),color: Colors.blueAccent,),)
                ],),),
              SizedBox(height: h*0.02,),
              Text('select Status',
                  style: TextStyle(
                  color: Colors.white12,
                  fontWeight: FontWeight.w500,
                  fontSize: w * 0.035),),
              SizedBox(height: h*0.02,),
              Container(height: h*0.06,width: w,decoration: BoxDecoration(color: Colors.white12,borderRadius: BorderRadius.circular(10)),),
              SizedBox(height:h*0.02),
              Text('Comments'),SizedBox(height: h*0.02,),
              Container(
                height: h * 0.2,decoration: BoxDecoration(                    borderRadius: BorderRadius.circular(30),
         color: Colors.white12),
                // color: Colors.red,
                child: TextFormField(inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z\s]')),
                ],
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'please enter your leave ';
                    }
                    return null;
                  },
                  cursorColor: Colors.white12,
                  minLines: 30,
                  textCapitalization: TextCapitalization.sentences,
                  maxLines: null,
                  controller: comment,
                  style: TextStyle(color: const Color(0xffAFAFAF)),
                  maxLength: null,
                  keyboardType: TextInputType.multiline,
                  decoration: InputDecoration(
                    hintText: "ENTER ",
                    hintStyle: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Colors.white30,
                        fontSize: h * 0.02),
                    // labelText: "ENTER YOUR TEXT.............",
                    // labelStyle: GoogleFonts.nunitoSans(fontWeight: FontWeight.w400,color: greyColor,fontSize: h*0.015),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                            color: Colors.transparent,
                            style: BorderStyle.solid)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(4),
                        borderSide: const BorderSide(
                            color: Colors.transparent,
                            style: BorderStyle.solid)),
                    // floatingLabelBehavior: FloatingLabelBehavior.always
                  ),
                ),
              ),
              SizedBox(height: h*0.05,),  InkWell(onTap: (){},
                child: Container(
                  height: h * 0.07,
                  width: w,
                  padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'SignIn',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ) ,),
      ),
    );
  }
}
