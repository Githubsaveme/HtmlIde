import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController _controller;
  late TextEditingController _textEditingController;
  String text = "";
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _textEditingController = TextEditingController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: AnimatedTextKit(
          animatedTexts: [
            TypewriterAnimatedText('Practice You\'re HTML Code',
                textStyle: const TextStyle(fontWeight: FontWeight.bold),
                speed: const Duration(milliseconds: 100)),
          ],
          totalRepeatCount: 3,
          displayFullTextOnTap: true,
          stopPauseOnTap: false,
        ),
        backgroundColor: Colors.green,
        bottom: TabBar(controller: _controller, tabs: const [
          Tab(
            child: Text(
              "Editing",
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),
            ),
          ),
          Tab(
            child: Text(
              'Preview',
              style: TextStyle(color: Colors.black,fontWeight: FontWeight.w700),
            ),
          )
        ]),
      ),
      body: TabBarView(controller: _controller, children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: TextField(
            maxLines: null,
            keyboardType: TextInputType.multiline,
            controller: _textEditingController,
            decoration: const InputDecoration(
              border: InputBorder.none,
              hintText: "INPUT TEXT",
            ),
            onChanged: (String text) {
              setState(() {
                this.text = text;
              });
            },
          ),
        ),
        Container(
            margin: const EdgeInsets.all(20),
            child: MarkdownBody(
              data: text,
            )),
      ]),
    );
  }
}
