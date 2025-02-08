import 'package:flutter/material.dart';
import 'package:model1/screens/const.dart';

class HomePageAppbar extends StatelessWidget implements PreferredSizeWidget {
  const HomePageAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: KAppbarbgColor,
      title: const Text("vegetables & fruits "),
      leading: IconButton(
        onPressed: () {}, 
        icon: const Icon(Icons.arrow_back_ios),
      ),
      actions: [
        IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
