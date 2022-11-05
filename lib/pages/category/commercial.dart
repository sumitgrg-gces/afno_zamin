import 'package:afnozamin/pages/constants.dart';
import 'package:afnozamin/pages/ename.dart';
import 'package:afnozamin/pages/individualPage.dart';
import 'package:flutter/material.dart';

import '../BottomBar.dart';

class CommercialScreen extends StatefulWidget {
  @override
  State<CommercialScreen> createState() => _CommercialScreenState();
}

class _CommercialScreenState extends State<CommercialScreen> {
  String dropdownvalue = 'Sort By';

  // List of items in our dropdown menu
  var items = [
    'Sort By',
    'Default',
    'Price (up)',
    'Price (down)',
    'Latest',
    'Oldest',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Properties list'),
        ),
        body: Column(children: [
          Container(
            margin: EdgeInsets.all(8.0),
            padding: EdgeInsets.all(6.0),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: primarycolor,
              ),
            ),
            height: 50.0,
            width: 250.0,
            child: DropdownButton(
              // Initial Value
              isExpanded: true,
              value: dropdownvalue,

              // Down Arrow Icon
              icon: const Icon(Icons.keyboard_arrow_down),

              // Array list of items
              items: items.map((String items) {
                return DropdownMenuItem(
                  value: items,
                  child: Text(items),
                );
              }).toList(),
              // After selecting the desired option,it will
              // change button value to selected value
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
              },
            ),
          ),
          Expanded(
            child: ListView(
              children: productList.map((e) => PropertyTile(e)).toList(),
            ),
          )
        ]));
  }
}

class PropertyTile extends StatelessWidget {
  Map<String, dynamic> properties;

  PropertyTile(
    this.properties, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey[300],
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(properties['image']),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Name: ${properties['name']}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text("Price: ${properties['price']}"),
              Text("Description: ${properties['disc']}"),
            ],
          ),
        ]),
      ),
    );
  }
}
