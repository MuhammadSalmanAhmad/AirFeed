import 'package:flutter/material.dart';
import 'package:air_feed/onborading_screen_pages/pageone.dart';
import 'package:air_feed/onborading_screen_pages/pagetwo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:air_feed/onborading_screen_pages/page_three.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: const [PageOne(), PageTwo(), PageThree()],
          ),
          Container(
              alignment: const Alignment(0, 0.75),
              child: SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const ScrollingDotsEffect(
                    activeDotColor: Color.fromARGB(255, 8, 121, 110),
                    dotColor: Color.fromARGB(255, 105, 232, 204)),
              ))
        ],
      ),
    );
  }
}
