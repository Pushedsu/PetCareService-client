import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';

import '../../connect/connect_server.dart';
import '../../module/response/response_model.dart';
import '../../providers/user_info_provider.dart';

class ProfilePage extends StatelessWidget {
  static final storage = FlutterSecureStorage();

  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    UserInfoProvider userInfoController = Provider.of<UserInfoProvider>(context);
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150.w,
                height: 150.h,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.7),
                      spreadRadius: 0,
                      blurRadius: 5.0,
                      offset: Offset(0, 10),
                    ),
                  ], color: Colors.teal,
                ),
                child: Center(
                  child: Icon(Icons.person,size: 100.sp,),
                ),
              ),
              SizedBox(height: 20.h,),
              Text(
                '${userInfoController.getName()}',
                style: TextStyle(
                    color: Colors.teal,
                    fontSize: 40.sp,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 60.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 65.h,
                  width: 400.w,
                  child: Center(
                    child: Text(
                      '?????? ?????? ??????',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(left: 37.w, right: 37.w),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 0,
                          blurRadius: 5.0,
                          offset: Offset(0, 10), // changes position of shadow
                        ),
                      ],
                      color: Colors.teal,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 65.h,
                  width: 400.w,
                  child: Center(
                    child: Text(
                      '??? ??? ??????',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(left: 37.w, right: 37.w),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 0,
                          blurRadius: 5.0,
                          offset: Offset(0, 10), // changes position of shadow
                        ),
                      ],
                      color: Colors.teal,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () async {
                  var response = await Delete().logout(userInfoController.getObjId());
                  if(response.statusCode == 200 ) {
                    ResIsBoolSuccessModel res = ResIsBoolSuccessModel.fromJson(jsonDecode(response.body));
                    print('???????????? api ?????? ??????: ${res.success}');
                    storage.deleteAll();
                    Navigator.pushNamed(context, '/login');
                  } else {
                    ResIsBoolFail res = ResIsBoolFail.fromJson(jsonDecode(response.body));
                    showDialog(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          title: Text('${res.message}'),
                          content: Text('?????? ???????????????'),
                          actions: <Widget>[
                            TextButton(
                                onPressed: () => Navigator.pop(context),
                                child: Text('Ok')),
                          ],
                        )
                    );
                  }
                },
                child: Container(
                  height: 65.h,
                  width: 400.w,
                  child: Center(
                    child: Text(
                      '????????????',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(left: 37.w, right: 37.w),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 0,
                          blurRadius: 5.0,
                          offset: Offset(0, 10), // changes position of shadow
                        ),
                      ],
                      color: Colors.teal,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushReplacementNamed(context, '/delete');
                },
                child: Container(
                  height: 65.h,
                  width: 400.w,
                  child: Center(
                    child: Text(
                      '?????? ??????',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  margin: EdgeInsets.only(left: 37.w, right: 37.w),
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.7),
                          spreadRadius: 0,
                          blurRadius: 5.0,
                          offset: Offset(0, 10), // changes position of shadow
                        ),
                      ],
                      color: Colors.teal,
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
