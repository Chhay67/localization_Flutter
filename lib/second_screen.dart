import 'package:flutter/material.dart';
import 'package:localizationwithprovider/localization.dart';
import 'package:provider/provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var language = Provider.of<LanguagesProvider>(context,listen: false);
    return Scaffold(
        appBar: AppBar(
          title: Text(language.translations['hello'].toString()),
        ),
    );
  }
}
