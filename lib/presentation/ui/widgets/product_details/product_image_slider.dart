import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';

class ProductImageSlider extends StatefulWidget {
  const ProductImageSlider({super.key});

  @override
  State<ProductImageSlider> createState() => _ProductImageSliderState();
}

class _ProductImageSliderState extends State<ProductImageSlider> {
  final ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 200,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                currentIndex.value = index;
              }),
          items: [1, 2, 3, 4, 5].map((i) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(color: Colors.grey),
                  child: Center(
                    child: Text(
                      'text $i',
                      style: const TextStyle(fontSize: 16.0),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 12,
          child: ValueListenableBuilder(
            valueListenable: currentIndex,
            builder: (context, index, _) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  for (int i = 0; i < 5; i++)
                    Container(
                      height: 12,
                      width: 12,
                      margin: const EdgeInsets.all(2),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: i == index ? AppColors.primaryColor : Colors.transparent,
                        border: Border.all(color: i == index ? AppColors.primaryColor : Colors.white),
                      ),
                    ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
