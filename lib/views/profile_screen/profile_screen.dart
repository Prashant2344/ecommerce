import 'package:ecom/consts/consts.dart';
import 'package:ecom/consts/lists.dart';
import 'package:ecom/views/profile_screen/components/details_cart.dart';
import 'package:ecom/widgets_common/bg_widget.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              //edit profile button
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: const Align(
                    alignment: Alignment.topRight,
                    child: const Icon(Icons.edit, color: whiteColor)
                ).onTap(() {

                }),
              ),

              //users details section
              Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Image.asset(imgProfile1,width: 80, fit: BoxFit.cover).box.roundedFull.clip(Clip.antiAlias).make(),
                      10.widthBox,
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Prashant Silapakar".text.fontFamily(semibold).white.make(),
                          5.heightBox,
                          "prashant@gmail.com".text.white.make()
                        ],
                      )),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: whiteColor,
                            ),
                          ),
                          onPressed: (){},
                          child: logout.text.fontFamily(semibold).color(whiteColor).make()
                      )
                    ],
                  ),
              ),


              20.heightBox,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  detailsCard(
                    width: context.screenWidth / 3.4,
                    title: "in your card",
                    count: "11"
                  ),
                  detailsCard(
                      width: context.screenWidth / 3.4,
                      title: "wish list",
                      count: "20"
                  ),
                  detailsCard(
                      width: context.screenWidth / 3.4,
                      title: "your order",
                      count: "10"
                  )
                ],
              ),

              //button section

              ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index){
                    return const Divider(color: lightGrey);
                  },
                  itemCount: profileButtonsList.length,
                  itemBuilder: (context,index) {
                    return ListTile(
                      leading: Image.asset(
                          profileButtonsIcon[index],
                          width: 22,
                      ),
                      title: profileButtonsList[index].text.fontFamily(semibold).color(darkFontGrey).make(),
                    );
                  },
              ).box.white.rounded.margin(const EdgeInsets.all(12)).padding(const EdgeInsets.symmetric(horizontal: 16)).shadowSm.make()
              .box.color(redColor).make(),

            ],
          ),
        ),
      )
    );
  }
}
