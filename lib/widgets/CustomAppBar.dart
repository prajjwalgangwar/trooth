import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget{
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 85,

      decoration: BoxDecoration(
        color: Colors.orange,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(20),
          bottomLeft: Radius.circular(20)
        ),
        border: Border.all(
          color: Colors.orange,
          width: 2,
        )
      ),
      child: Stack(
        children: [
          Container(
            height: 70,
            decoration: const BoxDecoration(
                color: Colors.orange,
                borderRadius:  BorderRadius.only(
                    bottomRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20)
                ),

            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              margin: const EdgeInsets.only(top: 20),
              child: Text('', style: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2, fontSize: 14),)
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 30,
              color: Colors.transparent,
              margin: const EdgeInsets.only(bottom: 10),
              child: ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                return InkWell(
                  splashColor: Colors.orange.shade50,
                  onTap: (){

                  },
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    child: Icon(
                      Icons.add,
                      size: 22,
                    ),
                  ),
                );
              })
            ),
          )
        ],
      )
    );
  }
}