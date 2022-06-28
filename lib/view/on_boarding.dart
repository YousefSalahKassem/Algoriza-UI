import 'package:algorizaui/components/buttons.dart';
import 'package:algorizaui/components/rich_text.dart';
import 'package:algorizaui/constants/dimensions.dart';
import 'package:algorizaui/controller/boarding_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../constants/colors.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(BoardingController());

    return GetBuilder<BoardingController>(
      builder: (controller){
        return Scaffold(
          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0,vertical: Dimensions.height30*1.5),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: (){
                      controller.goToLogin();
                    },
                    child: Container(
                      width: Dimensions.height30*3,
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: ColorsApp.skipColor,
                          borderRadius: BorderRadius.circular(15)
                      ),
                      child: const Center(
                        child: Text('Skip',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height20,),

                RichTextApp(firstText: '7', secondText: 'Krave', firstColor: ColorsApp.dotsColor, secondColor: ColorsApp.primary,firstSize: Dimensions.height30*1.2,secondSize: Dimensions.height30*1.2,),

                Expanded(
                  child: PageView.builder(
                    controller: controller.pageController,
                    itemCount: controller.contents.length,
                    onPageChanged: (int index) {
                      controller.changePage(index);
                    },
                    itemBuilder: (_, i) {
                      return Padding(
                        padding: const EdgeInsets.all(40),
                        child: Column(
                          children: [
                            SvgPicture.asset(
                              controller.contents[i].image,
                              width: Dimensions.splashImage*1.5,
                              height: Dimensions.splashImage,
                            ),
                            Text(
                              controller.contents[i].title,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              controller.contents[i].subtitle,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),

                SizedBox(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      controller.contents.length,
                          (index) => controller.buildDot(index, context),
                    ),
                  ),
                ),
                SizedBox(height: Dimensions.height10,),

                ButtonApp(text: 'Get Started', color: ColorsApp.primary,function: (){controller.nextPage();},),

                InkWell(
                    onTap: (){controller.goToRegister();},
                    child: RichTextApp(firstText: 'Don\'t have an account?', secondText: ' Sign Up', firstColor: Colors.black, secondColor: ColorsApp.primary,fistWeight: FontWeight.w500,secondWeight: FontWeight.w500,)),
                SizedBox(height: Dimensions.height20,),
              ],
            ),
          ),
        );
      },
    );
  }
}
