import 'dart:math';

import 'package:flutter/material.dart';
import 'main.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

TextEditingController textEditingController = TextEditingController();
Random random = Random();

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Flexible(
            flex: 10,
            child: Container(
              color: Colors.grey[800],
              child: Expanded(
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const FirstPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      splashRadius: 10,
                    ),
                    Expanded(
                      child: ListTile(
                        leading: const CircleAvatar(
                          backgroundColor: Colors.orange,
                        ),
                        title: const Text(
                          'Amir Reza',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                          ),
                        ),
                        subtitle: const Text(
                          '350.2K subscribers',
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 13,
                          ),
                        ),
                        trailing: Padding(
                          padding: const EdgeInsets.only(
                            top: 4,
                            left: 30,
                          ),
                          child: IconButton(
                            padding: const EdgeInsets.only(
                              left: 15,
                            ),
                            onPressed: () {},
                            icon: const Icon(
                              Icons.more_vert,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
          Flexible(
            flex: 49,
            child: Container(
              color: Colors.grey[900],
              child: ListView(
                reverse: true,
                //mainAxisAlignment: random.nextInt(100) % 2 == 0 ? MainAxisAlignment.start : MainAxisAlignment.end,
                children: messageList,
              ),
            ),
          ),
          Flexible(
            flex: 4,
            child: Container(
              color: Colors.transparent,
              child: Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10, bottom: 10),
                      child: SizedBox(
                        height: 45,
                        width: 320,
                        child: TextField(
                          maxLines: 4,
                          controller: textEditingController,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(30)),
                              borderSide: BorderSide(
                                color: Colors.white70,
                                width: 1,
                              ),
                            ),
                            filled: true,
                            fillColor: Colors.grey[700],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        bottom: 15,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            messageList.add(
                              messageBuilder(
                                message: textEditingController.text.toString(),
                              ),
                            );
                          });
                        },
                        icon: const Icon(
                          Icons.send,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

List<Widget> messageList = [
  messageBuilder(message: 'Salam'),
];
Widget messageBuilder({
  required String message,
}) {
  return Align(
    alignment: random.nextInt(20) % 2 == 0 ? Alignment.bottomLeft : Alignment.bottomRight,
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: UnconstrainedBox(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.deepPurpleAccent[100],
            borderRadius: BorderRadius.circular(30),
          ),
          padding: const EdgeInsets.only(
            top: 12,
            bottom: 12,
            left: 20,
            right: 20,
          ),
          child: Text(
            message.toString().trim(),
            style: const TextStyle(
              color: Colors.white,
              fontSize: 21,
            ),
          ),
        ),
      ),
    ),
  );
}
