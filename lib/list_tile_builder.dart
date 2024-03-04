import 'package:flutter/material.dart';

Widget listTileBuilder({required String text, required IconData icon}) {
  return InkWell(
    onTap: () {},
    child: ListTile(
      tileColor: Colors.grey[800],
      title: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      leading: Icon(
        icon,
        color: Colors.white,
      ),
    ),
  );
}
