import 'package:flutter/material.dart';
import 'package:model1/screens/homeScreenPage.dart/Appbar.dart';
import 'package:model1/screens/homeScreenPage.dart/body.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const HomePageAppbar(),
      body: HomePageBody()
      
    );
  }
}
