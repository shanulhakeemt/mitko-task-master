import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mitco_task/core/common_bloc/order_model_bloc.dart';
import 'package:mitco_task/core/variables/snackbar.dart';
import 'package:mitco_task/features/auth/screen/bloc/auth_screen_bloc.dart';
import 'package:mitco_task/features/model_class/order_model_class.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../core/variables/mediaQuery.dart';
import '../../home/screen/home_screen.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController password = TextEditingController();
  TextEditingController emil = TextEditingController();

  checkId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey('orderId')) {
      final res = preferences.getString('orderId');
      final myUserId =
          await FirebaseFirestore.instance.collection('order').doc(res).get();
      final orderModel = OrderModel.fromMap(myUserId as Map<String, dynamic>);
      // context.read<OrderModelBloc>().add(OrderEvent(orderModel: orderModel));
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
          (route) => false);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // Future.delayed(Duration(milliseconds: 3),() => checkId(),);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: w * 0.05, right: w * 0.05),
          child: SizedBox(
            height: h * 0.85,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: h * 0.15,
                  ),
                  Text(
                    'Sign In',
                    style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: w * 0.07,
                        color: Colors.white),
                  ),
                  SizedBox(
                    height: h * 0.007,
                  ),
                  Container(
                    height: h * 0.01,
                    width: w * 0.13,
                    decoration: const BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Text(
                    'Free tools to sky_rocket your creative fredom',
                    style: TextStyle(fontSize: w * 0.04, color: Colors.grey),
                  ),
                  Text(
                    'image generator',
                    style: TextStyle(fontSize: w * 0.04, color: Colors.grey),
                  ),
                  SizedBox(
                    height: h * 0.08,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: emil,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            CupertinoIcons.mail,
                            color: Colors.blueAccent,
                          ),
                          hintText: 'Email',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                    decoration: BoxDecoration(
                      color: Colors.white12,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextFormField(
                      controller: password,
                      style: const TextStyle(color: Colors.white),
                      decoration: const InputDecoration(
                          border: InputBorder.none,
                          prefixIcon: Icon(
                            Icons.lock_outline,
                            color: Colors.blueAccent,
                          ),
                          suffixIcon: Icon(CupertinoIcons.eye),
                          hintText: 'Password',
                          hintStyle: TextStyle(color: Colors.grey)),
                    ),
                  ),
                  SizedBox(
                    height: h * 0.02,
                  ),
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        'forgot password?',
                        style: TextStyle(
                            color: Colors.white30, fontSize: w * 0.03),
                      )),
                  SizedBox(
                    height: h * 0.05,
                  ),
                  BlocConsumer<AuthScreenBloc, AuthScreenState>(
                    listener: (context, state) async {
                      if (state is AuthSuccess) {

                          SharedPreferences preferences = await SharedPreferences.getInstance();
            preferences.setString('orderId', state.orderModel.orderId);
        
  if(context.mounted){
    context.read<OrderModelBloc>().add(OrderEvent(orderModel: state.orderModel));
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()),
                            (route) => false);
}

                      }
                      if (state is AuthFailure) {
                        print("att faill");
                        showSnackBar(message: state.message, context: context);
                      }
                    },
                    builder: (context, state) {
                      if (state is AuthLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return InkWell(
                        onTap: () {
                          if (password.text.trim().isNotEmpty ||
                              emil.text.trim().isNotEmpty) {
                            context.read<AuthScreenBloc>().add(AuthSignIn(
                                password: password.text.trim(),
                                email: emil.text.trim()));
                          }
                        },
                        child: Container(
                          height: h * 0.07,
                          width: w,
                          padding: EdgeInsets.symmetric(horizontal: w * 0.05),
                          decoration: BoxDecoration(
                            color: Colors.blueAccent,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Center(
                            child: Text(
                              'SignIn',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: h * 0.04,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text('Dont have an account?',
                        style: TextStyle(
                            color: Colors.white60, fontSize: w * 0.04)),
                  ),
                  SizedBox(
                    height: h * 0.03,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text('SignUp',
                        style: TextStyle(
                            color: Colors.blueAccent, fontSize: w * 0.05)),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
