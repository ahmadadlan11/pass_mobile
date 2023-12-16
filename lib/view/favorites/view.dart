import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/const/colors.dart';
import 'package:pass/const/const.dart';
import 'package:pass/routes/routes.dart';
import 'package:pass/view/main%20scaffold/controller.dart';

class FavoritesView extends StatelessWidget {
  const FavoritesView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(backgroundColor: Colors.white, body: _Favorites());
  }
}

class _Favorites extends StatelessWidget {
  const _Favorites();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
        child: Padding(
          padding: const EdgeInsets.only(bottom: 70),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Favorites'.tr,
                    style: boldText30,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                  child: ListView.separated(
                itemCount: 5,
                itemBuilder: (BuildContext context, int index) {
                  return Stack(
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
                          ],
                        ),
                      )
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
  }
}

class _EmptyFavorites extends StatelessWidget {
  const _EmptyFavorites();

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
                'Favorites'.tr,
                style: boldText30,
              ),
            ],
          ),
          Column(
            children: [
              const Icon(
                Icons.favorite,
                size: 40,
                color: Colors.redAccent,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'It\'s lonely in here'.tr,
                style: boldText22,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                'Start adding your favorite attractions to your list so you don\'t miss a thing!'.tr,
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
