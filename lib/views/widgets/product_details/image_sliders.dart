import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/product_detail_controller.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ImageSliders extends StatelessWidget {
  final String urlImage;
  ImageSliders({
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  final controller = Get.put(ProductDetailController());

  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Stack(
        children: [
          CarouselSlider.builder(
            itemBuilder: (BuildContext context, int index, int realIndex) {
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                        urlImage,
                      ),
                      fit: BoxFit.fill),
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            },
            itemCount: 3,
            carouselController: carouselController,
            options: CarouselOptions(
                height: 500,
                autoPlay: true,
                enlargeCenterPage: true,
                enableInfiniteScroll: false,
                autoPlayInterval: const Duration(seconds: 2),
                viewportFraction: 0.8,
                onPageChanged: (index, reson) {
                  controller.currentPage.value = index;
                }),
          ),
          Positioned(
              bottom: 30,
              left: 160,
              child: AnimatedSmoothIndicator(
                activeIndex: controller.currentPage.value,
                count: 3,
                effect: ExpandingDotsEffect(
                  dotHeight: 10,
                  dotWidth: 10,
                  activeDotColor: mainColor,
                ),
              ))
        ],
      ),
    );
  }
}
