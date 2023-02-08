import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
      Column(
children: [
  SizedBox(
            height: size.height*0.18
          ),
          SizedBox(
            width: size.width*0.35,
            child: Image.asset("assets/logo/logo.png")),
          SizedBox(height: size.height*0.04,),
          Text("Bringin", style: TextStyle(fontWeight: FontWeight.w700, fontSize: size.width*0.06,),),
         SizedBox(height: size.height*0.01,),
          Text("Instant Chat, Hire Direct", style: TextStyle(fontWeight: FontWeight.w600,),),
],
      ),
          Column(
            children: [
              Align(
            alignment: Alignment.bottomCenter,
            child: Text("Bringin Technology Ltd.", style: TextStyle(fontSize: size.width*0.04, fontWeight: FontWeight.w600,),),
          ),
          SizedBox(height: size.height*0.04,),
            ],
          )

        ],
      ),
    );
  }
}