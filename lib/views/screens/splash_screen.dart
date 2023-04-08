import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:state_handler/res/globals.dart';

import '../../helpers/db_helpers.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  State<splash_screen> createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.green,
      body: Column(
        children: [
          SizedBox(height: _height * 0.28),
          Center(child: Image.asset("assets/images/Royal_Salad.png",width: 200),),
          SizedBox(height: _height * 0.01),
          const Text("Fast Delivery At\nYour Doorstep",
              style: TextStyle(
                  fontSize: 25,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center),
          SizedBox(height: _height * 0.2),
          Container(
            height: _height * 0.06,
            width: _width * 0.7,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: GestureDetector(
              onTap: () async {
                SharedPreferences pres = await SharedPreferences.getInstance();
                print(global.data);
                if (global.data == false) {
                  global.products.forEach((element) {
                    DBHleper.dbHleper.inserRecode(data: element);
                  });

                  Navigator.of(context).pushReplacementNamed('/');
                  pres.setBool('data', true);
                } else {
                  Navigator.of(context).pushReplacementNamed('/');
                }
              },
              child: const Center(
                child: Text(
                  "Let's Explore",
                  style: TextStyle(color: Colors.green, fontSize: 20,fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
