import 'package:flutter/material.dart';
import 'dart:math';
import 'main.dart';
import 'chat_page.dart';

ListView mainChatBuilder() {
  return ListView.separated(
    itemBuilder: (context, index) {
      return chatBuilder(
        text: "Chat ${index + 1}",
        index: index,
      );
    },
    separatorBuilder: (context, index) {
      return const Divider(
        thickness: 1,
        indent: 65,
        color: Colors.black,
      );
    },
    itemCount: peopleCounts,
  );
}

Widget chatBuilder({required String text, required int index}) {
  Random random = Random();
  return Builder(builder: (context) {
    return InkWell(
      onTap: () {},
      child: Dismissible(
        onDismissed: (direction) {},
        key: Key(index.toString()),
        direction: DismissDirection.endToStart,
        background: Padding(
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 350,
                color: Colors.blue[900],
                alignment: Alignment.centerRight,
                child: const Padding(
                  padding: EdgeInsets.only(
                    right: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          right: 10,
                        ),
                        child: Text(
                          'Archive',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Icon(
                        Icons.archive_rounded,
                        color: Colors.white,
                        size: 36,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        child: ListTile(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => const ChatPage(),
              ),
            );
          },
          leading: CircleAvatar(
            backgroundColor: ColorsChatSaver.getColor(index),
          ),
          title: Text(
            text,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 25,
            ),
          ),
          subtitle: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 10,
              ),
              Text(
                'Chat info today',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
              ),
            ],
          ),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            //mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                RandomClock.randomTime(),
                style: const TextStyle(
                  color: Colors.white54,
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: Colors.grey[700],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: 3,
                    bottom: 3,
                  ),
                  child: Text(
                    random.nextInt(100).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              // Chip(
              //   label: Text(
              //     random.nextInt(100).toString(),
              //     style: const TextStyle(
              //       color: Colors.white,
              //       fontSize: 16,
              //     ),
              //   ),
              //   backgroundColor: Colors.grey[700],
              // ),
            ],
          ),
        ),
      ),
    );
  });
}

int peopleCounts = 40;

class ColorsChatSaver {
  static List<Color> colors = List<Color>.generate(
    peopleCounts,
    (index) => ProfileColor.getColor(),
  );
  static Color getColor(int index) {
    return colors[index];
  }
}
