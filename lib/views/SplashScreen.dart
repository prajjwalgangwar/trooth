import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:trooth/providers/ServicesController.dart';
import 'package:trooth/utilities/Constants.dart';
import 'package:trooth/views/Search.dart';

import '../widgets/CustomSearchBar.dart';

class SplashScreen extends StatelessWidget{

  SplashScreen({Key? key}) : super(key: key);

  var width = 0.0;
  var height = 0.0;


  @override
  Widget build(BuildContext context) {

    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;

    print(width);
    print(height);
    return Scaffold(
      backgroundColor: Colors.orange.shade900,
      body: InkWell(
        onTap: (){
          Future.delayed(Duration(milliseconds: 200)).then((value) {
            Get.to(()=>Search());
          });
        },
        child: Container(
          color: Colors.white,
          child: Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.white,
              ),
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: width * 0.45,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: NetworkImage(
                        AppConstants.troothImage
                      )
                    )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}



// class R extends StatelessWidget {
//   R({Key? key}) : super(key: key);
//
//   // String searchKey = Get.arguments;
//   final ServicesController newsController = Get.put<ServicesController>(ServicesController());
//
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5F5F5),
//       body: Container(
//         margin: const EdgeInsets.only(top: 45),
//         color: const Color(0xFFF5F5F5),
//         child: Center(
//           child: Column(
//             children: [
//               CustomSearchBar(v1: true,v2: true,),
//               Expanded(
//                 child: Stack(
//                   children: [
//                     Container(
//                         color: Colors.grey.shade300,
//                         child:
//                         newsController.newsList.value.isNotEmpty?
//                         ListView.builder(
//                             itemCount: newsController.newsList.length,
//                             itemBuilder: (context, index) {
//                               return Container(
//                                 margin: const EdgeInsets.only(left: 8, right: 8, bottom: 16),
//                                 decoration: BoxDecoration(
//                                     color:
//                                     const Color(0xFFF5F5F5),
//                                     borderRadius: BorderRadius.circular(5)
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     Container(
//                                       decoration:const BoxDecoration(
//                                           color: Colors.white,
//                                           borderRadius: BorderRadius.vertical(top: Radius.circular(5))
//                                       ),
//                                       padding: const EdgeInsets.all(8),
//                                       child: Column(
//                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                         children: [
//                                           Container(
//                                             color: Colors.transparent,
//                                             margin: const EdgeInsets.only(right: 100, bottom: 5),
//                                             child: Text(
//                                               '${newsController.newsList.elementAt(index).id}',
//                                               style: const TextStyle(
//                                                 fontSize: 10.0,
//                                                 color: Colors.black,
//                                               ),
//                                               maxLines: 1,
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           ),
//                                           Container(
//                                             color: Colors.transparent,
//                                             margin: const EdgeInsets.only(right: 100, bottom: 5),
//                                             child: Text(
//                                               newsController.newsList.elementAt(index).title.toString(),
//                                               style: const TextStyle(
//                                                   fontSize: 14.0,
//                                                   color: Color(0xFF16697A),
//                                                   fontWeight: FontWeight.w500,
//                                                   fontStyle: FontStyle.normal),
//                                               maxLines: 2,
//                                               overflow: TextOverflow.ellipsis,
//                                             ),
//                                           ),
//                                           Container(
//                                             // margin: EdgeInsets.all(10),
//                                             color: Colors.transparent,
//                                             child: Text(
//                                               '${newsController.newsList.elementAt(index).content}',
//                                               style: const TextStyle(
//                                                 fontSize: 10.0,
//                                                 color: Colors.grey,
//                                               ),
//                                               maxLines: 3,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                     Container(
//                                       height: 50,
//                                       padding: const EdgeInsets.only(left: 8, right: 8, top: 6, bottom: 6),
//                                       margin: const EdgeInsets.only(left: 8, right: 8),
//                                       decoration: const BoxDecoration(
//                                           color: Colors.transparent,
//                                           // Color(0xFFF5F5F5),
//                                           borderRadius: BorderRadius.vertical(bottom: Radius.circular(5))
//                                       ),
//
//                                       child: Row(
//                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                         children: [
//                                           Text(AppConstants.donwScaleName, style: const TextStyle(color:  Color(0xFFC60B37), fontSize: 12, fontWeight: FontWeight.w500),),
//                                           Stack(
//                                             children: [
//                                               Align(
//                                                 alignment: Alignment.center,
//                                                 child: Container(
//                                                   height: 8,
//                                                   width: 203,
//                                                   decoration: BoxDecoration(
//                                                       gradient: const LinearGradient(
//                                                           colors: [
//                                                             Color(0xFFC60B37),
//                                                             Color(0xFF012C73)
//                                                           ],
//                                                           stops: [0.0, 1.0],
//                                                           begin: FractionalOffset.centerLeft,
//                                                           end: FractionalOffset.centerRight,
//                                                           tileMode: TileMode.clamp
//                                                       ),
//                                                       borderRadius: BorderRadius.circular(50)
//                                                   ),
//                                                 ),
//                                               ),
//                                               Positioned(
//                                                 left: 18 * double.parse(newsController.newsList.elementAt(index).rank),
//                                                 top: 7,
//                                                 child: Align(
//                                                   alignment: Alignment.center,
//                                                   child: Container(
//                                                     height: 23,
//                                                     width: 23,
//                                                     padding:const EdgeInsets.all(0),
//                                                     decoration: BoxDecoration(
//                                                         color: Colors.red.shade900,
//                                                         borderRadius: BorderRadius.circular(40),
//                                                         border: Border.all(
//                                                             color: const Color(0xFFFAFAFA),
//                                                             width: 2
//                                                         )
//                                                     ),
//                                                     child: Center(child: Text('${newsController.newsList.elementAt(index).rank}', textAlign: TextAlign.center, style: TextStyle(fontSize: 10, color: Colors.white, fontWeight: FontWeight.w600),)),
//                                                   ),
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                           Text(AppConstants.upScaleName, style: const TextStyle(color:  Color(0xFF012C73), fontSize: 12, fontWeight: FontWeight.w500),)
//
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               );
//                             }) : Center(child: CircularProgressIndicator(),)
//                     ),
//                     Align(
//                       alignment: Alignment.topLeft,
//                       child: Container(
//                         color: Colors.transparent,
//                         alignment: Alignment.centerLeft,
//                         margin: const EdgeInsets.only(left: 8, right: 8, top: 8),
//                         padding: const EdgeInsets.only(left: 4, right: 4),
//                         height: 20,
//                         child: Text('Showing 10 among ${newsController.pageDetail!.total.toString()} results', style: TextStyle(fontSize: 10, color: Colors.grey.shade600),),
//                       ),
//                     ),
//                   ],
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


