import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class HomeBanner extends StatelessWidget {
  final TextEditingController searchController;
  final Function(String value) onChanged;
  const HomeBanner({
    super.key,
    required this.searchController,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider(
          items: [
            Image.asset(
              "assets/images/banner_1.png",
              width: double.infinity,
            ),
            Image.asset(
              "assets/images/banner_2.png",
              width: double.infinity,
            ),
            Image.asset(
              "assets/images/banner_3.png",
              width: double.infinity,
            ),
          ],
          options: CarouselOptions(
            viewportFraction: 1,
            enableInfiniteScroll: false,
            initialPage: 0,
            disableCenter: true,
            aspectRatio: 16 / 10.9,
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(20, 230, 20, 30),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  offset: const Offset(0, 4),
                  color: Colors.black.withOpacity(.3),
                )
              ],
            ),
            child: TextField(
              controller: searchController,
              onChanged: onChanged,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFF4EDED),
                isCollapsed: true,
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 20,
                ),
                prefixIcon: const Icon(Icons.search_rounded),
                enabledBorder: buildSearchBorder(),
                focusedBorder: buildSearchBorder(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  InputBorder buildSearchBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    );
  }
}
