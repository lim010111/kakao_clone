import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kakao/screens/home_screen.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({
    super.key,
  });

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  int totalSeconds = 1;
  late Timer timer;

  void loading() {
    setState(() {});
    timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (totalSeconds < 0) {
        timer.cancel();
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomeScreen(),
            ));
      } else {
        setState(() {
          totalSeconds = totalSeconds - 1;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    loading();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xffFAE100),
        body: Center(
          child: Image.asset(
            'assets/images/logo.png',
            scale: 3.2,
          ),
        ),
      ),
    );
  }
}
