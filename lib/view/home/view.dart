import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/const/colors.dart';
import 'package:pass/const/const.dart';
import 'package:pass/routes/routes.dart';
import 'package:pass/view/home/controller.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: GetBuilder<HomeController>(
          init: HomeController(),
          builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Find your pass in Saudi Arabia'.tr,
                    style: boldText30,
                  ),
                  Text(
                    'Discover the best places for you'.tr,
                    style: greySmallText12,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _CustomButton(
                        data: 'Recent'.tr,
                        textColor: controller.titlesStatus[0] ?? false ? Colors.white : Colors.grey,
                        containerColor: controller.titlesStatus[0] ?? false ? AppColor.primary : Colors.grey.shade200,
                        onTap: () => controller.changeStatus(0),
                      ),
                      _CustomButton(
                        data: 'Popular'.tr,
                        textColor: controller.titlesStatus[1] ?? false ? Colors.white : Colors.grey,
                        containerColor: controller.titlesStatus[1] ?? false ? AppColor.primary : Colors.grey.shade200,
                        onTap: () => controller.changeStatus(1),
                      ),
                      _CustomButton(
                        data: 'Central Region'.tr,
                        textColor: controller.titlesStatus[2] ?? false ? Colors.white : Colors.grey,
                        containerColor: controller.titlesStatus[2] ?? false ? AppColor.primary : Colors.grey.shade200,
                        onTap: () => controller.changeStatus(2),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 70, top: 20),
                      child: ListView.separated(
                        itemCount: controller.number,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Stack(
                            children: [
                              Container(
                                width: 230,
                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: controller.color),
                              ),
                              Positioned(
                                bottom: 5,
                                child: Container(
                                  padding: const EdgeInsets.all(15),
                                  // color: Colors.red,
                                  width: 230,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      InkWell(
                                        onTap: () => Get.toNamed(Routes.details),
                                        child: Container(
                                          height: 50,
                                          width: 120,
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                                          child: Center(
                                              child: Text(
                                            'View pass'.tr,
                                            style: viewPassStyle,
                                          )),
                                        ),
                                      ),
                                      InkWell(
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                                          child: const Icon(
                                            Icons.favorite_outline,
                                            color: Colors.black,
                                            size: 25,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              )
                            ],
                          );
                        },
                        separatorBuilder: (BuildContext context, int index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}

class _CustomButton extends StatelessWidget {
  const _CustomButton({
    super.key,
    required this.data,
    required this.textColor,
    required this.containerColor,
    required this.onTap,
  });
  final String data;
  final Color textColor;
  final Color containerColor;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 15.0),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(50), color: containerColor),
        child: Text(
          data,
          style: TextStyle(color: textColor),
        ),
      ),
    );
  }
}
