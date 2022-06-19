import 'package:codepur_practice_a/Models/Catallog.dart';
import 'package:codepur_practice_a/pages/home_detail_page.dart';
import 'package:codepur_practice_a/widgets/home_widget/catalog_image.dart';
import 'package:codepur_practice_a/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.getByPosition(index);
        return InkWell(
            onTap: (() => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => HomeDetailPage(catalog: catalog)))),
            child: CatalogItem(catalog: catalog));
      },
    );
  }
}

class CatalogItem extends StatelessWidget {
  final Item catalog;
  const CatalogItem({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: VxBox(
        child: Row(
          children: [
            Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(
                image: catalog.image,
              ),
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.lg.color(context.primaryColor).bold.make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                    alignment: MainAxisAlignment.spaceBetween,
                    buttonPadding: EdgeInsets.zero,
                    children: [
                      "\$${catalog.price}".text.bold.xl.make(),
                      ElevatedButton(
                          onPressed: () {},
                          child: "Add to cart".text.make(),
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                                context.theme.primaryColor),
                            shape: MaterialStateProperty.all(
                              StadiumBorder(),
                            ),
                          )),
                    ]).pOnly(right: 5.0)
              ],
            ))
          ],
        ),
      ).color(context.cardColor).rounded.square(150).make().py16(),
    );
  }
}
