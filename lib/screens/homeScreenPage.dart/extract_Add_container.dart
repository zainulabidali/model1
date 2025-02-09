import 'package:flutter/material.dart';

class PositionedAddContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 130,
      right: 1,
      child: Container(
        height: 30,
        width: 60,
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.green),
        ),
        child: const Center(
          child: Text(
            "ADD",
            style: TextStyle(
              color: Colors.green,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
