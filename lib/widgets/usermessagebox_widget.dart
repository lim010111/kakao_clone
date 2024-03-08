import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao/screens/chat_screen.dart';

class UserMessageBox extends StatelessWidget {
  final int index;

  const UserMessageBox({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      child: Align(
        alignment: Alignment.topRight,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7),
          decoration: BoxDecoration(
            color: const Color(0xffFEEB34),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Text(
            ChatScreen.inputList[index],
          ),
        ),
      ),
    );
  }
}
