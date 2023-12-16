import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/const/colors.dart';
import 'package:pass/const/const.dart';
import 'package:pass/view/details/controller.dart';
import 'package:pass/view/details/widget/page_viewer.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: GetBuilder<DetailsController>(
            init: DetailsController(),
            builder: (controller) {
              return Stack(
                children: [
                  SizedBox(
                    height: Get.height,
                    width: Get.width,
                    child: const PageViewer(),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Stack(
                      children: [
                        Container(
                          height: Get.height / 2,
                          width: Get.width,
                          decoration: const BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: Get.width / 1.5,
                                  child: Text(
                                    'Ticket Pass in Riyadh'.tr,
                                    style: boldText30,
                                  ),
                                ),
                                Text(
                                  'The Places That The Pass Includes:'.tr,
                                  style: smallText17,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: SizedBox(
                                    height: 115,
                                    // width: Get.width / 1.5,
                                    child: ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: controller.details.length,
                                      itemBuilder: (BuildContext context, int index) {
                                        return Text("• ${controller.details[index]["action"]} : ${controller.details[index]["price"]} SR");
                                      },
                                    ),
                                  ),
                                ),
                                Container(
                                  // color: Colors.red,
                                  // height: 55,
                                  width: Get.width,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            '1099 SR',
                                            style: text22,
                                          ),
                                          Text(
                                            'It should be 1499 SR',
                                            style: greyText13,
                                          ),
                                        ],
                                      ),
                                      Container(
                                        width: 130,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(100),
                                          color: AppColor.primary,
                                        ),
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              InkWell(
                                                  onTap: () => controller.minus(),
                                                  child: Container(
                                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                                                    child: Icon(
                                                      Icons.remove,
                                                      size: 35,
                                                      color: controller.canSubtract() ? Colors.black : Colors.grey,
                                                    ),
                                                  )),
                                              Column(
                                                children: [
                                                  Text(
                                                    controller.quantity.toString(),
                                                    style: whiteBoldText25,
                                                  ),
                                                  Text(
                                                    'days'.tr,
                                                    style: whiteText10,
                                                  )
                                                ],
                                              ),
                                              InkWell(
                                                  onTap: () => controller.add(),
                                                  child: Container(
                                                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                                                    child: Icon(
                                                      Icons.add,
                                                      size: 35,
                                                      color: controller.canAdd() ? Colors.black : Colors.grey,
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      controller.isLoading
                                          ? CircularProgressIndicator(
                                              color: AppColor.primary,
                                              strokeWidth: 3,
                                            )
                                          : InkWell(
                                              onTap: () {},
                                              child: Text('buy'.tr),
                                            )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    top: (Get.height / 2) - 60,
                    right: 20,
                    child: InkWell(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(100)),
                        child: Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(color: Colors.grey.shade100, borderRadius: BorderRadius.circular(100)),
                          child: const Icon(
                            Icons.favorite_outline,
                            color: Colors.black,
                            size: 30,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              );
            }),
      ),
    );
  }
}
