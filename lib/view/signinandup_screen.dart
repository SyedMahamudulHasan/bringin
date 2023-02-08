import 'package:bringin/controller/connection_controller.dart';
import 'package:bringin/view/widgets/custom_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AuthenticationScreen extends ConsumerStatefulWidget {
  const AuthenticationScreen({super.key});
  static const id = "/authentication";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AuthenticationScreenState();
}

class _AuthenticationScreenState extends ConsumerState<AuthenticationScreen> {

 late TextEditingController _phoneCtr;
 final GlobalKey _formKey = GlobalKey<FormState>();
 late FToast fToast;

  @override
  void initState() {
    _phoneCtr = TextEditingController();
    fToast = FToast();
    fToast.init(context);
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
      body: GestureDetector(
        onTap: (){
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
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
                         const  Flexible(child: Padding(
                            padding:  EdgeInsets.symmetric(vertical: 8.0),
                            child: VerticalDivider(thickness: 2,),
                          )),
                          SizedBox(width: size.width*0.02,),
                          Expanded(
                            child: TextFormField(
                              controller: _phoneCtr,
                              keyboardType: TextInputType.number,
                              inputFormatters: [
                  //FilteringTextInputFormatter.allow(RegExp(r'[0-9, +]')),
                  //FilteringTextInputFormatter.digitsOnly
                  CustomInputFormatter(),
      
                  //FilteringTextInputFormatter.allow(RegExp(r'[0-9, +]')),
                  LengthLimitingTextInputFormatter(13)
                ],
                            decoration: const  InputDecoration(border: InputBorder.none,),
        
                                    
                                    
                                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: size.height*0.06,),
               if(ref.watch(connectionProvider).isLoading) 
               Center(child: CircularProgressIndicator(),)
               else  ElevatedButton(
                  onPressed: () async{
                    if(_phoneCtr.text.isEmpty){
      showGeneralToast(fToast, "Please provide a valid phone number");
                    } else {
                      //if not empty
                      if(_phoneCtr.text.length < 13 ){
                                    showGeneralToast(fToast, "Invalid phone number");
                                  } else {
                                    if(_phoneCtr.text.contains(".") || _phoneCtr.text.contains(",") || _phoneCtr.text.contains("-")){
                                      showGeneralToast(fToast, "Invalid phone number format");
                                    } else {
                                      
                                      final isValid = await ref.watch(connectionProvider).getOTP({
                                        "phone": "0" + _phoneCtr.text.replaceAll(" ", ""),
                                        "role":"seekers"
                                      });

                                      if(isValid){
                                        //navivate
                                      } else {
                                      showWarningToast(fToast, "Something went wrong, please try again");
                                    }
                                    }
                                  }
                    }
                  }, 
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.grey.shade50),
                  child: Text("Send Code", style: TextStyle(fontWeight: FontWeight.w700, fontSize: size.width*0.045, color: Colors.grey.shade600 ),))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class CustomInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var text = newValue.text;
    text = text.replaceAll(RegExp(r'(\s)|(\D)'), '');

    int offset = newValue.selection.start;
    var subText =
        newValue.text.substring(0, offset).replaceAll(RegExp(r'(\s)|(\D)'), '');
    int realTrimOffset = subText.length;

    // if (newValue.selection.baseOffset == 0) {
    //   return newValue;
    // }

    var buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      buffer.write(text[i]);
      var nonZeroIndex = i + 1;
      if (nonZeroIndex % 3 == 0 && nonZeroIndex != text.length) {
        buffer.write(
            ' '); // Replace this with anything you want to put after each 4 numbers

      }

      if (nonZeroIndex % 3 == 0 &&
          subText.length == nonZeroIndex &&
          nonZeroIndex > 3) {
        int moveCursorToRigth = nonZeroIndex ~/ 3 - 1;
        realTrimOffset += moveCursorToRigth;
      }

      if (nonZeroIndex % 3 != 0 && subText.length == nonZeroIndex) {
        int moveCursorToRigth = nonZeroIndex ~/ 3;
        realTrimOffset += moveCursorToRigth;
      }
    }

    var string = buffer.toString();
    return newValue.copyWith(
        text: string,
        selection: TextSelection.collapsed(offset: realTrimOffset));
  }
}




//bt