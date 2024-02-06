import 'package:carousel_slider/carousel_slider.dart';
import 'package:crafty_bay/presentation/ui/utility/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../data/models/banner_item_model.dart';

class BannerSlider extends StatefulWidget {
  final List<BannerItem> bannerList;

  const BannerSlider({super.key, required this.bannerList});

  @override
  State<BannerSlider> createState() => _BannerSliderState();
}

class _BannerSliderState extends State<BannerSlider> {
  final ValueNotifier<int> currentIndex = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
              height: 135,
              viewportFraction: 0.93,
              onPageChanged: (index, reason) {
                currentIndex.value = index;
              }),
          items: widget.bannerList.map((banner) {
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: screenWidth,
                  margin: const EdgeInsets.symmetric(horizontal: 5.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                    color: AppColors.primaryColor,
                    borderRadius: BorderRadius.circular(12),
                    image: DecorationImage(image: NetworkImage(banner.image ?? ''), fit: BoxFit.cover),
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: screenWidth / 2.2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(banner.title ?? '',
                                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                            Text(banner.shortDes ?? '', style: const TextStyle(fontSize: 12)),
                          ],
                        ),
                      ),
                    ],
                  ),

                  // child: Row(
                  //   children: [
                  //     Expanded(
                  //       child: Column(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Text(banner.title ?? '',
                  //               style: const TextStyle(
                  //                   color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)),
                  //           Text(banner.shortDes ?? '',
                  //               style: const TextStyle(color: Colors.white, fontSize: 12)),
                  //         ],
                  //       ),
                  //     ),
                  //     const SizedBox(width: 10),
                  //     Expanded(child: Image.network(banner.image ?? '')),
                  //   ],
                  // ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 6),
        ValueListenableBuilder(
          valueListenable: currentIndex,
          builder: (context, index, _) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 0; i < widget.bannerList.length; i++)
                  Container(
                    height: 12,
                    width: 12,
                    margin: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: i == index ? AppColors.primaryColor : Colors.transparent,
                      border: Border.all(color: i == index ? AppColors.primaryColor : Colors.grey),
                    ),
                  )
              ],
            );
          },
        )
      ],
    );
  }
}
