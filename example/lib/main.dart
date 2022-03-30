import 'package:bulletin/bulletin.dart';
import 'package:flutter/material.dart';

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
          children: [
            const SizedBox(height: 20),
            Center(
              child: Bulletin(
                icon: const Icon(
                  Icons.mic_outlined,
                  size: 20,
                ),
                children: [
                  BulletinItem(
                    text:
                        "1. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
                    onTap: () {},
                  ),
                  BulletinItem(
                    text:
                        "2. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
                    onTap: () {},
                  ),
                  BulletinItem(
                    text:
                        "3. This is a bulletin.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi eget elementum libero.",
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
