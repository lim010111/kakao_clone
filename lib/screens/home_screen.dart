import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:kakao/custom_icons_icons.dart';
import 'package:kakao/widgets/chat_info_widget.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final String guestName = "임우현1";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '채팅',
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 20.sp,
              ),
            ),
            Transform.translate(
              offset: Offset(12.sp, 0),
              child: Row(
                children: [
                  IconButton(
                    iconSize: 19.sp,
                    onPressed: () {},
                    icon: const Icon(CustomIcons.search),
                  ),
                  IconButton(
                    iconSize: 28.sp,
                    onPressed: () {},
                    icon: const Icon(Icons.playlist_add),
                  ),
                  IconButton(
                    iconSize: 18.sp,
                    onPressed: () {},
                    icon: const Icon(
                      CustomIcons.cog_outline,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 14.sp),
        child: Column(
          children: [
            // ListView.builder(
            //   itemCount: 2,
            //   itemBuilder: (context, index) {
            //     return [
            //       ChatInfoWidget(
            //         guestName: guestName,
            //       ),
            //       ChatInfoWidget(
            //         guestName: guestName,
            //       )
            //     ][index];
            //   },
            // ),
            ChatInfoWidget(
              guestName: guestName,
            ),
          ],
        ),
      ),
    );
  }
}
