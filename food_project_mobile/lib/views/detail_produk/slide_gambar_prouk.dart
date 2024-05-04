import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SlideGambarProduk extends StatefulWidget {
  final List<String> listGambar;
  const SlideGambarProduk({super.key, required this.listGambar});

  @override
  State<SlideGambarProduk> createState() => _SlideGambarProdukState();
}

class _SlideGambarProdukState extends State<SlideGambarProduk> {
  int _page = 1;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          itemCount: widget.listGambar.length,
          itemBuilder: (context, index, realIndex) {
            final gambarUrl = widget.listGambar[index];
            return Image.network(
              gambarUrl,
              fit: BoxFit.cover,
              height: 230,
              width: double.infinity,
            );
          },
          options: CarouselOptions(
            viewportFraction: 1,
            enableInfiniteScroll: false,
            initialPage: 0,
            disableCenter: true,
            height: 230,
            onPageChanged: (index, reason) => setState(() => _page = ++index),
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(999),
              color: const Color(0xFFD9D9D9),
            ),
            child: Row(
              children: [
                Text(
                  _page.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3),
                  child: Text(
                    "/",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
                Text(
                  widget.listGambar.length.toString(),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
