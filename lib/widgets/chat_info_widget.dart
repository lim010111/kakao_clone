import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao/screens/chat_screen.dart';
import 'package:kakao/widgets/timer_widget.dart';

class ChatInfoWidget extends ConsumerStatefulWidget {
  final String guestName;

  const ChatInfoWidget({
    super.key,
    required this.guestName,
  });

  @override
  ConsumerState<ChatInfoWidget> createState() => _ChatInfoWidgetState();
}

class _ChatInfoWidgetState extends ConsumerState<ChatInfoWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            // ignore: prefer_const_constructors
            builder: (context) => ChatScreen(),
          ),
        ).then((value) {
          setState(() {});
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 11.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              clipBehavior: Clip.hardEdge,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20)),
              child: Image.asset(
                'assets/images/profile.jpeg',
                scale: 6,
              ),
            ),
            SizedBox(
              width: 12.w,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.guestName),
                  Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.sp),
                    child: Text(
                      ChatScreen.inputList.isNotEmpty
                          ? ChatScreen.inputList.first
                          : " ",
                      style: TextStyle(
                        fontSize: 10.sp,
                        color: const Color(0xffA6A6A6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const TimerWidget()
          ],
        ),
      ),
    );
  }
}
