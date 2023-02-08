import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthenticationScreen extends ConsumerStatefulWidget {
  const AuthenticationScreen({super.key});
  static const id = "/authentication";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends ConsumerState<AuthenticationScreen> {

 late TextEditingController _phoneCtr;
 final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _phoneCtr = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _phoneCtr.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size  = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.white),
      body: SingleChildScrollView(
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(child: Text("Sign In / Sign Up\nJob Seeker",textAlign: TextAlign.center, style: Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w700),)),
              SizedBox(height: size.height*0.04,),
              Text("If you already have account you will be log in to your profile. Otherwise you will be given the option to set a new profile.", textAlign: TextAlign.left,style: TextStyle(fontSize: size.width*0.04, fontWeight: FontWeight.w400,),),
              SizedBox(height: size.height*0.04,),
              //=================================>>>> phone text field
              Form(
                key: _formKey,
                child: Container(
                  width: size.width,
                  height: size.height*0.08,
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black45)
                  ),
                  child: Center(
                    child: Row(
                      children: [
                        SizedBox(width: size.width*0.04,),
                        Text("+880"),
                        SizedBox(width: size.width*0.02,),
                        Flexible(child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: VerticalDivider(thickness: 2,),
                        )),
                        SizedBox(width: size.width*0.02,),
                        Expanded(
                          child: TextFormField(
                            controller: _phoneCtr,
                          decoration: InputDecoration(border: InputBorder.none,),
//                              validator: (value){
//                               if(value!.isEmpty){
// return "Please provide a valid phone number";
//                               } else {
//                                 if(value.length < 11 || value.length > 11){
//                                   return "Invalid phone number, provided phone number length is ${value.length}";
//                                 } else {
//                                   return null;
//                                 }
//                               }
//                              },     
                                  
                                  
                                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(height: size.height*0.06,),
              ElevatedButton(
                onPressed: (){}, 
                style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade50),
                child: Text("Send Code", style: TextStyle(fontWeight: FontWeight.w700, fontSize: size.width*0.045, color: Colors.grey.shade600 ),))
            ],
          ),
        ),
      ),
    );
  }
}