import 'package:algorizaui/components/Buttons.dart';
import 'package:algorizaui/components/rich_text.dart';
import 'package:algorizaui/constants/colors.dart';
import 'package:algorizaui/constants/dimensions.dart';
import 'package:algorizaui/controller/authController.dart';
import 'package:algorizaui/helper/routes.dart';
import 'package:algorizaui/view/register_screen.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController phone = TextEditingController();
    Get.put(AuthController());
    return GetBuilder<AuthController>(
      builder: (controllers){
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Column(
              children: [
                Container(
                  width: Dimensions.screenWidth,
                  height: Dimensions.height30*10,
                  decoration: const BoxDecoration(
                    image: DecorationImage(image: AssetImage('images/background.png'),fit: BoxFit.cover)
                  ),
                ),

                Expanded(
                    child: Padding(
                    padding: const EdgeInsets.all(15.0), child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: Dimensions.height15,),
                      const Text('Welcome to Fashion Daily',style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),

                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: Dimensions.height20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text('Sign in',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500,fontSize: 30),),
                            Row(
                              children: const [
                                Text('Help',style: TextStyle(color: ColorsApp.buttonColor,fontWeight: FontWeight.w500,fontSize: 14),),
                                SizedBox(width: 5,),
                                Icon(Icons.help,color: ColorsApp.buttonColor,),
                              ],
                            )
                          ],
                        ),
                      ),

                      Text('Phone Number', style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 14),),
                      SizedBox(height: Dimensions.height10/2,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                  color: controllers.isEmpty==true? Colors.red:Colors.grey,
                                  width: 1
                              ),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width:Dimensions.height30*3,
                                  child: CountryCodePicker(
                                    textStyle: const TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
                                    initialSelection: 'EG',
                                    showCountryOnly: false,
                                    showOnlyCountryWhenClosed: false,
                                    favorite: const ['+20','EG'],
                                    enabled: true,
                                    hideMainText: false,
                                    showFlagMain: false,
                                    showFlag: true,
                                    hideSearch: false,
                                    showFlagDialog: true,
                                    alignLeft: true,
                                    onChanged: (value){
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: TextFormField(
                                    controller: phone,
                                    style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold),
                                    keyboardType: TextInputType.phone,
                                    decoration:  InputDecoration(
                                      hintText: 'Eg. 812345678',
                                      hintStyle: TextStyle(color: Colors.grey.withOpacity(.5)),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none,
                                    ),

                                  ),
                                )
                              ],
                            ),
                          ),
                          controllers.isEmpty==true?const Text('Phone Number is not registered', style: TextStyle(color: Colors.red,fontSize: 10),):Container()

                        ],
                      ),

                      ButtonApp(text: 'Sign In', color: ColorsApp.buttonColor, function: (){
                        if(phone.text.isEmpty){
                          controllers.empty();
                        }
                      }),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 1,
                            width: Dimensions.splashImage/2,
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            color: Colors.grey.withOpacity(.3),
                          ),
                          Text('Or', style: TextStyle(color: Colors.grey.shade600,fontWeight: FontWeight.bold,fontSize: 14),),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 5),
                            width: Dimensions.splashImage/2,
                            height: 1,
                            color: Colors.grey.withOpacity(.3),
                          )
                        ],
                      ),

                      Container(
                        padding:const EdgeInsets.symmetric(vertical: 15) ,
                        margin:const EdgeInsets.symmetric(vertical: 20) ,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                color: ColorsApp.buttonColor,
                                width: 2
                            )
                        ),
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset('images/google.png',width: Dimensions.height20*1.2,),
                              const SizedBox(width: 10,),
                              const Text('Sign with by google', style: TextStyle(color: ColorsApp.buttonColor,fontWeight: FontWeight.bold,fontSize: 14),),
                            ],
                          ),
                        ),
                      ),

                      InkWell(
                          onTap: (){
                            AppRoute.push( RegisterScreen());
                          },
                          child: RichTextApp(firstText: 'Doesn\'t has any account?', secondText: ' Register here', firstColor: Colors.black, secondColor: ColorsApp.buttonColor,fistWeight: FontWeight.w500,secondWeight: FontWeight.w500,)),

                      SizedBox(height: Dimensions.height30,),
                      const Text('use the application according to policy rules. Any kinds of violations will be subject to sanctions.',textAlign: TextAlign.center,style: TextStyle(color: Colors.grey,fontWeight: FontWeight.bold,fontSize: 14),),
                    ],
                  ),
                )),
              ],
            ),
          );
      },
    );
  }
}
