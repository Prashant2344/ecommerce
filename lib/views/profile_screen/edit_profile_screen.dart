import 'dart:io';

import 'package:ecom/consts/consts.dart';
import 'package:ecom/controllers/profile_controller.dart';
import 'package:ecom/widgets_common/bg_widget.dart';
import 'package:ecom/widgets_common/custom_button.dart';
import 'package:ecom/widgets_common/custom_textfield.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Column(
          mainAxisSize: MainAxisSize.min,
          children: [


            controller.profileImgPath.isEmpty ? Image.asset(imgProfile1,width: 80, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make() : Image.file(File(controller.profileImgPath.value)),


            10.heightBox,
            customButton(
              color: redColor,
              onPress: () {
                controller.changeImage(context);
              },
              textColor: whiteColor,
              title: "Change"
            ),
            Divider(),
            20.heightBox,
            customTextField(
              hint: nameHint,
              title: name
            ),
            customTextField(
                hint: passwordHint,
                title: password,
                isPass: true
            ),
            10.heightBox,
            SizedBox(
              width: context.screenWidth - 60,
              child: customButton(
                  color: redColor,
                  onPress: () {

                  },
                  textColor: whiteColor,
                  title: "Save"
              ),
            ),
          ],
        )
            .box
            .shadowSm
            .color(textfieldGrey)
            .padding(const EdgeInsets.all(16))
            .margin(const EdgeInsets.only(top: 50,left: 12,right: 12))
            .rounded
            .make(),

      )
    );
  }
}
