import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        height: 250,
        width: 350,
        child:  Stack(
          children: [
            Center(
              child: Container(
                height: 180,
                width: 380,
                decoration: BoxDecoration(
                  // color: Colors.red,
                  borderRadius: BorderRadius.circular(18),
                  gradient: const LinearGradient(
                    colors: [
                      Colors.teal,
                      Colors.purple,
                    ]
                    ),
                ),
                ),
            ),
              Positioned(
                top: 0,
                right: 40,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: const BoxDecoration(
                    color: Colors.green,
                  shape: BoxShape.circle
                  ),
                  child: const CircleAvatar(),
                  ),
              ),
              const Positioned(
                top: 70,
                left: 30,
                child:  Text("Mike Muturi",
                style: TextStyle(color: Colors.white,
                fontSize: 22.0, fontWeight: FontWeight.w700),)),
              const Positioned(
                top: 90,
                left: 30,
                child:  Text("Assistant professor",
                style: TextStyle(color: Colors.white,
                fontSize: 18.0, fontWeight: FontWeight.w500),)),
                const Positioned(
                top: 130,
                left: 30,
                child:  Text("Department of Computer Science",
                style: TextStyle(color: Colors.white,
                fontSize: 18.0, fontWeight: FontWeight.w500),)),
            const Positioned(
            bottom: 55,
            left: 30,
            child: SizedBox(
              width: 300,
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.phone,color: Colors.white,),
                    Text(
                      "+254728160293",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.email, color: Colors.white,),
                    Text(
                      "mikeirungumuturi@gmail.com",
                      style: TextStyle(
                          color: Color.fromARGB(255, 255, 255, 255),
                          fontSize: 14.0,
                          fontWeight: FontWeight.w500),
                    )

                  ],
                )
              ]),
            ),
          ),
         const Positioned(
               right: 60,
               top: 100,
               child: Center(
               child: Text(
                "View Profile",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16
                ),
              ),
            ),
          )
          ],
        ),
      ),
    );
  }
}