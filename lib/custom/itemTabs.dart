import 'package:flutter/material.dart';

class ItemTabs extends StatelessWidget {
  final IconData iconData;
  final String title;

  const ItemTabs({Key key, this.iconData, this.title}) : super(key: key);

  // ItemTabs(this.title, this.iconData)

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        children: [
          Icon(iconData),
          SizedBox(
            width: 10,
          ),
          Text(
            "$title",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
