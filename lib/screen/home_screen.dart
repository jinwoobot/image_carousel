import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}
class _HomeScreenState  extends State<HomeScreen> {
  final PageController pageController = PageController();

  // initSate() 함수등록
  @override
  void initState() {
    super.initState();

    Timer.periodic(
      Duration(seconds: 3),
        (timer) {
        int? nextPage = pageController.page?.toInt();
        // null 일때는 null이 들어가고 값이 있으면 toInt()를 하겠다는 뜻
        // int? 는 변수가 null일 수도있고 아닐 수도 있다는 것

        if (nextPage == null) {
          return;
        }

        if (nextPage == 4){
          nextPage = 0;
        } else {
          nextPage++;
        }
        pageController.animateToPage(
          nextPage,
          duration: Duration(milliseconds: 500),
          curve: Curves.ease,
        );
        },
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [1,2,3,4,5]
            .map((number) => Image.asset('assets/img/image_$number.jpeg', fit: BoxFit.cover),).toList(),
      ),
    );
  }
}
