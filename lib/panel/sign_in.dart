import 'package:college_gate/panel/gaurd/gaurd_home.dart';
import 'package:college_gate/panel/guest/guesthome.dart';
import 'package:college_gate/panel/student/complete_profile.dart';
import 'package:college_gate/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SignIn extends StatefulWidget {
  //neeche nhi kiya because it's a constructor for sate widget;
  //we are passing value inside the widget itself no the state object

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  final AuthMethods _aut = AuthMethods();
  String email = '';
  String password = '';
  String error = '';
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    //double widthMobile = MediaQuery.of(context).size.width;
    //double heightMobile = MediaQuery.of(context).size.height;
    return loading
        ? CircularProgressIndicator()
        : Scaffold(
            appBar: AppBar(
              toolbarHeight: 56.h,
              backgroundColor: Color(0Xff15609c),
              centerTitle: true,
              title: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                      height: 24.h,
                      child: Image.asset("assets/cg_white.png")),
                  SizedBox(
                    width: 12.w,
                  ),
                  Text("College Gate",
                      style: TextStyle(fontSize: 24.sp)),
                ],
              ),
            ),
            body: Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
              child: Form(
                key: _formKey,
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Image.asset(
                        "assets/collegegate-01.png",
                        height: 400.h,
                        width: 220.w,
                      ),

                      Center(
                        child: GestureDetector(
                          onTap: () {
                            AuthMethods().signInWithGoogle(context);
                          },
                          child: Container(
                            height: 55.h,
                            //width: ,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24.r),
                              color: Colors.green,
                            ),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 5.h),
                            child: Center(
                              child: Text(
                                "Sign in with Google",
                                style: TextStyle(
                                    fontSize: 16.sp, color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                          height: 15.h),
                      Row(children: <Widget>[
                        Expanded(child: Divider()),
                        Text(
                          "or",
                          style: TextStyle(color: Colors.grey,fontSize: 14.sp),
                        ),
                        Expanded(child: Divider()),
                      ]),
                      SizedBox(
                          height: 15.h),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => GuestHome()));
                        },
                        child: Container(
                          height: 55.h,
                          //width: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24.r),
                            color: Color(0Xff15609c),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 16.w, vertical: 5.h),
                          child: Center(
                            child: Text(
                              "Continue as Guest",
                              style:
                                  TextStyle(fontSize: 16.sp, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 10,),
                      GestureDetector(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => gaurdHome()));
                        },
                        child: Container(
                          height: 50,
                          //width: MediaQuery.of(context).size.width * 0.6,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(24),
                            color: Color(0Xff15609c),
                          ),
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: Center(
                            child: Text(
                              "Continue as Guard",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        error,
                        style: TextStyle(color: Colors.red, fontSize: 14.sp),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
