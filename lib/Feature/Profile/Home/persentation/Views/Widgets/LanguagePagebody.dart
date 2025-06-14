import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:parkify/Core/utlis/Icon_All_app.dart';
import 'package:parkify/Core/utlis/assets.dart';
import 'package:parkify/constant.dart';

class LanguagePagebody extends StatefulWidget {
  const LanguagePagebody({super.key});

  @override
  State<LanguagePagebody> createState() => _LanguagePagebodyState();
}

class _LanguagePagebodyState extends State<LanguagePagebody> {
  List<String> options = ['Arabic', 'English'];
  String currentoption = 'Arabic';
  @override
  Widget build(BuildContext context) {
    var heaight = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        backgroundColor: kprimaryColor,
        title: IconApp(width: width),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                GoRouter.of(context).pop();
              },
              icon: const Icon(
                FontAwesomeIcons.solidSquareCheck,
                color: Colors.black87,
                size: 22,
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          children: [
            Text(
              'Select the Language',
              style: TextStyle(
                  fontFamily: Assets.textfamily,
                  fontSize: 22,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: heaight * 0.01,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RadioListTile(
                    fillColor: WidgetStateProperty.all(Colors.black),
                    title: Text(
                      'Arabic',
                      style: TextStyle(
                        fontFamily: Assets.textfamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    value: options[0],
                    groupValue: currentoption,
                    onChanged: (value) {
                      setState(() {
                        currentoption = value.toString();
                      });
                    }),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RadioListTile(
                    fillColor: WidgetStateProperty.all(Colors.black),
                    title: Text(
                      'English',
                      style: TextStyle(
                        fontFamily: Assets.textfamily,
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    value: options[1],
                    groupValue: currentoption,
                    onChanged: (value) {
                      setState(() {
                        currentoption = value.toString();
                      });
                    }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
