import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao/screens/chat_screen.dart';

class GuestMessageBox extends StatelessWidget {
  final int index;
  final String guestName;

  const GuestMessageBox({
    super.key,
    required this.index,
    required this.guestName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      child: Align(
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(15)),
              child: Image.asset(
                'assets/images/profile.jpeg',
                scale: 8,
              ),
            ),
            SizedBox(
              width: 5.w,
            ),
            Wrap(children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.66,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      guestName,
                      style: TextStyle(fontSize: 8.sp),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 8.w, vertical: 7),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Text(
                        ChatScreen.inputList[index],
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ],
        ),
      ),
    );
  }
}
