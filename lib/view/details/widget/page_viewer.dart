// import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/view/details/controller.dart';

class PageViewer extends StatelessWidget {
  const PageViewer({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DetailsController>(init: DetailsController(),builder: (controller) {
      return Stack(
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: Get.context!.height / 2,
            child: PageView.builder(
              onPageChanged: (value) {
                controller.page = controller.pageController.page!.roundToDouble();

                controller.update();
              },
              itemCount: controller.images.length,
              controller: controller.pageController,
              itemBuilder: (BuildContext context, position) {
                return Center(child: _buildPageItem(position, controller.images, context));
              },
            ),
          ),
         
          Positioned(
            top: Get.height/2.5,
            child: SizedBox(
              width: Get.width,
              child: Center(
                child: DotsIndicator(
                  dotsCount: controller.images.isEmpty ? 1 : controller.images.length,
                  position: controller.page.round(),
                  decorator: DotsDecorator(
                    color: Colors.white,
                    activeColor: Colors.grey,
                    size: const Size.square(9.0),
                    activeSize: const Size(18.0, 9.0),
                    activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}

Widget _buildPageItem(int index, List<String> list, BuildContext context) {
  return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: Get.context!.height / 2,
      
      child: Image.asset(list[index],fit:BoxFit.fill ,));
}
