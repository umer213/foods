import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../Models/menuitems.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  final scroolController = ItemScrollController();
  List<MenuItems> _foodItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: myButton(),
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [
              SliverAppBar(
                backgroundColor: Colors.black,
                floating: true,
                pinned: true,
                flexibleSpace: FlexibleSpaceBar(
                  collapseMode: CollapseMode.parallax,
                  background: Image.asset(
                    "assets/imag.jpg",
                    fit: BoxFit.fill,
                  ),
                ),
                // pinned: true,
                expandedHeight: 250,
                bottom: TabBar(indicatorColor: Colors.black, tabs: [
                  Tab(
                    text: "M E N U",
                  ),
                  Tab(text: "F A V")
                ]),
              )
            ];
          },
          body: Container(
              margin: EdgeInsets.symmetric(vertical: 6),
              height: 600,
              child: TabBarView(
                  //controller: _controller,
                  children: [_menuItem(), _favItems()])),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    setItems();
  }

  //menuItem for the menu tab bar view to show all iteams in tab
  Widget _menuItem() {
    return Container(
      color: Colors.purpleAccent,
      child: ScrollablePositionedList.builder(
          itemScrollController: scroolController,
          itemCount: _foodItems.length,
          itemBuilder: ((context, index) {
            final sorting = _foodItems.reversed.toList();
            var myItems = sorting[index];

            return Container(
              height: 100,
              // color: Colors.blue,
              margin: EdgeInsets.all(13),
              child: ListTile(
                leading: Image.asset(myItems.image),
                title: Text(
                  myItems.itemName,
                  style: TextStyle(fontSize: 20),
                ),
                subtitle: Text("${myItems.rating}"),
                trailing: Text("${myItems.price}"),
              ),
            );
          })),
    );
  }

  // method to scrool throug the list
  Future scroll() async {
    await scroolController.scrollTo(index: 6, duration: Duration(seconds: 1));
  }

  //floating action button to handle dailog box
  Widget myButton() {
    return Align(
      alignment: Alignment.bottomCenter,
      child: FloatingActionButton(
          child: Text("menu"),
          onPressed: (() {
            showItemlist(context);
          })),
    );
  }

  //Dilog box to show items in the currnt list
  void showItemlist(BuildContext context) => showDialog(
        context: context,
        builder: (context) => Container(
          height: 400,
          child: Dialog(
            child: ListView.builder(
                itemCount: _foodItems.length,
                itemBuilder: ((context, index) {
                  var diologItems = _foodItems[index];
                  return InkWell(
                    onTap: () {
                      scroll();
                    },
                    child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        child: Text(diologItems.itemName)),
                  );
                })),
          ),
        ),
      );
  //list of the menu items
  void setItems() {
    var items = <MenuItems>[
      MenuItems(
          image: "assets/i.jpg", itemName: "Aandoor", price: 20, rating: 4),
      MenuItems(
          image: "assets/im.jpg", itemName: "tandoor", price: 20, rating: 4),
      MenuItems(
          image: "assets/imag.jpg", itemName: "tandoor", price: 20, rating: 4),
      MenuItems(
          image: "assets/i.jpg", itemName: "tandoor", price: 20, rating: 4),
      MenuItems(
          image: "assets/im.jpg", itemName: "tandoor", price: 20, rating: 4),
      MenuItems(
          image: "assets/imag.jpg", itemName: "tandoor", price: 20, rating: 4),
      MenuItems(
          image: "assets/i.jpg", itemName: "tandoor", price: 20, rating: 4),
      MenuItems(
          image: "assets/im.jpg", itemName: "tandoor", price: 20, rating: 4),
    ];

    setState(() {
      _foodItems = items;
    });
  }

  //tabar view 2
  Widget _favItems() {
    return ListTile(
      leading: Image.asset("assets/i.jpg"),
      title: Text("NewItem"),
      subtitle: Text("30"),
      trailing: Text("40"),
    );
  }
}
