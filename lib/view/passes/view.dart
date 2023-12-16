import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:pass/const/colors.dart';
import 'package:pass/const/const.dart';
import 'package:pass/const/icons.dart';
import 'package:pass/view/passes/controller.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../main scaffold/controller.dart';

class PassesView extends StatelessWidget {
  const PassesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.white, body: _Passes());
  }
}

class _Passes extends StatelessWidget {
  const _Passes();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<PassesController>(
        init: PassesController(),
        builder: (controller) {
          return Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Passes'.tr,
                          style: boldText30,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Expanded(
                        child: ListView.separated(
                      itemCount: 2,
                      itemBuilder: (BuildContext context, int index) {
                        return Stack(
                          children: [
                            !controller.passesStatus[index]
                                ? const SizedBox()
                                : Stack(
                                    children: [
                                      Container(
                                        height: 330,
                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: AppColor.primary),
                                      ),
                                      Positioned(
                                        bottom: 20,
                                        child: Container(
                                          width: Get.width - 60,
                                          alignment: Alignment.center,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.circular(20),
                                            child: QrImageView(
                                              data: 'https://google.com',
                                              version: QrVersions.auto,
                                              size: 150.0,
                                              backgroundColor: Colors.white,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                            Stack(
                              children: [
                                SizedBox(
                                  width: Get.width,
                                  height: 130,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: Image.asset(
                                        'assets/images/images.jpeg',
                                        width: Get.width,
                                        fit: BoxFit.fill,
                                      )),
                                ),
                                Positioned(
                                  bottom: 5,
                                  child: Column(
                                    children: [
                                      Text(
                                        'Ticket Pass in Riyadh'.tr,
                                        style: whiteBoldText25,
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                                        width: Get.width - 60,
                                        child: InkWell(
                                          onTap: () {
                                            controller.changeStatus(index);
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(horizontal: 20),
                                            child: Container(
                                              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                                              // height: 50,

                                              decoration: BoxDecoration(color: AppColor.primary, borderRadius: BorderRadius.circular(10)),
                                              child: Center(
                                                  child: Text(
                                                '${'View pass'.tr} 2023/9/14',
                                                style: whiteViewPassStyle,
                                              )),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (BuildContext context, int index) {
                        return const SizedBox(height: 10);
                      },
                    ))
                  ],
                ),
              ));
        });
  }
}

class _EmptyPasses extends StatelessWidget {
  const _EmptyPasses();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text(
                'Passes'.tr,
                style: boldText30,
              ),
            ],
          ),
          Column(
            children: [
              SvgPicture.asset(
                AppIcons.passes,
                height: 70,
                color: Colors.black,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'You have no passes (yet!)'.tr,
                style: boldText22,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Experience the best of Suadi Arabia by just buy one pass to get started'.tr,
                style: greyText15,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: AppColor.primary,
                ),
                child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
                    child: InkWell(
                      onTap: () {
                        // Get.lazyPut(() => MainScaffoldController());
                        Get.find<MainScaffoldController>().goToHome();
                      },
                      child: Text(
                        'Explore attractions'.tr,
                        style: whiteBoldText15,
                      ),
                    )),
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
