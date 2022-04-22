// ignore_for_file: unnecessary_string_interpolations

import 'package:conditional_builder_rec/conditional_builder_rec.dart';
import 'package:flutter/material.dart';
import 'package:h_care/modules/login/login_screen.dart';
import 'package:h_care/shared/componant/componant.dart';
import 'package:h_care/shared/style/color.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScren extends StatefulWidget {
  const OnBoardingScren({Key? key}) : super(key: key);

  @override
  _OnBoardingScrenState createState() => _OnBoardingScrenState();
}

class BoardingModel {
  late final String image1;
  late final String image2;
  late final String title;
  late final String body;

  BoardingModel(this.body, this.image1, this.image2, this.title);
}

class _OnBoardingScrenState extends State<OnBoardingScren> {
  var pageController = PageController();

  List<BoardingModel> boardigItem = [
    BoardingModel("body page 1", "assets/images/onboarding_1.png",
        "assets/images/onboarding_2.png", "Title page 1"),
    BoardingModel("body page 2", "assets/images/onboarding_3.png",
        "assets/images/onboarding_4.png", "Title page 2")
  ];

  bool isLast = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: AppBar(
        backgroundColor: mainColor ,
        actions: [
          TextButton(
            onPressed: () {
              navigatorPushAndReblace(context,  LoginScreen());
            },
            child: const Text('Skip',
                style: TextStyle(
                  color: Colors.white,
                )),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (index) {
                  if (index == boardigItem.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                  } else {
                    setState(() {
                      isLast = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                itemBuilder: (context, index) =>
                    onBoardingItemUi(boardigItem[index]),
                itemCount: boardigItem.length,
              ),
            ),
            const SizedBox(
              height: 60.0,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: boardigItem.length,
                  effect: ExpandingDotsEffect(
                      activeDotColor: HexColor("B1D0E0"),
                      dotHeight: 6.0,
                      dotWidth: 6.0,
                      spacing: 4.0,
                      expansionFactor: 4.0),
                ),
                const Spacer(),
                ConditionalBuilderRec(
                  builder: (context) => Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: TextButton(
                      onPressed: () =>
                          navigatorPushAndReblace(context,  LoginScreen()),
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: HexColor("B1D0E0"), fontSize: 18.0),
                      ),
                    ),
                  ),
                  condition: isLast == true,
                  fallback: (context) => FloatingActionButton(
                    backgroundColor: forthColor,
                    onPressed: () => pageController.nextPage(
                      duration: const Duration(milliseconds: 700),
                      curve: Curves.easeOutQuad,
                      
                    ),
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: mainColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget onBoardingItemUi(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Image(
                    image: AssetImage("${model.image1}"),
                  ),
                ),
                const SizedBox(
                  width: 10.0,
                ),
                Expanded(
                    child: Image(
                  image: AssetImage("${model.image2}"),
                )),
              ],
            ),
          ),
          Text(
            "${model.title}",
            style: const TextStyle(
              fontSize: 24.0,
              color: Colors.white,
            ),
          ),
          Text(
            "${model.body}",
            style: const TextStyle(
              fontSize: 14.0,
              color: Colors.white,
            ),
          ),
        ],
      );

  
}
