import 'package:custom_url_shortner/components/constants.dart';
import 'package:custom_url_shortner/widgets/appbar.dart';
import 'package:custom_url_shortner/widgets/input_container.dart';
import 'package:custom_url_shortner/widgets/output_container.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const new({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController inputController = TextEditingController();
  String shortenedUrl = '';

  @override
  void dispose() {
    inputController.dispose();
    super.dispose();
  }

  void handleShorten(String newUrl) {
    setState(() {
      urlData = newUrl;
      shortenedUrl = newUrl; // Updates your global constant if still needed elsewhere // Triggers OutputContainer rebuild
    });
  }

  @override
  Widget build(BuildContext context) {
    h = MediaQuery.of(context).size.height;
    w = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: appBar,
      body: Container(
        color: bgColor,
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 30),
              InputContainer(
                controller: inputController,
                onShorten: handleShorten,
              ),
              SizedBox(height: 20),
              OutputContainer(data: urlData),
            ],
          ),
        ),
      ),
    );
  }
}
