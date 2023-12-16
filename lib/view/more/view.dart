import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pass/const/const.dart';
import 'package:pass/view/language/controller.dart';

class MoreView extends StatelessWidget {
  const MoreView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'More'.tr,
                style: boldText30,
              ),
              const SizedBox(
                height: 15,
              ),
              _CustomColumn(
                header: 'Help'.tr,
                firstText: 'FAQs'.tr,
                firstIcon: Icons.question_mark_outlined,
                secondText: 'Call us'.tr,
                secondIcon: Icons.phone_outlined,
                firstFunction: () {},
                secondFunction: () {},
              ),
              const SizedBox(
                height: 15,
              ),
              _CustomColumn(
                header: 'Settings'.tr,
                firstText: 'Language'.tr,
                firstIcon: Icons.language,
                secondText: 'Privacy and Policy'.tr,
                secondIcon: Icons.lock,
                firstFunction: () async {
                  Get.lazyPut(() => LanguageController());
                  await Get.find<LanguageController>().buildDialog(context);
                },
                secondFunction: () {},
              )
            ],
          ),
        ));
  }
}

class _CustomColumn extends StatelessWidget {
  const _CustomColumn({
    super.key,
    required this.header,
    required this.firstText,
    required this.firstIcon,
    required this.secondText,
    required this.secondIcon,
    required this.firstFunction,
    required this.secondFunction,
  });
  final String header;
  final String firstText;
  final IconData firstIcon;
  final String secondText;
  final IconData secondIcon;
  final void Function() firstFunction;
  final void Function() secondFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          header,
          style: text22,
        ),
        const SizedBox(
          height: 15,
        ),
        InkWell(
          onTap: firstFunction,
          child: Row(
            children: [
              Container(
                  // padding: EdgeInsets.all(1),
                  decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(100)),
                  child: Icon(
                    firstIcon,
                    size: 20,
                  )),
              const SizedBox(
                width: 5,
              ),
              Text(
                firstText,
                style: text15,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1,
          color: Colors.black,
        ),
        const SizedBox(
          height: 10,
        ),
        InkWell(
          onTap: secondFunction,
          child: Row(
            children: [
              Icon(
                secondIcon,
                size: 25,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                secondText,
                style: text15,
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          thickness: 1,
          color: Colors.black,
        ),
      ],
    );
  }
}
