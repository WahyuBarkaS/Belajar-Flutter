import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

class GeodesicListPage extends StatefulWidget {
  const GeodesicListPage({Key? key}) : super(key: key);

  @override
  State<GeodesicListPage> createState() => _GeodesicListPageState();
}

class _GeodesicListPageState extends State<GeodesicListPage> {
  bool isShowSearcTextField = false;
  String bodyTitle = "Home!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      bottomNavigationBar: _bottomNavigation(),
      body: _body(),
    );
  }

  CurvedNavigationBar _bottomNavigation() {
    return CurvedNavigationBar(
      buttonBackgroundColor: Colors.lightGreen,
      animationCurve: Curves.fastOutSlowIn,
      height: 50,
      backgroundColor: Colors.transparent,
      color: Colors.lightGreen,
      items: const [
        Icon(
          Icons.settings,
          color: Colors.white,
        ),
        Icon(Icons.home, color: Colors.white),
        Icon(Icons.account_circle_rounded, color: Colors.white)
      ],
      onTap: (value) {
        setState(() {
          if (value == 0) {
            bodyTitle = "Setting";
          }
          if (value == 1) {
            bodyTitle = "Home";
          }
          if (value == 2) {
            bodyTitle = "Profile";
          }
        });
      },
    );
  }

  Widget _body() => Center(
        child: Text(
          bodyTitle,
          style: TextStyle(
              color: Colors.grey, fontSize: 32, fontWeight: FontWeight.bold),
        ),
      );

  AppBar _appBar() => AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: isShowSearcTextField
            ? const TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  labelText: 'Search',
                ),
              )
            : const Text(
                "Geodesic Dome",
                style: TextStyle(color: Colors.green),
              ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            setState(() {
              if (isShowSearcTextField == true) {
                isShowSearcTextField = false;
              } else {
                isShowSearcTextField = true;
              }
            });
          },
          icon: Icon(
            Icons.search,
            color: Colors.lightGreen,
          ),
        ),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  bodyTitle = 'Cart';
                });
              },
              icon: Icon(
                Icons.add_shopping_cart_rounded,
                color: Colors.lightGreen,
              ))
        ],
      );
}
