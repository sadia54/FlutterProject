import 'dart:html';

import 'package:codepur_practice_a/Models/Catallog.dart';
import 'package:codepur_practice_a/widgets/drawer.dart';
import 'package:codepur_practice_a/widgets/item_widget.dart';
import 'package:codepur_practice_a/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final int days = 30;

  final String name = "Codepur";

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    final catalogJson =
        await rootBundle.loadString("assets/files/catalog.json");
    final decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogModel.items = List.from(productsData)
        .map<Item>((item) => Item.fromMap(item))
        .toList();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
        backgroundColor: MyTheme.creamColor,
        // appBar: AppBar(
        //   title: Text(
        //     "Catalog App",
        //   ),
        //   centerTitle: true,
        // ),
        body: SafeArea(
          child: Container(
            padding: Vx.m32,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),
                if (CatalogModel.items != null && CatalogModel.items.isNotEmpty)
                  CatalogList().expand()
                else
                  Center(
                    child: CircularProgressIndicator(),
                  )
              ],
            ),
          ),
        ));
  }
}

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.xl5.bold.color(MyTheme.darkBluishColor).make(),
        "Trending Products".text.xl2.make(),
      ],
    );
  }
}

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items[index];
        return CatalogItem(catalog: catalog);
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
    return VxBox(
      child: Row(
        children: [
          CatalogImage(
            image: catalog.image,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              catalog.name.text.lg.color(MyTheme.darkBluishColor).bold.make(),
              catalog.desc.text.textStyle(context.captionStyle).make(),
              ButtonBar(
alignment: MainAxisAlignment.spaceBetween,
buttonPadding: EdgeInsets.zero,
                children: ["\$${catalog.price}".text.bold.xl.make(),
                10.heightBox,
                ElevatedButton(
                  onPressed:(){},child: "Buy".text.make(),
                  style: ButtonStyle(
                    backgroundColor:MaterialStateProperty.all(
                      MyTheme.darkBluishColor),
                      shape: MaterialStateProperty.all(StadiumBorder(),),
                )),
                  ]
              ).pOnly(right: 8.0)
            ],
          ))
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}

class CatalogImage extends StatelessWidget {
  final String image;
  const CatalogImage({Key? key, required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
      
//        Padding(
//         padding: const EdgeInsets.all(16.0),
//         child:(CatalogModel.items !=null && CatalogModel.items.isNotEmpty)?
// GridView.builder(
//   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//     crossAxisCount: 2,
//     mainAxisSpacing: 16,
//     crossAxisSpacing: 16,
//   ), 
//   itemBuilder: (context,index){
//     final item = CatalogModel.items[index];
//     return Card(
//       clipBehavior: Clip.antiAlias,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(10)
//       ),
//       child: GridTile(
//         header: Container(
//           child: Text(item.name,
//           style: TextStyle(color: Colors.white),
//           ),
//           padding: const EdgeInsets.all(12),
//           decoration: BoxDecoration(
//             color: Colors.deepPurple

//           ),
//           ),
//         child: Image.network(item.image),
//         footer: Text(item.price.toString()),
//         ),
//     );
//   },
//   itemCount: CatalogModel.items.length,
  
//   )

//         // ListView.builder(
//         //   itemCount: CatalogModel.items.length,
//         //   itemBuilder: (context, index) => ItemWidget(
//         //       item: CatalogModel.items[index],
//         //     ),
          
//         // )
//         :Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//       drawer: MyDrawer(),
//     );
//   }
// }
