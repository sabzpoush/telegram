import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_application_interactive/main.dart';

// import 'new_mesasage_page.dart';

class NewMessagePageBody extends StatefulWidget {
  const NewMessagePageBody({super.key});

  @override
  State<NewMessagePageBody> createState() => _NewMessagePageBodyState();
}

class _NewMessagePageBodyState extends State<NewMessagePageBody> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //top
        topPage(),
        //mid
        midPage(),
        //bottom
        bottomPage(),
      ],
    );
  }
}

Widget listOptionBuilder({required IconData icon, required String text}) {
  return InkWell(
    onTap: () {},
    child: ListTile(
      leading: Icon(
        icon,
        color: Colors.white54,
      ),
      title: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 20,
        ),
      ),
    ),
  );
}

Flexible topPage() {
  return Flexible(
    flex: 5,
    child: ListView(
      children: [
        listOptionBuilder(icon: Icons.people, text: 'New Group'),
        listOptionBuilder(icon: Icons.lock, text: 'New Secret Chat'),
        listOptionBuilder(icon: Icons.chat, text: 'New Channel'),
      ],
    ),
  );
}

Flexible midPage() {
  return Flexible(
    flex: 1,
    child: Container(
      color: Colors.black,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Sorted by last sseen time',
              style: TextStyle(
                color: Colors.white54,
                fontSize: 16,
              ),
            ),
          )
        ],
      ),
    ),
  );
}

Flexible bottomPage() {
  return Flexible(
    flex: 15,
    child: ListView.builder(
      itemCount: personCount ~/ personCount,
      itemBuilder: (context, index) {
        return Column(
          children: listItem,
        );
      },
    ),
  );
}

List<Widget> listItem = List<Widget>.generate(
  personCount,
  (index) => listPeopleBuilder(
    index: index,
    name: 'Perosn',
    multipleBuildigMember: true,
  ),
);

Widget listPeopleBuilder({int index = 0, String name = 'Person', required bool multipleBuildigMember}) {
  Random random = Random();
  return multipleBuildigMember
      ? InkWell(
          onTap: () {},
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: PersonColorsSaver.getColor(index),
            ),
            title: Text(
              '$name ${index + 1}',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            subtitle: Text(
              "last seen at ${RandomClock.randomTime()}",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        )
      : InkWell(
          onTap: () {},
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: PersonColorsSaver.getColor(
                random.nextInt(35),
              ),
            ),
            title: Text(
              name,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
            ),
            subtitle: Text(
              "last seen at ${RandomClock.randomTime()}",
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        );
}

int personCount = 25;

class PersonColorsSaver {
  static List<Color> listColors = List<Color>.generate(40, (index) => ProfileColor.getColor());
  static Color getColor(int index) {
    return listColors[index];
  }
}
