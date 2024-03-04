import 'dart:math';
import 'constant.dart';
import 'package:flutter/material.dart';
import 'main.dart';
import 'chat_builder.dart';

class BodyPage extends StatefulWidget {
  const BodyPage({super.key});

  @override
  State<BodyPage> createState() => _BodyPageState();
}

class _BodyPageState extends State<BodyPage> {
  @override
  Widget build(BuildContext context) {
    return mainChatBuilder();
  }
}

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 7,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: TextField(
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              textBaseline: TextBaseline.alphabetic,
            ),
            cursorColor: Colors.lightBlue,
            decoration: InputDecoration(
              border: InputBorder.none,
              fillColor: Colors.grey[850],
              filled: true,
              hintText: 'Search',
              hintStyle: const TextStyle(
                color: Colors.white38,
                textBaseline: TextBaseline.alphabetic,
                fontSize: 18,
              ),
            ),
          ),
          bottom: TabBar(
            isScrollable: true,
            indicatorPadding: const EdgeInsets.only(
              left: 18,
              right: 18,
            ),
            indicatorWeight: 4,
            tabs: tabsList,
          ),
        ),
        body: allWidget,
      ),
    );
  }

  final Widget allWidget = TabBarView(
    children: [
      chatTabBuilder(),
      Builder(
        builder: (context) {
          return mediaBuilder(context);
        },
      ),
      downloadBuilder(),
      linkBuilder(),
      fileDownloadBuilder(
        sender: 'Person',
        date: true,
      ),
      musicBuilder(),
      voiceTabBuilder(),
    ],
  );
}

List<Widget> tabsList = <Widget>[
  const Tab(
    text: 'Chats',
  ),
  const Tab(
    text: 'Media',
  ),
  const Tab(
    text: 'Downloads',
  ),
  const Tab(
    text: 'Links',
  ),
  const Tab(
    text: 'Files',
  ),
  const Tab(
    text: 'Music',
  ),
  const Tab(
    text: 'Voice',
  ),
];

MediaQuery mediaBuilder(BuildContext context) {
  return MediaQuery.removePadding(
    context: context,
    removeTop: true,
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        crossAxisCount: 3,
      ),
      itemCount: 120,
      itemBuilder: (BuildContext context, int index) {
        return InkWell(
          onTap: () {},
          child: Card(
            color: MediaColorSaver().getColor(index),
            child: Center(
              child: Text(
                '${index + 1}',
              ),
            ),
          ),
        );
      },
    ),
  );
}

Container voiceTabBuilder() {
  return Container(
    color: Colors.grey[850],
    child: ListView.separated(
      itemBuilder: (context, index) {
        return voiceBuilder(index);
      },
      separatorBuilder: (context, index) {
        return const Divider(
          thickness: 2,
          indent: 75,
        );
      },
      itemCount: voiceCount,
    ),
  );
}

int peopleRowCount = 15;
int peopleColumnCount = 25;
Widget chatTabBuilder() {
  return Column(
    children: [
      Flexible(
        flex: 8,
        child: ListView.separated(
          padding: const EdgeInsets.only(
            left: 8,
            right: 8,
            top: 8,
          ),
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return memberBuilder(index);
          },
          separatorBuilder: (context, index) {
            return const SizedBox(
              width: 20,
            );
          },
          itemCount: peopleRowCount,
        ),
      ),
      Flexible(
        flex: 4,
        child: Container(
          color: Colors.black,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  'Recent',
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'Clear All',
                  style: TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      Flexible(
        flex: 60,
        child: Container(
          color: Colors.grey[850],
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemBuilder: (BuildContext context, int index) {
              return peopleBuilder(index);
            },
            itemCount: peopleColumnCount,
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                thickness: 0.6,
                indent: 64,
                color: Colors.black,
              );
            },
          ),
        ),
      ),
    ],
  );
}

Column downloadBuilder() {
  return Column(
    children: [
      Flexible(
        flex: 1,
        fit: FlexFit.loose,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Padding(
              padding: EdgeInsets.only(
                left: 8,
              ),
              child: Padding(
                padding: EdgeInsets.only(
                  right: 8,
                ),
                child: Text(
                  'Downloading',
                  style: TextStyle(
                    color: Colors.white54,
                  ),
                ),
              ),
            ),
            TextButton(
              onPressed: () {},
              child: const Text(
                'Resume all',
                style: TextStyle(
                  color: Colors.white54,
                ),
              ),
            ),
          ],
        ),
      ),
      Flexible(
        flex: 10,
        child: fileDownloadBuilder(
          sender: 'Chat',
          date: false,
        ),
      ),
    ],
  );
}

