import 'package:flutter/material.dart';

class ReadMore extends StatefulWidget {
  const ReadMore({required this.text, this.maxWord = 300});
  final text;
  final maxWord;

  @override
  _ReadMoreState createState() => _ReadMoreState(text, maxWord);
}

class _ReadMoreState extends State<ReadMore> {
  bool isExpanded = false;
  bool isExpander = true;
  String fullText = '0';
  String shortText = '';
  int maxWord = 0;

  void expandedToggle() {
    setState(() {
      isExpanded = !isExpanded;
    });
  }

  _ReadMoreState(text, maxWord) {
    this.fullText = text;
    this.maxWord = maxWord;
    isExpander = fullText.length > maxWord;
    shortingText();
  }
  void shortingText() {
    if (isExpander) {
      while (fullText[maxWord] != ' ') {
        maxWord--;
      }
      shortText = fullText.substring(0, maxWord);
    }
  }

  @override
  Widget build(BuildContext context) {
    return isExpander
        ? Column(
            children: [
              Stack(
                children: [
                  isExpanded ? Text(fullText) : Text(shortText),
                  if (!isExpanded)
                    Positioned.fill(
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                              Color.fromARGB(0, 255, 255, 255),
                              Colors.white
                            ])),
                      ),
                    )
                ],
              ),
              TextButton(
                child: !isExpanded ? Text('READMORE') : Text('COLLAPSE'),
                onPressed: expandedToggle,
              )
            ],
          )
        : Text(fullText);
  }
}
