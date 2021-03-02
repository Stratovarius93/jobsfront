import 'package:AppWork/constants/sizes.dart';
import 'package:AppWork/generated/l10n.dart';
import 'package:AppWork/widgets/generics/loginSubtitle.dart';
import 'package:flutter/material.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class GenericLoginSwiper extends StatefulWidget {
  @override
  _GenericLoginSwiperState createState() => _GenericLoginSwiperState();
}

class _GenericLoginSwiperState extends State<GenericLoginSwiper> {
  List<String> images = [
    'assets/imgScreen1.png',
    'assets/imgScreen1.png',
    'assets/imgScreen1.png',
    'assets/imgScreen1.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: screenHeight(context) * 0.5,
      child: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Column(
            children: [
              Image.asset(
                images[index],
                fit: BoxFit.fill,
                width: screenWidth(context) * 0.5,
              ),
              SizedBox(
                height: 32,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 40),
                child: GenericLoginSubTitle(
                    title: S.current.page1Description,
                    textAlign: TextAlign.center),
              ),
            ],
          );
        },
        autoplay: true,
        itemCount: images.length,
        pagination: SwiperPagination(),

        indicatorLayout: PageIndicatorLayout.SCALE,
        //control: SwiperControl(),
      ),
    );
  }
}
