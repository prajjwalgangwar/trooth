import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:trooth/utilities/Constants.dart';
import 'package:trooth/widgets/CustomSearchBar.dart';

class Search extends StatelessWidget{

  const Search({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        color: Colors.transparent,
        child: Stack(
          children: [
            Align(
              alignment: Alignment.center,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: CachedNetworkImageProvider(
                          AppConstants.troothImage
                        )
                      )
                    ),
                  ),
                  CustomSearchBar(v1: true, v2: false)
                ],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 48,
                width: MediaQuery.of(context).size.width * 0.9,
                color: Colors.transparent,
                child: Text(AppConstants.description,textAlign: TextAlign.center ,style: const TextStyle(fontSize: 12),)
              ),
            ),
          ],
        ),
      ),
    );
  }
}