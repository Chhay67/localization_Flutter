import 'package:flutter/material.dart';
import 'package:localizationwithprovider/localization.dart';
import 'package:localizationwithprovider/second_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final language = Provider.of<LanguagesProvider>(context,listen: false);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(language.translations['title'].toString()),
          ),
          Center(
            child: Text(language.translations['des'].toString()),
          ),
          ElevatedButton(onPressed: (){
            Provider.of<LanguagesProvider>(context,listen: false).changeLanguage(const Locale('km'));
          }, child:const Text('Khmer')),
          ElevatedButton(onPressed: (){
            Provider.of<LanguagesProvider>(context,listen: false).changeLanguage(const Locale('en'));
          }, child:const Text('English')),
          ElevatedButton(onPressed: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context)=> SecondScreen()));
          }, child: Text('Next to SecondScreen'))
        ],
      ),
    );
  }
}
