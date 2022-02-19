import 'package:badges/badges.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_getx/logic/controllers/product_detail_controller.dart';
import 'package:flutter_ecommerce_getx/utils/themes.dart';
import 'package:flutter_ecommerce_getx/views/widgets/product_details/color_picker.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../logic/controllers/cart_controller.dart';
import '../../../routes/routes.dart';

class ImageSliders extends StatelessWidget {
  final String urlImage;
  ImageSliders({
    Key? key,
    required this.urlImage,
  }) : super(key: key);

  final controller = Get.put(ProductDetailController());
  final cartController = Get.put(CartController());

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
            ),
          ),
          Positioned(
            bottom: 30,
            right: 30,
            child: Container(
              height: 200,
              width: 50,
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: ListView.separated(
                  itemBuilder: ((context, index) {
                    return GestureDetector(
                      onTap: () {
                        controller.currentColor.value = index;
                      },
                      child: ColorPicker(
                        color: controller.listColor[index],
                        outerBorder: controller.currentColor.value == index,
                      ),
                    );
                  }),
                  separatorBuilder: ((context, index) {
                    return const SizedBox(
                      height: 5,
                    );
                  }),
                  itemCount: 5),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              top: 20,
              left: 25,
              right: 25,
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: mainColor.withOpacity(0.4),
                    child: IconButton(
                      onPressed: () {
                        Get.back();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios,
                        color: Get.isDarkMode ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                  Badge(
                    position: BadgePosition.topEnd(top: -10, end: -10),
                    badgeContent: Text(
                      cartController.quantity().toString(),
                      style: const TextStyle(fontSize: 20),
                    ),
                    child: CircleAvatar(
                      radius: 24,
                      backgroundColor: mainColor.withOpacity(0.4),
                      child: IconButton(
                        onPressed: () {
                          Get.toNamed(Routes.cartScreen);
                        },
                        icon: Icon(
                          Icons.shopping_cart,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                        ),
                      ),
                    ),
                  ),
                ]),
          )
        ],
      ),
    );
  }
}