Container linkBuilder() {
  return Container(
    color: Colors.grey[850],
    child: ListView.separated(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      itemBuilder: (context, index) {
        return Container(
          color: Colors.grey[850],
          child: ListTile(
            subtitle: const Text(
              'https://t.me/joinchat/Bhz_2Aw8u/',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
            trailing: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 1),
                  child: Text(
                    RandomClock.randomTime(),
                    style: const TextStyle(
                      color: Colors.white38,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 1),
                  child: Text(
                    'Download info',
                    style: TextStyle(
                      color: Colors.white38,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                )
              ],
            ),
            leading: Container(
              decoration: BoxDecoration(
                color: Colors.grey[800],
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              height: 50,
              width: 50,
              alignment: Alignment.center,
              child: const Text(
                'T',
                style: TextStyle(
                  color: Colors.white38,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
            title: const Text(
              'T',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return const Divider(
          color: Colors.black,
          thickness: 1,
          indent: 72,
        );
      },
      itemCount: 25,
    ),
  );
}

Widget fileDownloadBuilder({required String sender, required bool date}) {
  return ListView.separated(
    itemBuilder: (context, index) {
      return downloadRowBuilder(date, sender, index);
    },
    separatorBuilder: (context, index) {
      return const Divider(
        height: 3,
        thickness: 1.5,
        color: Colors.black,
        indent: 60,
      );
    },
    itemCount: downloadColorCountSaver,
  );
}

Widget downloadRowBuilder(bool date, String sender, int index) {
  return InkWell(
    onTap: () {},
    child: ListTile(
      tileColor: Colors.grey[850],
      leading: !date
          ? CircleAvatar(
              backgroundColor: DownloadColorSaver().getColor(index),
            )
          : Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: DownloadColorSaver().getColor(index),
              ),
            ),
      title: Text(
        '$sender ${index + 1}',
        style: const TextStyle(
          color: Colors.white,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: Row(
        children: [
          const Icon(
            Icons.download,
            color: Colors.lightBlue,
            size: 18,
          ),
          Text(
            " ${getNumber()}",
            style: const TextStyle(color: Colors.white54),
          ),
          const Text(
            '  -  ',
            style: TextStyle(
              color: Colors.white60,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          Text(
            'Person ${index + 1}',
            style: const TextStyle(
              color: Colors.white54,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      trailing: date
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 0,
                  ),
                  child: Text(
                    getDay(),
                    style: const TextStyle(
                      color: Colors.white54,
                      fontWeight: FontWeight.bold,
                      fontSize: 13.5,
                    ),
                  ),
                ),
              ],
            )
          : const Column(
              children: [],
            ),
    ),
  );
}

String getName({required int index}) {
  names.shuffle();
  return names[index];
}

String getNumber([int maxSize = 100]) {
  Random random = Random();
  return "${random.nextInt(maxSize).ceil()}${random.nextDouble().toStringAsFixed(2)} MB";
}

String getDay() {
  days.shuffle();
  return days[3];
}

Widget musicBuilder() {
  return ListView.separated(
    itemBuilder: (context, index) {
      return InkWell(
        onTap: () {},
        child: ListTile(
          tileColor: Colors.grey[850],
          leading: SizedBox(
            height: 55,
            width: 55,
            child: Stack(
              children: [
                SizedBox(
                  width: 50,
                  height: 50,
                  child: CircleAvatar(
                    backgroundColor: MusicColorSaver().getColor(index),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(
                    height: 25,
                    width: 25,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.blue,
                    ),
                    child: const Icon(
                      Icons.arrow_downward,
                      color: Colors.white,
                      size: 17,
                    ),
                  ),
                ),
              ],
            ),
          ),
          title: Text(
            'Singer ${index + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Row(
            children: [
              const Icon(
                Icons.download,
                color: Colors.lightBlue,
                size: 18,
              ),
              Text(
                " ${getNumber(3)}",
                style: const TextStyle(color: Colors.white54),
              ),
              const Text(
                '  -  ',
                style: TextStyle(
                  color: Colors.white60,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                'Studio ${index + 1}',
                style: const TextStyle(
                  color: Colors.white54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 0,
                ),
                child: Text(
                  RandomClock.randomTime(),
                  style: const TextStyle(
                    color: Colors.white54,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
    separatorBuilder: (context, index) {
      return const Divider(
        height: 3,
        thickness: 1.5,
        color: Colors.black,
        indent: 60,
      );
    },
    itemCount: 25,
  );
}

Widget memberBuilder(int index) {
  return InkWell(
    onTap: () {},
    child: Container(
      color: Colors.grey[900],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            backgroundColor: PeopleRowColorSaver().getColor(index),
            child: Text(
              getName(index: index),
            ),
          ),
          Text(
            'Name ${index + 1}',
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 14.5,
            ),
          ),
        ],
      ),
    ),
  );
}

Widget peopleBuilder(int index) {
  return InkWell(
    onTap: () {},
    splashColor: Colors.grey[800],
    splashFactory: InkSplash.splashFactory,
    child: Container(
      height: 60,
      color: Colors.grey[850],
      child: ListTile(
        title: Text(
          "Person ${index + 1}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          'last seen at ${RandomClock.randomTime()}',
          style: const TextStyle(
            color: Colors.white54,
          ),
        ),
        leading: CircleAvatar(
          backgroundColor: PeopleRowColorSaver().getColor(index),
          child: Text(
            getName(index: index),
          ),
        ),
      ),
    ),
  );
}

Widget voiceBuilder(int index) {
  return InkWell(
    onTap: () {},
    child: ListTile(
      leading: Container(
        alignment: Alignment.center,
        height: 55,
        width: 55,
        child: Stack(
          alignment: Alignment.center,
          children: [
            CircleAvatar(
              backgroundColor: VoiceColorSaver().getColor(index),
            ),
            const Center(
              child: Icon(
                Icons.arrow_downward_rounded,
                color: Colors.white,
                size: 25,
              ),
            )
          ],
        ),
      ),
      trailing: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 2,
            ),
            child: Text(
              RandomClock.randomTime(),
              style: const TextStyle(
                color: Colors.white54,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          )
        ],
      ),
      tileColor: Colors.grey[850],
      title: Text(
        "Person ${index + 1}",
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 22,
        ),
      ),
      subtitle: Text(
        RandomTimer.randomTime(),
        style: const TextStyle(
          color: Colors.white38,
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}

int mediaItemCount = 120;

class MediaColorSaver {
  static List<Color> listColorSaver = List<Color>.generate(
    mediaItemCount,
    (index) => ProfileColor.getColor(),
  );

  Color getColor(int index) {
    return listColorSaver[index];
  }
}

int musicColorCout = 30;

class MusicColorSaver {
  static List<Color> listColorSaver = List<Color>.generate(
    mediaItemCount,
    (index) => ProfileColor.getColor(),
  );

  Color getColor(int index) {
    return listColorSaver[index];
  }
}

class RandomTimer {
  static Random random = Random();
  static String randomTime() {
    int mins = random.nextInt(8);
    int seconds = random.nextInt(60);
    String times = '';
    if (seconds < 10) {
      times = '0$seconds';
    } else {
      times = seconds.toString();
    }
    return "$mins:$times";
  }
}

int downloadColorCountSaver = 35;

class DownloadColorSaver {
  static List<Color> listColorSaver = List<Color>.generate(
    downloadColorCountSaver,
    (index) => ProfileColor.getColor(),
  );

  Color getColor(int index) {
    return listColorSaver[index];
  }
}

int voiceCount = 40;

class VoiceColorSaver {
  static List<Color> listColorSaver = List<Color>.generate(
    voiceCount,
    (index) => ProfileColor.getColor(),
  );

  Color getColor(int index) {
    return listColorSaver[index];
  }
}

class PeopleRowColorSaver {
  static List<Color> listColorSaver = List<Color>.generate(
    voiceCount,
    (index) => ProfileColor.getColor(),
  );

  Color getColor(int index) {
    return listColorSaver[index];
  }
}

class PeopleColumnColorSaver {
  static List<Color> listColorSaver = List<Color>.generate(
    voiceCount,
    (index) => ProfileColor.getColor(),
  );

  Color getColor(int index) {
    return listColorSaver[index];
  }
}
