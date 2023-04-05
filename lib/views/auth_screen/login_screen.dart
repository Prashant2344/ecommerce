import 'package:ecom/consts/consts.dart';
import 'package:ecom/consts/lists.dart';
import 'package:ecom/controllers/auth_controller.dart';
import 'package:ecom/views/auth_screen/signup_screen.dart';
import 'package:ecom/views/home_screen/home.dart';
import 'package:ecom/widgets_common/applogo_widget.dart';
import 'package:ecom/widgets_common/bg_widget.dart';
import 'package:ecom/widgets_common/custom_button.dart';
import 'package:ecom/widgets_common/custom_textfield.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller = Get.put(AuthController());
    return bgWidget(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              children: [
                (context.screenHeight*0.1).heightBox,
                applogoWidget(),
                10.heightBox,
                "Log in to $appname".text.fontFamily(bold).white.size(18).make(),
                15.heightBox,
                
                Obx(
                    () =>
                  Column(
                    children: [
                      customTextField(title:email, hint: emailHint,controller: controller.emailController),
                      customTextField(title:password, hint: passwordHint,controller: controller.passwordController, isPass: true),
                      Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(onPressed: () {}, child: forgetPass.text.make()),
                      ),
                      5.heightBox,

                      controller.isLoading.value ? const CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation(redColor),
                      ) : customButton(color: redColor,title: login, textColor: whiteColor, onPress: () async{
                        controller.isLoading(true);
                        await controller.loginMethod(context: context).then((value){
                          if(value != null){
                            VxToast.show(context, msg: loggedin);
                            Get.offAll(() => const Home());
                          }else{
                            controller.isLoading(false);
                          }
                        });
                      })
                          .box
                          .width(context.screenWidth - 50)
                          .make(),

                      5.heightBox,
                      createNewAccount.text.color(fontGrey).make(),
                      5.heightBox,

                      customButton(color: lightGolden,title: signup, textColor: redColor, onPress: () {
                        Get.to(() => const Signup());
                      })
                          .box
                          .width(context.screenWidth - 50)
                          .make(),

                      10.heightBox,
                      loginWith.text.color(fontGrey).make(),
                      5.heightBox,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                          List.generate(3, (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              backgroundColor: lightGrey,
                              radius: 25,
                              child: Image.asset(
                                  socialIconList[index],
                                  width: 30,
                              ),
                            ),
                          )),
                      )
                    ],
                  ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth -70).shadowSm.make(),
                )
              ],
            ),
          ),
        )
    );
  }
}
