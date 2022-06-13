import 'package:codepur_practice_a/Models/Catallog.dart';
import 'package:codepur_practice_a/widgets/drawer.dart';
import 'package:codepur_practice_a/widgets/item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

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
    CatalogModel.items = List.from(productsData).
    map<Item>((item) => 
    Item.fromMap(item)).toList();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    // final dummyList = List.generate(50, (index) => CatalogModel.items[0]);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Catalog App",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child:(CatalogModel.items !=null && CatalogModel.items.isNotEmpty)?
GridView.builder(
  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
    crossAxisCount: 2,
    mainAxisSpacing: 16,
    crossAxisSpacing: 16,
  ), 
  itemBuilder: (context,index){
    final item = CatalogModel.items[index];
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10)
      ),
      child: GridTile(
        header: Container(
          child: Text(item.name,
          style: TextStyle(color: Colors.white),
          ),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.deepPurple

          ),
          ),
        child: Image.network(item.image),
        footer: Text(item.price.toString()),
        ),
    );
  },
  itemCount: CatalogModel.items.length,
  
  )

        // ListView.builder(
        //   itemCount: CatalogModel.items.length,
        //   itemBuilder: (context, index) => ItemWidget(
        //       item: CatalogModel.items[index],
        //     ),
          
        // )
        :Center(
          child: CircularProgressIndicator(),
        ),
      ),
      drawer: MyDrawer(),
    );
  }
}
