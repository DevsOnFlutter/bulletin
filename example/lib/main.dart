import 'package:bulletin/bulletin.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Example",
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Using Different inbuilt attributes of bulletin widget",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            example1(),
            const SizedBox(height: 20),
            example2(),
            const SizedBox(height: 20),
            example3(),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                "Fully Customized bulletin widget",
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(height: 10),
            example4(),
          ],
        ),
      ),
    );
  }

// This is an example where a common icon is used.
// The duration is set to 4 seconds.
  Center example1() {
    return Center(
      child: Bulletin(
        icon: const Icon(
          Icons.mic_outlined,
          size: 20,
        ),
        gapDuration: const Duration(seconds: 4),
        children: [
          BulletinItem(
            text:
                "1. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
            onTap: () {
              debugPrint("OnTap Function called for BulletinItem 1 ");
            },
          ),
          BulletinItem(
            text:
                "2. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
            onTap: () {
              debugPrint("OnTap Function called for BulletinItem 2 ");
            },
          ),
          BulletinItem(
            text:
                "3. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
            onTap: () {
              debugPrint("OnTap Function called for BulletinItem 3 ");
            },
          ),
        ],
      ),
    );
  }

// This is an example where icon is specified in the BulletinItem.
  Center example2() {
    return Center(
      child: Bulletin(
        backgroundColor: const Color(0xffFFF3D0),
        gapDuration: const Duration(seconds: 2),
        children: [
          BulletinItem(
            icon: const Icon(
              Icons.music_note,
              size: 20,
            ),
            text:
                "1. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
            onTap: () {
              debugPrint("OnTap Function called for BulletinItem 1 ");
            },
          ),
          BulletinItem(
            icon: const Icon(
              Icons.mic_sharp,
              size: 20,
            ),
            text:
                "2. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
            onTap: () {
              debugPrint("OnTap Function called for BulletinItem 2 ");
            },
          ),
          BulletinItem(
            icon: const Icon(
              Icons.masks_rounded,
              size: 20,
            ),
            text:
                "3. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
            onTap: () {
              debugPrint("OnTap Function called for BulletinItem 3 ");
            },
          ),
        ],
      ),
    );
  }

  Center example3() {
    return Center(
      child: Bulletin(
        backgroundColor: const Color.fromARGB(255, 132, 210, 252),
        gapDuration: const Duration(seconds: 2),
        showCloseButton: false,
        children: [
          BulletinItem(
            icon: const Icon(
              Icons.music_note,
              size: 20,
            ),
            text:
                "1. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
            onTap: () {
              debugPrint("OnTap Function called for BulletinItem 1 ");
            },
          ),
          BulletinItem(
            icon: const Icon(
              Icons.mic_sharp,
              size: 20,
            ),
            text:
                "2. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
            onTap: () {
              debugPrint("OnTap Function called for BulletinItem 2 ");
            },
          ),
          BulletinItem(
            icon: const Icon(
              Icons.masks_rounded,
              size: 20,
            ),
            text:
                "3. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
            onTap: () {
              debugPrint("OnTap Function called for BulletinItem 3 ");
            },
          ),
        ],
      ),
    );
  }

  Center example4() {
    return Center(
      child: Bulletin(
        backgroundColor: const Color.fromARGB(255, 255, 229, 208),
        gapDuration: const Duration(seconds: 3),
        textStyle: GoogleFonts.getFont(
          "Red Hat Mono",
          textStyle: const TextStyle(fontSize: 12),
        ),
        children: [
          BulletinItem(
            icon: const Icon(
              Icons.mic_sharp,
              size: 20,
            ),
            text:
                "2. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
            onTap: () {
              debugPrint("OnTap Function called for BulletinItem 2 ");
            },
          ),
          BulletinItem(
            icon: const Icon(
              Icons.music_note,
              size: 20,
            ),
            text:
                "1. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
            onTap: () {
              debugPrint("OnTap Function called for BulletinItem 1 ");
            },
          ),
          BulletinItem(
            icon: const Icon(
              Icons.masks_rounded,
              size: 20,
            ),
            text:
                "3. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
            onTap: () {
              debugPrint("OnTap Function called for BulletinItem 3 ");
            },
          ),
        ],
        closeButton: Container(
          padding: const EdgeInsets.all(4),
          margin: const EdgeInsets.all(3),
          child: const Icon(
            Icons.close_rounded,
            size: 12,
            color: Colors.black,
          ),
          decoration: const BoxDecoration(
            color: Colors.deepOrangeAccent,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
        ),
      ),
    );
  }
}
