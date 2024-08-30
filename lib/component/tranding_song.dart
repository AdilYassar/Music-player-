import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class TrendingSongSlider extends StatelessWidget {
  const TrendingSongSlider({super.key});

  @override
  Widget build(BuildContext context) {
    List<Widget> sliderItem = [
      Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage("assets/icons/1853963.png"),
            fit: BoxFit.contain,
          ),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Align(
            alignment: Alignment.topLeft,
          ),
        ),
      ),
    ];

    return SizedBox(
      height: 250.0,
      child: CarouselSlider(
        items: sliderItem,
        options: CarouselOptions(
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 5),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, reason) {},
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
