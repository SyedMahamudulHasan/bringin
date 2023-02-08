import 'package:bringin/model/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginSelectScreeen extends ConsumerStatefulWidget {
  const LoginSelectScreeen({super.key});
  static const id = "loginSelectionScreen";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LoginSelectScreeenState();
}

class _LoginSelectScreeenState extends ConsumerState<LoginSelectScreeen> {

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
         
          children: [
            SizedBox(
              height: size.height*0.08
            ),
            Text("Choose Your Role", style: TextStyle(fontWeight: FontWeight.w700, fontSize: size.width*0.05),),
          SizedBox(height: size.height*0.04,),
          //==============================================>>>>>> job seeker
   Stack(
     children: [
         Container(
 // padding: EdgeInsets.all(8), // Border width
  decoration: BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.white,KColor.secondaryColor, ],),),
  child: ClipOval(
          child: SizedBox.fromSize(
            size: Size.fromRadius(size.width*0.2), // Image radius
            child: Center(child: Image.asset('assets/logo/seeker.png', fit: BoxFit.fill)),
          ),
  ),
),
Positioned(
  top: 20,
  child: Text("Looking\nfor a job?", style: TextStyle(fontWeight: FontWeight.w600, fontSize: size.width*0.035),))
     ],
   ),
SizedBox(height: size.height*0.04,),
ElevatedButton(onPressed: (){}, child: Text("Join as Job Seeker", style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(backgroundColor: KColor.secondaryColor, shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),),),
//===============================================================>>>> recuiter
Stack(
  alignment: Alignment.topRight,
  children: [
        Container(
      margin: EdgeInsets.all(8), // Border width
      decoration: BoxDecoration(shape: BoxShape.circle, gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Colors.white,KColor.secondaryColor, ],),),
      child: ClipOval(
        child: SizedBox.fromSize(
            size: Size.fromRadius(size.width*0.2), // Image radius
            child: Center(child: Image.asset('assets/logo/hunter.png', fit: BoxFit.fill, width: size.width*0.45, )),
        ),
      ),
    ),
    Positioned(
      top: 40,
  right: -20,
  child: Text("Need Candidate\nInstantly?", style: TextStyle(fontWeight: FontWeight.w600, fontSize: size.width*0.035),))
  ],
),
SizedBox(height: size.height*0.04,),
ElevatedButton(onPressed: (){}, child: Text("Join as Recruter", style: TextStyle(color: Colors.black),), style: ElevatedButton.styleFrom(backgroundColor: KColor.secondaryColor,  shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0)
        ),),),

          ],
        ),
      ),
          );
  }
}