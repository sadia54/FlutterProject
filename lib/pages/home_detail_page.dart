import 'package:codepur_practice_a/Models/Catallog.dart';
import 'package:codepur_practice_a/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailPage({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl4.red800.make(),
              ElevatedButton(
                  onPressed: () {},
                  child: "Add to cart".text.make(),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(context.theme.primaryColor),
                    shape: MaterialStateProperty.all(
                      StadiumBorder(),
                    ),
                  )).wh(120, 50),
            ]).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
              height: 30.0,
              arcType: VxArcType.CONVEY,
              edge: VxEdge.TOP,
              child: Container(
                color: context.cardColor,
                width: context.screenWidth,
                child: Column(
                  children: [
                    catalog.name.text.xl4
                        .color(context.primaryColor)
                        .bold
                        .make(),
                    catalog.desc.text.textStyle(context.captionStyle).xl.make(),
                    10.heightBox,
                    "Sit clita ut vero sea takimata magna, ut est consetetur tempor lorem, gubergren at lorem invidunt et nonumy. Sit magna gubergren tempor dolores aliquyam sit. Sed sed sed takimata consetetur ut justo magna, dolore stet amet eos sea eos et tempor ipsum, sit sit et lorem voluptua takimata et stet."
                    .text
                    .textStyle(context.captionStyle)
                    .make()
                    .p16()
                    
                  ],
                ).py64(),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
