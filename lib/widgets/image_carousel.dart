import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  final List<String> images = [
    'assets/banners/banner_1.png',
    'assets/banners/banner_1.png',
    'assets/banners/banner_1.png',
    'assets/banners/banner_1.png',
  ];

  final PageController controller = PageController();

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: images.length,
          itemBuilder: (context, index, realIndex) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                images[index],
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
              ),
            );
          },
          options: CarouselOptions(
            height: 130,
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            enlargeCenterPage: true,
            viewportFraction: 1,
            onPageChanged: (index, reason) {
              setState(() {
                _currentIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 12),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            images.length,
            (index) => Container(
              width: index == _currentIndex ? 22 : 5,
              height: 5,
              margin: const EdgeInsets.symmetric(horizontal: 4.0),
              decoration: BoxDecoration(
                shape: index != _currentIndex
                    ? BoxShape.circle
                    : BoxShape.rectangle,
                color: index == _currentIndex
                    ? const Color.fromARGB(255, 74, 183, 186)
                    : const Color.fromARGB(255, 105, 138, 140),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
