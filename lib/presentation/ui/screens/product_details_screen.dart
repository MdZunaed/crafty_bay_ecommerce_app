import 'package:crafty_bay/presentation/ui/screens/review_list_screen.dart';
import 'package:crafty_bay/presentation/ui/widgets/bottom_container.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/color_selector.dart';
import 'package:crafty_bay/presentation/ui/widgets/item_counter.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/product_image_slider.dart';
import 'package:crafty_bay/presentation/ui/widgets/product_details/size_selector.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../utility/app_colors.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  Color selectedColor = Colors.transparent;
  String selectedSize = "L";
  List colors = [
    Colors.black,
    Colors.teal,
    Colors.brown,
    Colors.amber,
    Colors.lightGreen,
  ];
  List sizes = [
    "S",
    "M",
    "L",
    "XL",
    "XXL",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Product Details"),
      ),
      body: Column(
        children: [
          const ProductImageSlider(),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: Text(
                            "Nike Shoe Happy new year deal, 30% discount",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                          ),
                        ),
                        ItemCounter(),
                      ],
                    ),
                    Row(
                      children: [
                        const Row(children: [Icon(Icons.star, size: 20, color: Colors.amber), Text("4.6")]),
                        TextButton(
                            onPressed: () {
                              Get.to(const ReviewListScreen());
                            },
                            child: const Text("Reviews")),
                        Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                          color: AppColors.primaryColor,
                          child: const Padding(
                            padding: EdgeInsets.all(3),
                            child: Icon(
                              Icons.favorite_outline,
                              size: 14,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                    Text("Color", style: titleTextStyle()),
                    const SizedBox(height: 5),
                    ColorSelector(
                        colors: colors,
                        onChange: (color) {
                          selectedColor = color;
                        }),
                    const SizedBox(height: 5),
                    Text("Size", style: titleTextStyle()),
                    const SizedBox(height: 5),
                    SizeSelector(
                        sizes: sizes,
                        onChange: (size) {
                          selectedSize = size;
                        }),
                    const SizedBox(height: 5),
                    Text("Description", style: titleTextStyle()),
                    const SizedBox(height: 5),
                    const Text(
                      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
                      style: TextStyle(color: Colors.black54),
                    )
                  ],
                ),
              ),
            ),
          ),
          addToCartContainer,
        ],
      ),
    );
  }

  TextStyle titleTextStyle() =>
      TextStyle(fontSize: 18, fontWeight: FontWeight.w600, color: Colors.grey.shade800);

  BottomContainer get addToCartContainer {
    return BottomContainer(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Price",
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w500, color: Colors.black54)),
              Text("\$100",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: AppColors.primaryColor)),
            ],
          ),
          FilledButton(
            onPressed: () {},
            child: const Text("Add to cart"),
          ),
        ],
      ),
    );
  }
}
