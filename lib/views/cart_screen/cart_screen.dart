import 'package:ecom/consts/consts.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white54,
      child: "Cart is empty".text.fontFamily(semibold).color(darkFontGrey).makeCentered(),
    );
  }
}
