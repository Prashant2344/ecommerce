import 'package:ecom/consts/consts.dart';
import 'package:ecom/consts/lists.dart';
import 'package:ecom/controllers/auth_controller.dart';
import 'package:ecom/views/home_screen/home.dart';
import 'package:ecom/widgets_common/applogo_widget.dart';
import 'package:ecom/widgets_common/bg_widget.dart';
import 'package:ecom/widgets_common/custom_button.dart';
import 'package:ecom/widgets_common/custom_textfield.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  bool? isCheck = false;

  var controller = Get.put(AuthController());

  //text controllers
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var passwordRetypeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Center(
            child: Column(
              children: [
                (context.screenHeight*0.1).heightBox,
                applogoWidget(),
                10.heightBox,
                "Join the $appname".text.fontFamily(bold).white.size(18).make(),
                15.heightBox,

                Column(
                  children: [
                    customTextField(title:name, hint: nameHint,controller: nameController),
                    customTextField(title:email, hint: emailHint,controller: emailController),
                    customTextField(title:password, hint: passwordHint,controller: passwordController),
                    customTextField(title:retypePassword, hint: passwordHint,controller: passwordRetypeController),

                    Row(
                      children: [
                        Checkbox(
                            activeColor: redColor,
                            checkColor: whiteColor,
                            value: isCheck,
                            onChanged: (newValue){
                              setState(() {
                                isCheck = newValue;
                              });
                            }
                        ),
                        10.widthBox,
                        Expanded(
                          child: RichText(text: TextSpan(
                            children: [
                              TextSpan(
                                text: "I agree to the ",
                                style: TextStyle(
                                  fontFamily: regular,
                                  color: fontGrey
                                )
                              ),
                              TextSpan(
                                  text: termAndCond,
                                  style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor
                                  )
                              ),
                              TextSpan(
                                  text: " & ",
                                  style: TextStyle(
                                      fontFamily: regular,
                                      color: fontGrey
                                  )
                              ),
                              TextSpan(
                                  text: privacyPolicy,
                                  style: TextStyle(
                                      fontFamily: regular,
                                      color: redColor
                                  )
                              ),
                            ]
                          )),
                        )
                      ],
                    ),

                    5.heightBox,

                    controller.isLoading.value ? const CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(redColor),
                    ) : customButton(
                        color: isCheck == true? redColor: lightGrey,
                        title: signup,
                        textColor: whiteColor,
                        onPress: () async {
                          controller.isLoading(true);
                          try{
                            await controller.signupMethod(
                                context:context,
                                email:emailController.text,
                                password:passwordController.text,
                                name: nameController.text
                            ).then((value){
                              if(controller.isLoggedIn.value){
                                VxToast.show(context, msg: loggedin);
                                Get.offAll(() => const Home());
                              }else{
                                controller.isLoading(false);
                                VxToast.show(context, msg: 'Failed');
                              }
                            });
                          }catch(e){
                            VxToast.show(context, msg: e.toString());
                            controller.isLoading(false);
                          }
                        })
                        .box
                        .width(context.screenWidth - 50)
                        .make(),

                    10.heightBox,

                    //wrappping into gesture detector of velocity X
                    RichText(
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: alreadyHaveAccount,
                              style: TextStyle(fontFamily: bold,color: fontGrey),
                            ),
                            TextSpan(
                              text: login,
                              style: TextStyle(fontFamily: bold,color: redColor),
                            )
                          ]
                        ),
                    ).onTap(() {
                      Get.back();
                    }),
                  ],
                ).box.white.rounded.padding(const EdgeInsets.all(16)).width(context.screenWidth -70).shadowSm.make()
              ],
            ),
          ),
        )
    );
  }
}
