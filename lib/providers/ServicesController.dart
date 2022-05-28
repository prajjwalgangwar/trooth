import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:trooth/providers/RemoteService.dart';

import '../models/news_model.dart';
import '../models/page_model.dart';
import '../models/token_model.dart';

class ServicesController extends GetxController {
  var newsList = <dynamic>[].obs;
  // PageModel? pageDetail = <PageModel>().obs;
  var searchKey = ''.obs;


  Future<void> getNews() async {
    newsList.value = [];
    Token? token = await RemoteServices.getTokenData();
    if (token != null && searchKey.value.isNotEmpty) {
      var body =
          await RemoteServices.getNewsData(token.data.toString(), searchKey.value);
      var newsData = await body.stream.bytesToString();
      final jsonList = await jsonDecode(newsData);
      final pageBody = PageModel.fromJson(jsonList['data']);
      if (pageBody != null) {
        // pageDetail = pageBody;
      }
      for (var data in jsonList['data']['docs']) {
        var newsbody = News.newsfromJson(data);
        newsList.value.add(newsbody);
      }

      print('news list data : ${newsList.value}');
    }
  }
}

// (error, status, message, data)

// data : {
// docs[],
// average_rank,  6.1
// total,         37695
// per_page,      10
// current_page,  1
// last_page,     20
// first_page_url,https://trooth-backend.hestawork.com/api/searchEngine/search?limit=10&search=india&start=1
// last_page_url, https://trooth-backend.hestawork.com/api/searchEngine/search?limit=10&search=india&start=20
// next_page_url, https://trooth-backend.hestawork.com/api/searchEngine/search?limit=10&search=india&start=2
// prev_page_url, null
// from,          1
// to             10
// }

//docs : [{domain, tstamp, id, title, rank, content}]
