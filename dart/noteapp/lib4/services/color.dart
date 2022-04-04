import 'package:flutter/material.dart';

final colorList = [
  const Color(0xffffffff), // classic white
  const Color(0xfff28b81), // light pink
  const Color(0xfff7bd02), // yellow
  const Color(0xfffbf476), // light yellow
  const Color(0xffcdff90), // light green
  const Color(0xffa7feeb), // turquoise
  const Color(0xffcbf0f8), // light cyan
  const Color(0xffafcbfa), // light blue
  const Color(0xffd7aefc), // plum
  const Color(0xfffbcfe9), // misty rose
  const Color(0xffe6c9a9), // light brown
  const Color(0xffe9eaee) // light gray
];

int colorValue = const Color(0xffffffff).value;

class ColorSlider extends StatefulWidget {
  const ColorSlider({Key? key}) : super(key: key);

  @override
  State<ColorSlider> createState() => _ColorSliderState();
}

class _ColorSliderState extends State<ColorSlider> {
  //
  Widget? isAvatar(int index) {
    if (colorValue == colorList[index].value) {
      return const Icon(Icons.cloud, color: Colors.black);
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(colorList.length, (index) {
          return Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        colorValue = colorList[index].value;
                      });
                    },
                    child: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.black),
                      child: CircleAvatar(
                        backgroundColor: colorList[index],
                        child: isAvatar(index),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                ],
              ),
            ],
          );
        }),
      ),
    );
  }
}
