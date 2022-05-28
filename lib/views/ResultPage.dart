import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:trooth/providers/ServicesController.dart';
import 'package:trooth/utilities/Constants.dart';
import 'package:trooth/widgets/CustomSearchBar.dart';

class ResultPage extends StatefulWidget {
  var newsController=Get.find<ServicesController>();

  ResultPage({Key? key}) : super(key: key);
  @override
  ResultPageState createState()=> ResultPageState();
}

class ResultPageState extends State<ResultPage>{
  // String searchKey = Get.arguments;
  final ServicesController newsController =
  Get.put<ServicesController>(ServicesController());
  
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var newsController=widget.newsController;
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: Container(
        margin: const EdgeInsets.only(top: 45),
        color: const Color(0xFFF5F5F5),
        child: Center(
            child: Column(
              children: [
                CustomSearchBar(v1: true, v2: true),
                Visibility(
                  visible: true,
                  child: Material(
                    elevation: 0.5,
                    animationDuration: const Duration(seconds: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:
                          const EdgeInsets.only(left: 12, top: 5, bottom: 5),
                          child: Text(
                            AppConstants.averagePageScore,
                            style: const TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF333333),
                                fontSize: 14),
                          ),
                        ),
                        Container(
                            width: 30,
                            height: 30,
                            margin: const EdgeInsets.only(
                                right: 12, top: 10, bottom: 10),
                            color: Colors.red.shade50,
                            child: const Center(
                                child: Text(
                                    '5.0')))
                      ],
                    ),
                  ),
                ),
                GetX<ServicesController>(builder: (_){
                  return Expanded(
                    child: CustomScrollView(slivers: [
                      SliverToBoxAdapter(
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            color: Colors.transparent,
                            alignment: Alignment.centerLeft,
                            margin: const EdgeInsets.only(left: 8, right: 8, top: 16),
                            padding: const EdgeInsets.only(left: 4, right: 4),
                            height: 20,
                            child: Text(
                              'Showing 10 among 36279 results',
                              style: TextStyle(
                                  fontSize: 10, color: Colors.grey.shade600),
                            ),
                          ),
                        ),
                      ),

                      SliverList(
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return Container(
                                margin: const EdgeInsets.only(
                                    left: 8, right: 8, bottom: 16),
                                decoration: BoxDecoration(
                                    color: const Color(0xFFF5F5F5),
                                    borderRadius: BorderRadius.circular(5)),
                                child: Column(
                                  children: [
                                    Container(
                                      decoration: const BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.vertical(
                                              top: Radius.circular(5))),
                                      padding: const EdgeInsets.all(8),
                                      child: Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            color: Colors.transparent,
                                            margin: const EdgeInsets.only(
                                                right: 100, bottom: 5),
                                            child: Text(
                                              '${newsController.newsList.elementAt(index).id}',
                                              style: const TextStyle(
                                                fontSize: 10.0,
                                                color: Colors.black,
                                              ),
                                              maxLines: 1,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Container(
                                            color: Colors.transparent,
                                            margin: const EdgeInsets.only(
                                                right: 100, bottom: 5),
                                            child: Text(
                                              '${widget.newsController.newsList.elementAt(index).title.toString()}',
                                              style: const TextStyle(
                                                  fontSize: 14.0,
                                                  color: Color(0xFF16697A),
                                                  fontWeight: FontWeight.w500,
                                                  fontStyle: FontStyle.normal),
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          Container(
                                            // margin: EdgeInsets.all(10),
                                            color: Colors.transparent,
                                            child: Text(
                                              '${newsController.newsList.elementAt(index).content}',
                                              style: const TextStyle(
                                                fontSize: 10.0,
                                                color: Colors.grey,
                                              ),
                                              maxLines: 3,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      height: 50,
                                      padding: const EdgeInsets.only(
                                          left: 8, right: 8, top: 6, bottom: 6),
                                      margin:
                                      const EdgeInsets.only(left: 8, right: 8),
                                      decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                          // Color(0xFFF5F5F5),
                                          borderRadius: BorderRadius.vertical(
                                              bottom: Radius.circular(5))),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            AppConstants.donwScaleName,
                                            style: const TextStyle(
                                                color: Color(0xFFC60B37),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Stack(
                                            children: [
                                              Align(
                                                alignment: Alignment.center,
                                                child: Container(
                                                  height: 8,
                                                  width: 203,
                                                  decoration: BoxDecoration(
                                                      gradient:
                                                      const LinearGradient(
                                                          colors: [
                                                            Color(0xFFC60B37),
                                                            Color(0xFF012C73)
                                                          ],
                                                          stops: [
                                                            0.0,
                                                            1.0
                                                          ],
                                                          begin:
                                                          FractionalOffset
                                                              .centerLeft,
                                                          end: FractionalOffset
                                                              .centerRight,
                                                          tileMode:
                                                          TileMode.clamp),
                                                      borderRadius:
                                                      BorderRadius.circular(
                                                          50)),
                                                ),
                                              ),
                                              Positioned(
                                                left: 18
                                                    * double.parse(newsController.newsList.elementAt(index).rank),
                                                top: 7,
                                                child: Align(
                                                  alignment: Alignment.center,
                                                  child: Container(
                                                    height: 23,
                                                    width: 23,
                                                    padding:
                                                    const EdgeInsets.all(0),
                                                    decoration: BoxDecoration(
                                                        color: Colors.red.shade900,
                                                        borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                        border: Border.all(
                                                            color: const Color(
                                                                0xFFFAFAFA),
                                                            width: 2)),
                                                    child: Center(
                                                        child: Text(
                                                          '${newsController.newsList.elementAt(index).rank}',
                                                          textAlign: TextAlign.center,
                                                          style: const TextStyle(
                                                              fontSize: 10,
                                                              color: Colors.white,
                                                              fontWeight:
                                                              FontWeight.w600),
                                                        )),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            AppConstants.upScaleName,
                                            style: const TextStyle(
                                                color: Color(0xFF012C73),
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          )
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                            childCount: newsController.newsList.length,
                          ))
                    ]),
                  );
                })
              ],
            )),
      ),
    );
  }
}
