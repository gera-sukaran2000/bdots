import 'package:bdots/provider/data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class getContainer extends StatelessWidget {
  UserData singleObject;

  getContainer(this.singleObject);

  @override
  Widget build(BuildContext context) {
    final kInnerDecoration = BoxDecoration(
      color: Colors.white,
      border: Border.all(color: Colors.white),
      borderRadius: BorderRadius.circular(15.r),
    );

    final kGradientBoxDecoration = BoxDecoration(
      gradient:
          LinearGradient(colors: [Colors.orange.shade400, Colors.red.shade400]),
      border: Border.all(
        color: Colors.transparent,
      ),
      borderRadius: BorderRadius.circular(15.r),
    );

    return Padding(
      padding: EdgeInsets.only(left: 20.w, right: 20.w),
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
        elevation: 5,
        child: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(1.0),
            child: Container(
              alignment: Alignment.center,
              child: Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  CircleAvatar(
                    foregroundImage: NetworkImage(singleObject.avatar_url),
                    radius: 27.r,
                    backgroundColor: Colors.transparent,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '${singleObject.first_Name} ${singleObject.last_Name}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Text(
                        singleObject.email,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              decoration: kInnerDecoration,
            ),
          ),
          height: 90.h,
          width: double.infinity,
          decoration: kGradientBoxDecoration,
        ),
      ),
    );
  }
}
