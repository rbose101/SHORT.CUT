import 'package:custom_url_shortner/api/api.dart';
import 'package:custom_url_shortner/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class InputContainer extends StatefulWidget {
  final TextEditingController controller;
  final Function(String) onShorten;
  const new({super.key, required this.controller, required this.onShorten});

  @override
  State<InputContainer> createState() => _InputContainerState();
}

class _InputContainerState extends State<InputContainer> {
  void _submitUrl() async {
    final text = widget.controller.text.trim();
    if (text.isNotEmpty) {
      String? newUrl = await urlGenerator(text);
      if (newUrl != null) {
        widget.onShorten(newUrl);
      } else {
        const SnackBar(
          content: Text("URL copied to clipboard!"),
          duration: Duration(seconds: 2),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: (p0) => mobileInputContainer(widget.controller),
      desktop: (p0) => desktopInputContainer(widget.controller),
      tablet: (p0) => desktopInputContainer(widget.controller),
    );
  }

  Widget desktopInputContainer(TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(20),
      //height: w! / 3.3,
      width: w! * 0.8,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black45, spreadRadius: 1),
        ],
        borderRadius: BorderRadius.circular(10),
      ),

      child: Center(
        child: Column(
          children: [
            Text(
              "Shorten Your Long Links",
              style: TextStyle(
                fontSize: w! * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: w! * 0.03),
            SizedBox(
              //height: w! * 0.05,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: ShapedInputBorder(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  hintText: "Enter The URL",
                  hintStyle: TextStyle(wordSpacing: 0.1),
                ),
              ),
            ),
            SizedBox(height: w! * 0.025),
            SizedBox(
              width: double.infinity,
              height: w! * 0.05,
              child: ElevatedButton(
                onPressed: _submitUrl,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  "Shorten",
                  style: TextStyle(color: Colors.white, fontSize: w! * 0.02),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget mobileInputContainer(TextEditingController controller) {
    return Container(
      padding: EdgeInsets.all(10),
      //height: w! * 0.5,
      width: w! * 0.8,
      decoration: BoxDecoration(
        color: boxColor,
        boxShadow: [
          BoxShadow(blurRadius: 10, color: Colors.black45, spreadRadius: 1),
        ],
        borderRadius: BorderRadius.circular(10),
      ),

      child: Center(
        child: Column(
          children: [
            Text(
              "Shorten Your Long Links",
              style: TextStyle(
                fontSize: w! * 0.05,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: w! * 0.03),
            SizedBox(
              //height: w! * 0.15,
              child: TextField(
                controller: controller,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  border: ShapedInputBorder(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                  hintText: "Enter The URL",
                  hintStyle: TextStyle(wordSpacing: 0.1),
                ),
              ),
            ),
            SizedBox(height: w! * 0.03),
            SizedBox(
              width: double.infinity,
              height: w! * 0.08,
              child: ElevatedButton(
                onPressed: _submitUrl,
                style: ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                  shape: WidgetStatePropertyAll(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadiusGeometry.circular(10),
                    ),
                  ),
                ),
                child: Text(
                  "Shorten",
                  style: TextStyle(color: Colors.white, fontSize: w! * 0.03),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
