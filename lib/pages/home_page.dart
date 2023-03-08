// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:coffe_app/util/coffee_tile.dart';
import 'package:coffe_app/util/coffe_type.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List coffeType = [
    [
      'Cappucino',
      false,
    ],
    [
      'Latte',
      false,
    ],
    [
      'Black',
      false,
    ],
    [
      'Tea',
      false,
    ],
  ];
  void coffeeTypeSelected(int index) {
    setState(() {
      for (int i = 0; i < coffeType.length; i++) {
        coffeType[index][1] = false;
      }
      coffeType[index][1] = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Icon(Icons.menu),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Icon(Icons.person),
          ),
        ],
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor: Colors.grey.shade900,
          color: Colors.orange,
          animationDuration: Duration(milliseconds: 300),
          items: [
            Icon(
              Icons.home,
            ),
            Icon(
              Icons.favorite,
            ),
            Icon(
              Icons.settings,
            ),
          ]),
      body: Column(
        children: [
          //find the bet coffe for you
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
              'Find the best coffee for you',
              style: GoogleFonts.bebasNeue(
                fontSize: 55,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          // search bar
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Find your coffee...',
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.grey.shade600)))),
          ),

          SizedBox(
            height: 25,
          ),

          //horinzontal line for list of coffee names

          Container(
            height: 50,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: coffeType.length,
              itemBuilder: (context, index) {
                return CoffeeType(
                  coffeType: coffeType[index][0],
                  isSelected: coffeType[index][1],
                  onTap: () {
                    coffeeTypeSelected(index);
                  },
                );
              },
            ),
          ),

          // horinzontal listview for this coffe
          Expanded(
              child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              CoffeTile(
                  coffeeimagePath: 'assets/img/img1.jpg',
                  coffeeName: 'Latte',
                  CoffeeAmount: '#500.00',
                  coffeeSpec: 'With Sugar'),
              CoffeTile(
                  coffeeimagePath: 'assets/img/img2.jpg',
                  coffeeName: 'Cappucino',
                  CoffeeAmount: '#1000.00',
                  coffeeSpec: 'With Almond Milk '),
              CoffeTile(
                coffeeimagePath: 'assets/img/img3.jpg',
                coffeeName: 'Tea',
                CoffeeAmount: '#750.00',
                coffeeSpec: 'plain',
              ),
            ],
          ))
        ],
      ),
    );
  }
}
