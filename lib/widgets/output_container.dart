import 'package:custom_url_shortner/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter/services.dart';

class OutputContainer extends StatefulWidget {
  final String data;
  const new({super.key, required this.data});

  @override
  State<OutputContainer> createState() => _OutputContainerState();
}

class _OutputContainerState extends State<OutputContainer> {
  bool isCopied = false;

  Future<void> _copyToClipboard(String text) async {
    if (text.isEmpty) return;

    await Clipboard.setData(ClipboardData(text: text));

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("URL copied to clipboard!"),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      desktop: (p0) => desktopMobileContainer(widget.data),
      mobile: (p0) => mobileOutputContainer(widget.data),
      tablet: (p0) => desktopMobileContainer(widget.data),
    );
  }

  Widget mobileOutputContainer(String shortUrl) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: w! / 15),
      //width: w! / 2.5,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(blurRadius: 10, spreadRadius: 1, color: Colors.black54),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 0.2),
              ),
            ),
            child: Text(
              "Your Shortened URL",
              style: TextStyle(color: txtColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 20),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(shortUrl),
                ),
              ),
              SizedBox(width: 5),
              SizedBox(
                child: ElevatedButton(
                  onPressed: () => _copyToClipboard(shortUrl),
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(EdgeInsets.zero),
                    backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),
                  ),
                  child: Text("Copy", style: TextStyle(color: Colors.white)),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget desktopMobileContainer(String shortUrl) {
    return Container(
      width: w! / 1.79,
      decoration: BoxDecoration(
        color: boxColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(blurRadius: 10, spreadRadius: 1, color: Colors.black54),
        ],
      ),
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(color: Colors.black, width: 0.2),
              ),
            ),
            child: Text(
              "Your Shortened URL",
              style: TextStyle(color: txtColor, fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Text(shortUrl),
                ),
              ),
              SizedBox(width: 5),
              SizedBox(
                //height: 50,
                //width: 100,
                child: ElevatedButton(
                  onPressed: () => _copyToClipboard(shortUrl),
                  style: ButtonStyle(
                    backgroundColor: WidgetStatePropertyAll(Colors.blueAccent),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadiusGeometry.circular(10),
                      ),
                    ),
                  ),
                  child: Text(
                    "Copy",
                    style: TextStyle(color: Colors.white, fontSize: w! * 0.015),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
