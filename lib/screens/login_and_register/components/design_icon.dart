import 'package:flutter/material.dart';

Widget designIcon(String title) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: Icon(Icons.ac_unit_rounded,size: 100,color: Colors.grey,),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Icon(Icons.ac_unit_rounded,size: 50,color: Colors.grey,),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 80.0),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Icon(Icons.ac_unit_rounded,size: 30,color: Colors.grey,),
                ),
              ),
            ],
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Text(title,
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey,
                  shadows: [
                    Shadow(
                        offset: Offset(0,10),
                        blurRadius: 50
                    )
                  ]
              ),),
            Container(
              height: 300,
              width: 200,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(200),
                      bottomRight: Radius.circular(200)
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0,150),
                      blurRadius: 50,
                      color: Colors.grey.withOpacity(0.7),
                    )
                  ]
              ),
              child: Image(image: AssetImage('assets/images/1.png'),fit: BoxFit.cover),
            ),
          ],
        ),
      ),
      Align(
        alignment: Alignment.topRight,
        child: Icon(Icons.ac_unit_rounded,size: 50,color: Colors.grey,),
      ),
    ],
  );
}