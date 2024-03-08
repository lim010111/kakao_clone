import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:timer_builder/timer_builder.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TimerBuilder.periodic(
      const Duration(seconds: 1),
      builder: (context) {
        DateTime now = DateTime.now();
        return Text('${now.hour}시 ${now.minute}분',
            style: TextStyle(
              fontSize: 10.sp,
              color: const Color(0xffA6A6A6),
            ));
      },
    );
  }
}
