import 'package:bringin/model/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OTPScreen extends ConsumerStatefulWidget {
  const OTPScreen({super.key});
static const id = "/OTPScreen";
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _OTPScreenState();
}

class _OTPScreenState extends ConsumerState<OTPScreen> {

  late TextEditingController _otpController;

  @override
  void initState() {
    _otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          physics:const  NeverScrollableScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(children: [
              SizedBox(height: size.height*0.06,),
              Text("Verify Phone", style:Theme.of(context).textTheme.headline5!.copyWith(fontWeight: FontWeight.w700, fontSize: size.width*0.06),),
            SizedBox(height: size.height*0.01,),
              Text("Code is sent to", style: Theme.of(context).textTheme.subtitle1,),
               SizedBox(height: size.height*0.04,),
              SizedBox(
                    //width: size.width * 0.70,
                    child: PinCodeTextField(
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.bold,
                      ),
                      length: 6,
                      obscureText: false,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(10),
                        fieldHeight: size.height * 0.10,
                        fieldWidth: size.width * 0.12,
                        inactiveFillColor: KColor.boxColor, //KConstColors.primaryColor,
                        inactiveColor: Colors.white, //KConstColors.primaryColor,
                        selectedColor : KColor.boxColor,
                        selectedFillColor: Color(0xFFFFFFFF),
                        activeFillColor: KColor.boxColor,
                        activeColor: KColor.boxColor,
                      ),
                      cursorColor: Colors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      controller: _otpController,
                      keyboardType: TextInputType.number,
                      boxShadows: const [
                        // BoxShadow(
                        //   offset: Offset(0, 1),
                        //   color: Colors.black12,
                        //   blurRadius: 10,
                        // )
                      ],
                      onCompleted: (v) {},
                      onChanged: (value) {
                        print(value);
                        setState(() {});
                      },
                    ),
                  ),
        
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Text("Didn't receive code?"),
                    TextButton(onPressed: (){}, child: Text("send again", style: TextStyle(color: Colors.black),)
                    )
                  ],
                 ),
                  SizedBox(height: size.height*0.04,),
                 ElevatedButton(onPressed: (){}, style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade50),
                      child: Text("Send Code", style: TextStyle(fontWeight: FontWeight.w700, fontSize: size.width*0.045, color: Colors.grey.shade600 ),))
        
            ]),
          ),
        ),
      ),
    );
  }
}