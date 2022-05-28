import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:trooth/utilities/Constants.dart';

import '../providers/ServicesController.dart';
import '../views/ResultPage.dart';
import 'TroothCircularIndicator.dart';

class CustomSearchBar extends StatelessWidget {
  final bool v1, v2;
  TextEditingController searchController = TextEditingController();
  final ServicesController servicesController = Get.put<ServicesController>(ServicesController());
  CustomSearchBar({Key? key, required this.v1, required this.v2}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Visibility(
          visible: v1,
          child: Container(
            margin: const EdgeInsets.only(left: 20, right: 20, top: 5, bottom: 20),
            child: Form(
              child: TextFormField(
                controller: searchController,
                autofocus: false,
                decoration: InputDecoration(
                  filled: true,
                    fillColor: Colors.white,
                    contentPadding: const EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                    iconColor: const Color(0xFFFF4646),
                    prefixIcon: const Icon(
                      IconlyLight.search,
                      color: Color(0xFFFF4646),
                      size: 18,
                    ),
                    suffixIcon: Visibility(
                      visible: v2,
                      child: InkWell(
                        onTap: (){
                          searchController.clear();
                        },
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            padding: const EdgeInsets.all(1),
                            margin: const EdgeInsets.only(right: 8),
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(
                                color: Colors.transparent
                              ),
                              borderRadius: BorderRadius.circular(25)
                            ),
                            child: const Icon(
                              Icons.close_rounded,
                              color: Colors.white,
                              size: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    focusColor: const Color(0xFFFF4646),
                    focusedBorder: const OutlineInputBorder(
                      gapPadding: 0,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(color: Color(0xFFFF4646), width: 0.5),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      gapPadding: 0,
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                      borderSide: BorderSide(color: Color(0xFFFF4646), width: 0.5),
                    ),
                    hintText: 'Search for unbiased results',
                    hintStyle: const TextStyle(fontSize: 14)),
                onFieldSubmitted: (value) async {
                  print('submitting search key');
                  servicesController.searchKey.value = value;
                  await servicesController.getNews();
                  Get.to(()=> ResultPage());
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
